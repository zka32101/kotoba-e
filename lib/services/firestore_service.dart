import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kotoba_e/models/word_model.dart';
import 'package:kotoba_e/models/search_history_model.dart';
import 'package:kotoba_e/models/bookmark_model.dart';
import 'package:kotoba_e/models/quiz_queue_model.dart';
import 'package:kotoba_e/models/achievement_model.dart';
import 'package:kotoba_e/models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ── Users ──────────────────────────────────────────────

  Future<void> createUser(UserModel user) async {
    await _db.collection('users').doc(user.userId).set({
      'email': user.email,
      'displayName': user.displayName,
      'userType': user.userType,
      'gradeLevel': user.gradeLevel,
      'selectedLanguage': user.selectedLanguage,
      'subscriptionStatus': user.subscriptionStatus,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<UserModel?> getUser(String userId) async {
    final doc = await _db.collection('users').doc(userId).get();
    if (!doc.exists) return null;
    final data = doc.data()!;
    return UserModel(
      userId: userId,
      email: data['email'] ?? '',
      displayName: data['displayName'],
      userType: data['userType'] ?? 'domestic',
      gradeLevel: data['gradeLevel'] ?? 1,
      selectedLanguage: data['selectedLanguage'] ?? 'ja',
      subscriptionStatus: data['subscriptionStatus'] ?? 'free',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Future<void> updateUser(String userId, Map<String, dynamic> updates) async {
    await _db.collection('users').doc(userId).update({
      ...updates,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // ── Words ──────────────────────────────────────────────

  Future<List<WordModel>> searchWords({
    required String query,
    int limit = 20,
  }) async {
    // Firestoreでは前方一致検索のみ可能。本番はAlgolia/Typesense等を検討。
    QuerySnapshot snapshot;
    if (query.isEmpty) {
      snapshot = await _db
          .collection('words')
          .orderBy('frequency', descending: true)
          .limit(limit)
          .get();
    } else {
      snapshot = await _db
          .collection('words')
          .where('wordName', isGreaterThanOrEqualTo: query)
          .where('wordName', isLessThan: '${query}z')
          .limit(limit)
          .get();
    }
    return snapshot.docs.map(_docToWord).toList();
  }

  Future<WordModel?> getWord(String wordId) async {
    final doc = await _db.collection('words').doc(wordId).get();
    if (!doc.exists) return null;
    return _docToWord(doc);
  }

  WordModel _docToWord(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final rawNuance =
        (data['nuanceExplanations'] as Map<String, dynamic>?) ?? {};
    final nuanceMap = rawNuance.map(
      (key, value) => MapEntry(
        key,
        NuanceExplanation(
          background: (value as Map<String, dynamic>)['background'] ?? '',
          usage: value['usage'] ?? '',
          contrast: value['contrast'] ?? '',
        ),
      ),
    );
    return WordModel(
      wordId: doc.id,
      wordName: data['wordName'] ?? '',
      furigana: data['furigana'] ?? '',
      partsOfSpeech: data['partsOfSpeech'] ?? 'noun',
      descriptions:
          Map<String, String>.from(data['descriptions'] ?? {}),
      nuanceExplanations: nuanceMap,
      illustrationUrl: data['illustrationUrl'],
      illustrationPlaceholder:
          data['illustrationPlaceholder'] ?? '#F5F5F5',
      frequency: data['frequency'] ?? 0,
      createdAt:
          (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt:
          (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  // ── Search History ─────────────────────────────────────

  Future<void> recordSearch({
    required String userId,
    required String wordId,
    required String wordName,
  }) async {
    final docId = '${userId}_$wordId';
    final ref = _db.collection('userSearchHistory').doc(docId);
    final existing = await ref.get();

    if (existing.exists) {
      // 再検索：レビューカウントを増やす
      await ref.update({
        'searchedAt': FieldValue.serverTimestamp(),
        'reviewCount': FieldValue.increment(1),
      });
    } else {
      // 初検索：SRS スケジュール設定（3日後）
      final nextReview =
          DateTime.now().add(const Duration(days: 3));
      await ref.set({
        'userId': userId,
        'wordId': wordId,
        'wordName': wordName,
        'searchedAt': FieldValue.serverTimestamp(),
        'nextReviewDate': Timestamp.fromDate(nextReview),
        'reviewCount': 0,
        'difficulty': 'normal',
        'lastReviewedAt': null,
      });
    }
  }

  Future<List<SearchHistoryModel>> getSearchHistory(String userId,
      {int limit = 50}) async {
    final snapshot = await _db
        .collection('userSearchHistory')
        .where('userId', isEqualTo: userId)
        .orderBy('searchedAt', descending: true)
        .limit(limit)
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return SearchHistoryModel(
        searchHistoryId: doc.id,
        userId: data['userId'] ?? '',
        wordId: data['wordId'] ?? '',
        wordName: data['wordName'] ?? '',
        searchedAt: (data['searchedAt'] as Timestamp?)?.toDate() ??
            DateTime.now(),
        nextReviewDate:
            (data['nextReviewDate'] as Timestamp?)?.toDate() ??
                DateTime.now().add(const Duration(days: 3)),
        reviewCount: data['reviewCount'] ?? 0,
        difficulty: data['difficulty'] ?? 'normal',
        lastReviewedAt:
            (data['lastReviewedAt'] as Timestamp?)?.toDate(),
      );
    }).toList();
  }

  // ── Bookmarks ──────────────────────────────────────────

  Future<void> addBookmark({
    required String userId,
    required String wordId,
    required String wordName,
  }) async {
    final docId = '${userId}_$wordId';
    await _db.collection('userBookmarks').doc(docId).set({
      'userId': userId,
      'wordId': wordId,
      'wordName': wordName,
      'bookmarkedAt': FieldValue.serverTimestamp(),
      'status': 'new',
      'reviewedAt': null,
    });
  }

  Future<void> removeBookmark(String userId, String wordId) async {
    await _db
        .collection('userBookmarks')
        .doc('${userId}_$wordId')
        .delete();
  }

  Future<bool> isBookmarked(String userId, String wordId) async {
    final doc = await _db
        .collection('userBookmarks')
        .doc('${userId}_$wordId')
        .get();
    return doc.exists;
  }

  Future<List<BookmarkModel>> getBookmarks(String userId) async {
    final snapshot = await _db
        .collection('userBookmarks')
        .where('userId', isEqualTo: userId)
        .orderBy('bookmarkedAt', descending: true)
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return BookmarkModel(
        bookmarkId: doc.id,
        userId: data['userId'] ?? '',
        wordId: data['wordId'] ?? '',
        wordName: data['wordName'] ?? '',
        bookmarkedAt:
            (data['bookmarkedAt'] as Timestamp?)?.toDate() ??
                DateTime.now(),
        reviewedAt:
            (data['reviewedAt'] as Timestamp?)?.toDate(),
        status: data['status'] ?? 'new',
      );
    }).toList();
  }

  Future<void> updateBookmarkStatus(
      String userId, String wordId, String status) async {
    await _db
        .collection('userBookmarks')
        .doc('${userId}_$wordId')
        .update({'status': status, 'reviewedAt': FieldValue.serverTimestamp()});
  }

  // ── Quiz Queue (SRS) ───────────────────────────────────

  // 今日のクイズキューを取得
  Future<List<QuizQueueModel>> getTodayQuizQueue(
      String userId, String date) async {
    final snapshot = await _db
        .collection('todayQuizQueue')
        .where('userId', isEqualTo: userId)
        .where('date', isEqualTo: date)
        .orderBy('questionIndex')
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return QuizQueueModel(
        queueId: doc.id,
        date: data['date'] ?? '',
        userId: data['userId'] ?? '',
        wordId: data['wordId'] ?? '',
        wordName: data['wordName'] ?? '',
        questionIndex: data['questionIndex'] ?? 0,
        createdAt: (data['createdAt'] as Timestamp?)?.toDate() ??
            DateTime.now(),
      );
    }).toList();
  }

  // ── Quiz Results ───────────────────────────────────────

  Future<void> saveQuizResult({
    required String userId,
    required String wordId,
    required bool isCorrect,
    required String selectedAnswer,
    required String correctAnswer,
  }) async {
    await _db.collection('userQuizResults').add({
      'userId': userId,
      'quizDate': FieldValue.serverTimestamp(),
      'questionWordId': wordId,
      'correctAnswer': isCorrect,
      'selectedAnswer': selectedAnswer,
      'correctAnswerText': correctAnswer,
      'completedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<Map<String, dynamic>> getStats(String userId, String period) async {
    final now = DateTime.now();
    DateTime from;
    switch (period) {
      case 'week':
        from = now.subtract(const Duration(days: 7));
        break;
      case 'month':
        from = now.subtract(const Duration(days: 30));
        break;
      default:
        from = DateTime(now.year, now.month, now.day);
    }

    final historySnapshot = await _db
        .collection('userSearchHistory')
        .where('userId', isEqualTo: userId)
        .where('searchedAt', isGreaterThan: Timestamp.fromDate(from))
        .get();

    final quizSnapshot = await _db
        .collection('userQuizResults')
        .where('userId', isEqualTo: userId)
        .where('quizDate', isGreaterThan: Timestamp.fromDate(from))
        .get();

    final totalQuiz = quizSnapshot.docs.length;
    final correctQuiz = quizSnapshot.docs
        .where((d) => d.data()['correctAnswer'] == true)
        .length;

    return {
      'wordsSearched': historySnapshot.docs.length,
      'quizTotal': totalQuiz,
      'quizCorrect': correctQuiz,
      'correctRate': totalQuiz > 0 ? correctQuiz / totalQuiz : 0.0,
    };
  }

  // ── Achievements ───────────────────────────────────────

  Future<List<UserAchievementModel>> getUserAchievements(
      String userId) async {
    final snapshot = await _db
        .collection('userAchievements')
        .where('userId', isEqualTo: userId)
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return UserAchievementModel(
        userAchievementId: doc.id,
        userId: data['userId'] ?? '',
        achievementId: data['achievementId'] ?? '',
        unlockedAt:
            (data['unlockedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
        notified: data['notified'] ?? false,
      );
    }).toList();
  }

  Future<void> unlockAchievement(
      String userId, String achievementId) async {
    final docId = '${userId}_$achievementId';
    final ref =
        _db.collection('userAchievements').doc(docId);
    final exists = (await ref.get()).exists;
    if (!exists) {
      await ref.set({
        'userId': userId,
        'achievementId': achievementId,
        'unlockedAt': FieldValue.serverTimestamp(),
        'notified': false,
      });
    }
  }

  // ── SRS 更新（クイズ回答後）──────────────────────────────

  Future<DateTime> updateSrsAfterQuiz({
    required String userId,
    required String wordId,
    required bool isCorrect,
    required String currentDifficulty,
  }) async {
    final docId = '${userId}_$wordId';
    final ref = _db.collection('userSearchHistory').doc(docId);
    final data = (await ref.get()).data();

    final reviewCount = (data?['reviewCount'] ?? 0) as int;
    final newDifficulty = _calcDifficulty(currentDifficulty, isCorrect);
    final nextReview =
        _calcNextReviewDate(reviewCount, newDifficulty, isCorrect);

    await ref.update({
      'nextReviewDate': Timestamp.fromDate(nextReview),
      'reviewCount': FieldValue.increment(1),
      'difficulty': newDifficulty,
      'lastReviewedAt': FieldValue.serverTimestamp(),
    });

    return nextReview;
  }

  String _calcDifficulty(String current, bool isCorrect) {
    if (isCorrect) {
      if (current == 'hard') return 'normal';
      if (current == 'normal') return 'easy';
      return 'easy';
    } else {
      if (current == 'easy') return 'normal';
      if (current == 'normal') return 'hard';
      return 'hard';
    }
  }

  // SM-2 simplified SRS 間隔計算
  DateTime _calcNextReviewDate(
      int reviewCount, String difficulty, bool isCorrect) {
    if (!isCorrect) {
      return DateTime.now().add(const Duration(days: 1));
    }
    final days = switch (difficulty) {
      'easy' => [7, 14, 30, 60, 90][reviewCount.clamp(0, 4)],
      'normal' => [3, 7, 14, 30, 60][reviewCount.clamp(0, 4)],
      'hard' => [1, 3, 7, 14, 30][reviewCount.clamp(0, 4)],
      _ => 3,
    };
    return DateTime.now().add(Duration(days: days));
  }
}

final firestoreService = FirestoreService();
