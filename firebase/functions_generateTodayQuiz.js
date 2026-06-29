const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Initialize Firebase Admin
if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore();

/**
 * Cloud Function: Generate today's SRS quiz queue
 * 
 * Scheduled: Daily at 00:00 JST
 * Purpose: Pre-calculate and store which words should be reviewed today
 * 
 * Logic:
 * 1. For each user who has bookmarks
 * 2. Find all bookmarked words with nextReviewDate <= today
 * 3. Create todayQuizQueue docs
 * 4. Limit to 5 words per user per day (configurable)
 */
exports.generateTodayQuiz = functions
  .region("asia-northeast1")
  .pubsub.schedule("0 0 * * *")
  .timeZone("Asia/Tokyo")
  .onRun(async (context) => {
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    const usersSnapshot = await db.collection("users").get();
    let processedCount = 0;

    for (const userDoc of usersSnapshot.docs) {
      const userId = userDoc.id;

      // Get user's bookmarks with active SRS entries
      const bookmarksSnapshot = await db
        .collection("userBookmarks")
        .where("userId", "==", userId)
        .get();

      const quizWordsToday = [];

      for (const bmDoc of bookmarksSnapshot.docs) {
        const bookmark = bmDoc.data();
        const wordId = bookmark.wordId;

        // Check SRS data (if stored separately)
        // This is a simplified version; adjust to your SRS storage schema
        const srsRef = db
          .collection("users")
          .doc(userId)
          .collection("srs")
          .doc(wordId);
        const srsSnap = await srsRef.get();

        if (srsSnap.exists) {
          const srsData = srsSnap.data();
          const nextReview = srsData.nextReviewDate?.toDate() || new Date();

          if (nextReview <= today && quizWordsToday.length < 5) {
            quizWordsToday.push({
              userId,
              wordId: bookmark.wordId,
              wordName: bookmark.wordName,
              createdAt: admin.firestore.FieldValue.serverTimestamp(),
            });
          }
        }
      }

      // Write today's quiz queue
      if (quizWordsToday.length > 0) {
        const batch = db.batch();
        quizWordsToday.forEach((quiz) => {
          const docRef = db.collection("todayQuizQueue").doc();
          batch.set(docRef, quiz);
        });
        await batch.commit();
        processedCount += quizWordsToday.length;
      }
    }

    console.log(`Generated ${processedCount} quiz items for today`);
    return { success: true, count: processedCount };
  });

/**
 * Cloud Function: Update user SRS after quiz answer
 * Called from app after user answers a question
 */
exports.updateSrsAfterQuiz = functions
  .region("asia-northeast1")
  .https.onCall(async (data, context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "User must be authenticated"
      );
    }

    const { wordId, isCorrect } = data;
    const userId = context.auth.uid;

    if (!wordId || typeof isCorrect !== "boolean") {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "wordId and isCorrect are required"
      );
    }

    const srsRef = db
      .collection("users")
      .doc(userId)
      .collection("srs")
      .doc(wordId);

    const srsSnap = await srsRef.get();
    let srsData = srsSnap.data() || {
      wordId,
      difficulty: "normal",
      intervalIndex: 0,
      nextReviewDate: admin.firestore.Timestamp.now(),
    };

    const intervals = {
      easy: [7, 14, 30, 60, 90],
      normal: [3, 7, 14, 30, 60],
      hard: [1, 3, 7, 14, 30],
    };

    if (!isCorrect) {
      // Reset to hard
      srsData.difficulty = "hard";
      srsData.intervalIndex = 0;
      const tomorrow = new Date();
      tomorrow.setDate(tomorrow.getDate() + 1);
      srsData.nextReviewDate = admin.firestore.Timestamp.fromDate(tomorrow);
    } else {
      // Move to next interval
      const currentIntervals = intervals[srsData.difficulty] || intervals.normal;
      const days = currentIntervals[
        Math.min(srsData.intervalIndex, currentIntervals.length - 1)
      ];
      const nextDate = new Date();
      nextDate.setDate(nextDate.getDate() + days);
      srsData.nextReviewDate = admin.firestore.Timestamp.fromDate(nextDate);
      srsData.intervalIndex = (srsData.intervalIndex || 0) + 1;
    }

    await srsRef.set(srsData, { merge: true });

    // Record quiz result for stats
    await db
      .collection("userQuizResults")
      .add({
        userId,
        wordId,
        isCorrect,
        answeredAt: admin.firestore.FieldValue.serverTimestamp(),
      });

    return { success: true, nextReview: srsData.nextReviewDate };
  });

/**
 * Cloud Function: Calculate user achievements
 * Triggered when quiz result is recorded
 */
exports.calculateAchievements = functions
  .region("asia-northeast1")
  .firestore.document("userQuizResults/{docId}")
  .onCreate(async (snap, context) => {
    const result = snap.data();
    const userId = result.userId;

    // Get quiz stats
    const resultsSnapshot = await db
      .collection("userQuizResults")
      .where("userId", "==", userId)
      .get();

    const totalQuizzes = resultsSnapshot.size;
    const correctCount = resultsSnapshot.docs.filter(
      (d) => d.data().isCorrect
    ).size;
    const correctRate = totalQuizzes > 0 ? correctCount / totalQuizzes : 0;

    // Award achievements (example)
    const achievements = [];

    if (correctCount >= 10) {
      achievements.push({
        userId,
        achievementType: "quiz_10correct",
        description: "10問正解",
        unlockedAt: admin.firestore.FieldValue.serverTimestamp(),
      });
    }

    if (correctRate >= 0.8 && totalQuizzes >= 5) {
      achievements.push({
        userId,
        achievementType: "accuracy_80",
        description: "正解率80%以上",
        unlockedAt: admin.firestore.FieldValue.serverTimestamp(),
      });
    }

    if (achievements.length > 0) {
      const batch = db.batch();
      achievements.forEach((ach) => {
        const docRef = db.collection("userAchievements").doc();
        batch.set(docRef, ach);
      });
      await batch.commit();
    }
  });
