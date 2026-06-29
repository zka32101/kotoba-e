// Firebase の初期化は main.dart で行う。
// このファイルは firebase_options.dart が flutterfire configure で生成されるまでのプレースホルダー。
//
// セットアップ手順:
//   1. dart pub global activate flutterfire_cli
//   2. flutterfire configure --project=<your-project-id>
//   3. 生成された lib/firebase_options.dart を確認
//   4. main.dart の Firebase.initializeApp() を有効化

class FirebaseConfig {
  // プロジェクトID（flutterfire configure 後に確認）
  static const String projectId = 'kotoba-e';

  // Firestore コレクション名
  static const String usersCollection = 'users';
  static const String wordsCollection = 'words';
  static const String searchHistoryCollection = 'userSearchHistory';
  static const String bookmarksCollection = 'userBookmarks';
  static const String quizResultsCollection = 'userQuizResults';
  static const String quizQueueCollection = 'todayQuizQueue';
  static const String achievementsCollection = 'achievements';
  static const String userAchievementsCollection = 'userAchievements';
}
