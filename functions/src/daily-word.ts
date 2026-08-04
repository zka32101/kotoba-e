import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

const db = admin.firestore();
const messaging = admin.messaging();

interface DailyWord {
  day: number;
  date: string;
  month: number;
  season: string;
  wordId: string;
  wordName: string;
  furigana: string;
  partsOfSpeech: string;
  description: string;
  seasonalContext: string;
  illustrations: string[];
}

/**
 * 毎日8時に実行: 登録ユーザーに季節用語をプッシュ通知
 * Cloud Scheduler から呼び出される
 */
export const sendDailyWord = functions
  .region("asia-northeast1")
  .pubsub.schedule("0 8 * * *")
  .timeZone("Asia/Tokyo")
  .onRun(async (context) => {
    try {
      const now = new Date();
      const dateStr = formatDate(now);

      // 本日の用語を取得
      const dailyWord = await getTodaysDailyWord(now);

      if (!dailyWord) {
        console.log("No daily word found for today");
        return;
      }

      // 全ユーザーの FCM トークンを取得
      const users = await db.collection("users").get();
      const tokens: string[] = [];

      for (const userDoc of users.docs) {
        const tokenDocs = await userDoc.ref.collection("fcm_tokens").get();
        for (const tokenDoc of tokenDocs.docs) {
          tokens.push(tokenDoc.data().token);
        }
      }

      if (tokens.length === 0) {
        console.log("No FCM tokens found");
        return;
      }

      // マルチキャスト メッセージを送信（500トークンごと）
      const batchSize = 500;
      for (let i = 0; i < tokens.length; i += batchSize) {
        const batch = tokens.slice(i, i + batchSize);

        const message: admin.messaging.MulticastMessage = {
          notification: {
            title: `今日のことば: ${dailyWord.wordName}`,
            body: dailyWord.description,
          },
          data: {
            wordId: dailyWord.wordId,
            date: dateStr,
            season: dailyWord.season,
          },
          tokens: batch,
        };

        await messaging.sendMulticast(message);
      }

      console.log(`Daily word sent to ${tokens.length} users`);

      // 配信履歴を記録
      await db.collection("daily_word_deliveries").doc(dateStr).set({
        date: dateStr,
        wordId: dailyWord.wordId,
        wordName: dailyWord.wordName,
        recipientCount: tokens.length,
        sentAt: admin.firestore.FieldValue.serverTimestamp(),
      });
    } catch (error) {
      console.error("Error sending daily word:", error);
      throw error;
    }
  });

/**
 * 本日の季節用語を Firestore から取得
 */
async function getTodaysDailyWord(date: Date): Promise<DailyWord | null> {
  try {
    // 実装：Firestore の daily_words コレクションから今日の用語を取得
    // 年-月-日 形式でドキュメントを検索
    const dateStr = formatDate(date);
    const doc = await db.collection("daily_words").doc(dateStr).get();

    if (doc.exists) {
      return doc.data() as DailyWord;
    }

    // フォールバック：月-日 形式で検索（複数年対応）
    const monthDay = dateStr.slice(5); // YYYY-MM-DD → MM-DD
    const fallbackDocs = await db
      .collection("daily_words")
      .where("date", ">=", `2025-${monthDay}`)
      .where("date", "<=", `2025-${monthDay}`)
      .limit(1)
      .get();

    if (!fallbackDocs.empty) {
      return fallbackDocs.docs[0].data() as DailyWord;
    }

    return null;
  } catch (error) {
    console.error("Error getting daily word:", error);
    return null;
  }
}

/**
 * 日付を YYYY-MM-DD 形式でフォーマット
 */
function formatDate(date: Date): string {
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const day = String(date.getDate()).padStart(2, "0");
  return `${year}-${month}-${day}`;
}

/**
 * HTTP トリガー版（テスト用）
 * POST /sendDailyWord でも実行可能
 */
export const sendDailyWordHttp = functions
  .region("asia-northeast1")
  .https.onCall(async (data, context) => {
    // 認証チェック（省略可）
    try {
      const date = data.date ? new Date(data.date) : new Date();
      const dailyWord = await getTodaysDailyWord(date);

      if (!dailyWord) {
        return { success: false, message: "No daily word found" };
      }

      // テスト用：単一のトークンに送信
      if (data.testToken) {
        const message: admin.messaging.Message = {
          notification: {
            title: `今日のことば: ${dailyWord.wordName}`,
            body: dailyWord.description,
          },
          data: {
            wordId: dailyWord.wordId,
            season: dailyWord.season,
          },
          token: data.testToken,
        };

        const messageId = await messaging.send(message);
        return { success: true, messageId, dailyWord };
      }

      return { success: true, dailyWord };
    } catch (error) {
      console.error("Error:", error);
      return { success: false, error: String(error) };
    }
  });
