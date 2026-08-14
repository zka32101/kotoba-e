import 'package:firebase_auth/firebase_auth.dart';
import 'package:kotoba_e/models/user_model.dart';
import 'package:kotoba_e/services/firestore_service.dart';
import 'package:kotoba_e/services/local_storage_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestore = firestoreService;
  final LocalStorageService _localStorage = localStorageService;

  // 現在のFirebase Userストリーム
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentFirebaseUser => _auth.currentUser;

  // ── Email/Password Login ───────────────────────────────

  Future<UserModel> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final fbUser = credential.user!;
    final user = await _firestore.getUser(fbUser.uid) ??
        UserModel(
          userId: fbUser.uid,
          email: fbUser.email ?? email,
          displayName: fbUser.displayName,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
    await _saveLocally(user);
    return user;
  }

  // ── Email/Password Signup ──────────────────────────────

  Future<UserModel> signupWithEmail({
    required String email,
    required String password,
    required String displayName,
    required String userType,
    required int gradeLevel,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final fbUser = credential.user!;
    await fbUser.updateDisplayName(displayName);

    final user = UserModel(
      userId: fbUser.uid,
      email: email,
      displayName: displayName,
      userType: userType,
      gradeLevel: gradeLevel,
      selectedLanguage: 'ja',
      subscriptionStatus: 'free',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _firestore.createUser(user);
    await _saveLocally(user);
    return user;
  }

  // ── Get Current User (from Firestore or local cache) ───

  Future<UserModel?> getCurrentUser() async {
    // Firebase が利用可能な場合
    try {
      final fbUser = _auth.currentUser;
      if (fbUser != null) {
        try {
          final user = await _firestore.getUser(fbUser.uid);
          if (user != null) await _saveLocally(user);
          return user ?? _buildFromLocal(fbUser);
        } catch (_) {
          return _buildFromLocal(fbUser);
        }
      }
    } catch (_) {
      // Firebase 未初期化 → ローカルにフォールバック
    }

    // ローカルキャッシュからユーザー復元（Firebase 未設定時のデモ用）
    if (_localStorage.isLoggedIn()) {
      final userId = _localStorage.getUserId();
      final email = _localStorage.getEmail();
      if (userId != null && email != null) {
        return UserModel(
          userId: userId,
          email: email,
          displayName: _localStorage.getDisplayName(),
          userType: _localStorage.getUserType(),
          gradeLevel: _localStorage.getGradeLevel(),
          selectedLanguage: _localStorage.getSelectedLanguage(),
          subscriptionStatus: _localStorage.getSubscriptionStatus(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      }
    }
    return null;
  }

  // ── Update Profile ─────────────────────────────────────

  Future<void> updateUserProfile({
    String? displayName,
    String? selectedLanguage,
    int? gradeLevel,
    String? userType,
  }) async {
    // ローカルに即反映
    if (displayName != null) await _localStorage.saveDisplayName(displayName);
    if (selectedLanguage != null) {
      await _localStorage.saveSelectedLanguage(selectedLanguage);
    }
    if (gradeLevel != null) await _localStorage.saveGradeLevel(gradeLevel);
    if (userType != null) await _localStorage.saveUserType(userType);

    // Firebase が利用可能な場合のみ Firestore に反映
    try {
      final fbUser = _auth.currentUser;
      if (fbUser == null) return;

      final updates = <String, dynamic>{};
      if (displayName != null) updates['displayName'] = displayName;
      if (selectedLanguage != null) updates['selectedLanguage'] = selectedLanguage;
      if (gradeLevel != null) updates['gradeLevel'] = gradeLevel;
      if (userType != null) updates['userType'] = userType;
      if (updates.isNotEmpty) {
        await _firestore.updateUser(fbUser.uid, updates);
        if (displayName != null) await fbUser.updateDisplayName(displayName);
      }
    } catch (_) {}
  }

  // ── Update Subscription ────────────────────────────────

  Future<void> updateUserSubscription({
    required String subscriptionStatus,
    required DateTime? subscriptionExpiresAt,
  }) async {
    // ローカルに保存
    await _localStorage.saveSubscriptionStatus(subscriptionStatus);

    // Firebase が利用可能な場合、Firestore に反映
    try {
      final fbUser = _auth.currentUser;
      if (fbUser == null) return;

      await _firestore.updateUser(
        fbUser.uid,
        {
          'subscriptionStatus': subscriptionStatus,
          if (subscriptionExpiresAt != null)
            'subscriptionExpiresAt': subscriptionExpiresAt,
          'updatedAt': DateTime.now(),
        },
      );
    } catch (e) {
      print('Firestore subscription 更新エラー: $e');
    }
  }

  // ── Logout ─────────────────────────────────────────────

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (_) {}
    await _localStorage.clearAuth();
  }

  // ── Helpers ────────────────────────────────────────────

  bool get isLoggedIn => _localStorage.isLoggedIn();

  Future<void> _saveLocally(UserModel user) async {
    await _localStorage.saveUserId(user.userId);
    await _localStorage.saveEmail(user.email);
    if (user.displayName != null) {
      await _localStorage.saveDisplayName(user.displayName!);
    }
    await _localStorage.saveUserType(user.userType);
    await _localStorage.saveGradeLevel(user.gradeLevel);
    await _localStorage.saveSelectedLanguage(user.selectedLanguage);
    await _localStorage.saveSubscriptionStatus(user.subscriptionStatus);
    await _localStorage.setLoggedIn(true);
  }

  UserModel _buildFromLocal(User fbUser) {
    return UserModel(
      userId: fbUser.uid,
      email: fbUser.email ?? _localStorage.getEmail() ?? '',
      displayName: _localStorage.getDisplayName(),
      userType: _localStorage.getUserType(),
      gradeLevel: _localStorage.getGradeLevel(),
      selectedLanguage: _localStorage.getSelectedLanguage(),
      subscriptionStatus: _localStorage.getSubscriptionStatus(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}

final authService = AuthService();
