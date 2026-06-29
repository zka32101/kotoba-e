import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _userIdKey = 'user_id';
  static const String _emailKey = 'email';
  static const String _displayNameKey = 'display_name';
  static const String _userTypeKey = 'user_type';
  static const String _gradeLevelKey = 'grade_level';
  static const String _selectedLanguageKey = 'selected_language';
  static const String _subscriptionStatusKey = 'subscription_status';
  static const String _isLoggedInKey = 'is_logged_in';

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Auth
  Future<void> saveUserId(String userId) async {
    await _prefs.setString(_userIdKey, userId);
  }

  String? getUserId() => _prefs.getString(_userIdKey);

  Future<void> saveEmail(String email) async {
    await _prefs.setString(_emailKey, email);
  }

  String? getEmail() => _prefs.getString(_emailKey);

  Future<void> saveDisplayName(String displayName) async {
    await _prefs.setString(_displayNameKey, displayName);
  }

  String? getDisplayName() => _prefs.getString(_displayNameKey);

  Future<void> setLoggedIn(bool isLoggedIn) async {
    await _prefs.setBool(_isLoggedInKey, isLoggedIn);
  }

  bool isLoggedIn() => _prefs.getBool(_isLoggedInKey) ?? false;

  // User Settings
  Future<void> saveUserType(String userType) async {
    await _prefs.setString(_userTypeKey, userType);
  }

  String getUserType() => _prefs.getString(_userTypeKey) ?? 'domestic';

  Future<void> saveGradeLevel(int gradeLevel) async {
    await _prefs.setInt(_gradeLevelKey, gradeLevel);
  }

  int getGradeLevel() => _prefs.getInt(_gradeLevelKey) ?? 1;

  Future<void> saveSelectedLanguage(String language) async {
    await _prefs.setString(_selectedLanguageKey, language);
  }

  String getSelectedLanguage() =>
      _prefs.getString(_selectedLanguageKey) ?? 'ja';

  // Subscription
  Future<void> saveSubscriptionStatus(String status) async {
    await _prefs.setString(_subscriptionStatusKey, status);
  }

  String getSubscriptionStatus() =>
      _prefs.getString(_subscriptionStatusKey) ?? 'free';

  // Quiz completion dates ("yyyy-MM-dd" strings)
  static const String _quizDatesKey = 'quiz_completion_dates';

  Future<void> saveQuizDates(List<String> dates) async {
    await _prefs.setStringList(_quizDatesKey, dates);
  }

  List<String> getQuizDates() =>
      _prefs.getStringList(_quizDatesKey) ?? [];

  // Bookmarks (JSON list)
  static const String _bookmarksKey = 'bookmarks_json';

  Future<void> saveBookmarks(List<Map<String, dynamic>> bookmarks) async {
    final jsonList = bookmarks.map((b) => jsonEncode(b)).toList();
    await _prefs.setStringList(_bookmarksKey, jsonList);
  }

  List<Map<String, dynamic>> getBookmarks() {
    final jsonList = _prefs.getStringList(_bookmarksKey) ?? [];
    return jsonList
        .map((j) => jsonDecode(j) as Map<String, dynamic>)
        .toList();
  }

  // SRS per-word data (Map<wordId, SrsEntry json>)
  static const String _srsKey = 'srs_data_v1';

  Future<void> saveSrsData(Map<String, Map<String, dynamic>> data) async {
    await _prefs.setString(_srsKey, jsonEncode(data));
  }

  Map<String, Map<String, dynamic>> getSrsData() {
    final raw = _prefs.getString(_srsKey);
    if (raw == null) return {};
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    return decoded.map((k, v) => MapEntry(k, v as Map<String, dynamic>));
  }

  // Accumulated quiz stats (lifetime totals)
  static const String _quizTotalKey = 'quiz_acc_total';
  static const String _quizCorrectKey = 'quiz_acc_correct';

  Future<void> saveQuizStats({required int total, required int correct}) async {
    await _prefs.setInt(_quizTotalKey, total);
    await _prefs.setInt(_quizCorrectKey, correct);
  }

  Map<String, int> getQuizStats() => {
    'total': _prefs.getInt(_quizTotalKey) ?? 0,
    'correct': _prefs.getInt(_quizCorrectKey) ?? 0,
  };

  // 最近見た単語（wordId のリスト、新しい順、最大50件）
  static const String _recentWordsKey = 'recent_words_v1';

  Future<void> addRecentWord(String wordId) async {
    final current = getRecentWords();
    current.remove(wordId); // 重複削除
    current.insert(0, wordId); // 先頭に追加
    final trimmed = current.take(50).toList();
    await _prefs.setStringList(_recentWordsKey, trimmed);
  }

  List<String> getRecentWords() =>
      List<String>.from(_prefs.getStringList(_recentWordsKey) ?? []);

  Future<void> clearRecentWords() async {
    await _prefs.remove(_recentWordsKey);
  }

  // コレクション（閲覧済み wordId のセット、図鑑用）
  static const String _seenWordsKey = 'seen_words_v1';

  Future<void> markWordSeen(String wordId) async {
    final seen = getSeenWords();
    if (!seen.contains(wordId)) {
      seen.add(wordId);
      await _prefs.setStringList(_seenWordsKey, seen);
    }
  }

  List<String> getSeenWords() =>
      List<String>.from(_prefs.getStringList(_seenWordsKey) ?? []);

  // Clear
  Future<void> clearAll() async {
    await _prefs.clear();
  }

  Future<void> clearAuth() async {
    await _prefs.remove(_userIdKey);
    await _prefs.remove(_emailKey);
    await _prefs.remove(_displayNameKey);
    await _prefs.remove(_isLoggedInKey);
  }
}

final localStorageService = LocalStorageService();
