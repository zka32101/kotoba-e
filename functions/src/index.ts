import * as admin from "firebase-admin";
import { onCall, HttpsError } from "firebase-functions/v2/https";
import { onSchedule } from "firebase-functions/v2/scheduler";

admin.initializeApp();
const db = admin.firestore();

// ── SRS: 毎朝クイズキューを事前計算 ──────────────────────────
// Cloud Scheduler: 毎朝 6:00 JST
export const initDailyQuizQueue = onSchedule(
  { schedule: "0 21 * * *", timeZone: "UTC" }, // 21:00 UTC = 6:00 JST
  async () => {
    const today = new Date().toISOString().split("T")[0];
    const usersSnapshot = await db.collection("users").get();

    const batch = db.batch();
    let batchCount = 0;

    for (const userDoc of usersSnapshot.docs) {
      const userId = userDoc.id;

      // 今日のキューが既にある場合はスキップ
      const existingQueue = await db
        .collection("todayQuizQueue")
        .where("userId", "==", userId)
        .where("date", "==", today)
        .limit(1)
        .get();

      if (!existingQueue.empty) continue;

      // nextReviewDate <= 今日 の単語を取得（最大5問）
      const reviewDue = await db
        .collection("userSearchHistory")
        .where("userId", "==", userId)
        .where(
          "nextReviewDate",
          "<=",
          admin.firestore.Timestamp.fromDate(new Date())
        )
        .orderBy("nextReviewDate")
        .limit(5)
        .get();

      // 5問未満の場合は頻出単語で補完
      let words = reviewDue.docs.map((d) => ({
        wordId: d.data().wordId as string,
        wordName: d.data().wordName as string,
      }));

      if (words.length < 5) {
        const neededCount = 5 - words.length;
        const existingWordIds = words.map((w) => w.wordId);
        const popular = await db
          .collection("words")
          .orderBy("frequency", "desc")
          .limit(neededCount + existingWordIds.length)
          .get();

        const fillWords = popular.docs
          .filter((d) => !existingWordIds.includes(d.id))
          .slice(0, neededCount)
          .map((d) => ({
            wordId: d.id,
            wordName: d.data().wordName as string,
          }));
        words = [...words, ...fillWords];
      }

      // キューに追加
      words.forEach((word, index) => {
        const docId = `${today}_${userId}_${index}`;
        const ref = db.collection("todayQuizQueue").doc(docId);
        batch.set(ref, {
          date: today,
          userId,
          wordId: word.wordId,
          wordName: word.wordName,
          questionIndex: index,
          createdAt: admin.firestore.FieldValue.serverTimestamp(),
        });
        batchCount++;
      });

      // Firestore batch は 500 件まで
      if (batchCount >= 450) {
        await batch.commit();
        batchCount = 0;
      }
    }

    if (batchCount > 0) await batch.commit();
    console.log(`Daily quiz queue initialized for ${usersSnapshot.size} users.`);
  }
);

// ── バッジ判定: クイズ回答後に呼び出す ──────────────────────
export const checkAchievements = onCall(async (request) => {
  if (!request.auth) throw new HttpsError("unauthenticated", "Login required");
  const userId = request.auth.uid;

  const [historySnap, quizSnap, userAchievementsSnap] = await Promise.all([
    db
      .collection("userSearchHistory")
      .where("userId", "==", userId)
      .count()
      .get(),
    db
      .collection("userQuizResults")
      .where("userId", "==", userId)
      .where("correctAnswer", "==", true)
      .count()
      .get(),
    db
      .collection("userAchievements")
      .where("userId", "==", userId)
      .get(),
  ]);

  const totalWords = historySnap.data().count;
  const correctQuiz = quizSnap.data().count;
  const unlocked = new Set(
    userAchievementsSnap.docs.map((d) => d.data().achievementId as string)
  );

  const batch = db.batch();
  const newAchievements: string[] = [];

  const grant = (achievementId: string) => {
    if (!unlocked.has(achievementId)) {
      const docId = `${userId}_${achievementId}`;
      batch.set(db.collection("userAchievements").doc(docId), {
        userId,
        achievementId,
        unlockedAt: admin.firestore.FieldValue.serverTimestamp(),
        notified: false,
      });
      newAchievements.push(achievementId);
    }
  };

  if (totalWords >= 100) grant("achievement_words_100");
  if (correctQuiz >= 10) grant("achievement_quiz_10correct");

  // ストリーク判定
  const streak = await _calcStreak(userId);
  if (streak >= 7) grant("achievement_streak_7days");
  if (streak >= 30) grant("achievement_streak_30days");

  if (newAchievements.length > 0) await batch.commit();

  return { newAchievements, streak };
});

// ── オンデマンド: クイズキュー生成 ──────────────────────────
// アプリ起動時にユーザーが明示的に今日のキューを要求した場合に呼ぶ。
export const generateQuizQueue = onCall(async (request) => {
  if (!request.auth) throw new HttpsError("unauthenticated", "Login required");
  const userId = request.auth.uid;
  const count = Math.min((request.data.count as number) ?? 10, 20);

  const today = new Date().toISOString().split("T")[0];

  // 復習期限が来た単語（SRS due）
  const reviewDue = await db
    .collection("userSearchHistory")
    .where("userId", "==", userId)
    .where(
      "nextReviewDate",
      "<=",
      admin.firestore.Timestamp.fromDate(new Date())
    )
    .orderBy("nextReviewDate")
    .limit(count)
    .get();

  let words: Array<{ wordId: string; wordName: string; isReview: boolean }> =
    reviewDue.docs.map((d) => ({
      wordId: d.data().wordId as string,
      wordName: d.data().wordName as string,
      isReview: true,
    }));

  // 不足分は頻出単語（未学習優先）で補完
  if (words.length < count) {
    const neededCount = count - words.length;
    const existingWordIds = words.map((w) => w.wordId);

    const popular = await db
      .collection("words")
      .orderBy("frequency", "desc")
      .limit(neededCount + existingWordIds.length + 10)
      .get();

    const fillWords = popular.docs
      .filter((d) => !existingWordIds.includes(d.id))
      .slice(0, neededCount)
      .map((d) => ({
        wordId: d.id,
        wordName: d.data().wordName as string,
        isReview: false,
      }));

    words = [...words, ...fillWords];
  }

  return { queue: words, date: today };
});

// ── ストリーク更新: 当日初回学習時に呼ぶ ─────────────────────
export const updateStreak = onCall(async (request) => {
  if (!request.auth) throw new HttpsError("unauthenticated", "Login required");
  const userId = request.auth.uid;

  const streak = await _calcStreak(userId);

  await db.collection("users").doc(userId).update({
    currentStreak: streak,
    lastStudyDate: admin.firestore.FieldValue.serverTimestamp(),
    updatedAt: admin.firestore.FieldValue.serverTimestamp(),
  });

  return { streak, updatedAt: new Date().toISOString() };
});

// ── ストリーク計算 ─────────────────────────────────────────
async function _calcStreak(userId: string): Promise<number> {
  const results = await db
    .collection("userQuizResults")
    .where("userId", "==", userId)
    .orderBy("quizDate", "desc")
    .limit(60)
    .get();

  if (results.empty) return 0;

  const dates = new Set<string>();
  results.docs.forEach((d) => {
    const ts = d.data().quizDate as admin.firestore.Timestamp;
    dates.add(ts.toDate().toISOString().split("T")[0]);
  });

  let streak = 0;
  const today = new Date();
  for (let i = 0; i < 60; i++) {
    const d = new Date(today);
    d.setDate(d.getDate() - i);
    const key = d.toISOString().split("T")[0];
    if (dates.has(key)) {
      streak++;
    } else {
      break;
    }
  }
  return streak;
}

// ── SRS 更新: クイズ回答後 ───────────────────────────────────
export const updateSrsAfterQuiz = onCall(async (request) => {
  if (!request.auth) throw new HttpsError("unauthenticated", "Login required");
  const { wordId, isCorrect, currentDifficulty } = request.data;
  const userId = request.auth.uid;

  const docId = `${userId}_${wordId}`;
  const ref = db.collection("userSearchHistory").doc(docId);
  const doc = await ref.get();

  const reviewCount = ((doc.data()?.reviewCount as number) ?? 0);
  const newDifficulty = calcDifficulty(currentDifficulty, isCorrect);
  const nextReviewDate = calcNextReviewDate(reviewCount, newDifficulty, isCorrect);

  await ref.update({
    nextReviewDate: admin.firestore.Timestamp.fromDate(nextReviewDate),
    reviewCount: admin.firestore.FieldValue.increment(1),
    difficulty: newDifficulty,
    lastReviewedAt: admin.firestore.FieldValue.serverTimestamp(),
  });

  return { nextReviewDate: nextReviewDate.toISOString(), newDifficulty };
});

function calcDifficulty(current: string, isCorrect: boolean): string {
  if (isCorrect) {
    if (current === "hard") return "normal";
    if (current === "normal") return "easy";
    return "easy";
  } else {
    if (current === "easy") return "normal";
    if (current === "normal") return "hard";
    return "hard";
  }
}

function calcNextReviewDate(
  reviewCount: number,
  difficulty: string,
  isCorrect: boolean
): Date {
  if (!isCorrect) {
    const d = new Date();
    d.setDate(d.getDate() + 1);
    return d;
  }
  const tables: Record<string, number[]> = {
    easy: [7, 14, 30, 60, 90],
    normal: [3, 7, 14, 30, 60],
    hard: [1, 3, 7, 14, 30],
  };
  const days = (tables[difficulty] ?? tables["normal"])[
    Math.min(reviewCount, 4)
  ];
  const next = new Date();
  next.setDate(next.getDate() + days);
  return next;
}
