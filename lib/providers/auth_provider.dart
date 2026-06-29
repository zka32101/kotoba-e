import 'package:riverpod/riverpod.dart';
import 'package:kotoba_e/models/user_model.dart';
import 'package:kotoba_e/services/auth_service.dart';
import 'package:kotoba_e/services/local_storage_service.dart';

final authServiceProvider = Provider((ref) => authService);

final localStorageProvider = Provider((ref) => localStorageService);

// Current user state
final currentUserProvider =
    StateNotifierProvider<CurrentUserNotifier, UserModel?>((ref) {
  final authSvc = ref.watch(authServiceProvider);
  return CurrentUserNotifier(authSvc);
});

class CurrentUserNotifier extends StateNotifier<UserModel?> {
  final AuthService _authService;

  CurrentUserNotifier(this._authService) : super(null) {
    _initializeUser();
  }

  Future<void> _initializeUser() async {
    final user = await _authService.getCurrentUser();
    state = user;
  }

  Future<void> initializeAsGuest() async {
    state = UserModel(
      userId: 'guest',
      email: 'guest@kotoba-e.local',
      displayName: 'ゲスト',
      userType: 'domestic',
      gradeLevel: 3,
      selectedLanguage: 'ja',
      subscriptionStatus: 'free',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authService.loginWithEmail(
        email: email,
        password: password,
      );
      state = user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signup({
    required String email,
    required String password,
    required String displayName,
    required String userType,
    required int gradeLevel,
  }) async {
    try {
      final user = await _authService.signupWithEmail(
        email: email,
        password: password,
        displayName: displayName,
        userType: userType,
        gradeLevel: gradeLevel,
      );
      state = user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
      state = null;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProfile({
    String? displayName,
    String? selectedLanguage,
    int? gradeLevel,
    String? userType,
  }) async {
    try {
      await _authService.updateUserProfile(
        displayName: displayName,
        selectedLanguage: selectedLanguage,
        gradeLevel: gradeLevel,
        userType: userType,
      );
      if (state != null) {
        state = state!.copyWith(
          displayName: displayName ?? state!.displayName,
          selectedLanguage: selectedLanguage ?? state!.selectedLanguage,
          gradeLevel: gradeLevel ?? state!.gradeLevel,
          userType: userType ?? state!.userType,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}

// Auth state
final isLoggedInProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  return user != null;
});

// User type
final userTypeProvider = Provider<String>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.userType ?? 'domestic';
});

// Grade level
final gradeLevelProvider = Provider<int>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.gradeLevel ?? 1;
});

// Selected language
final selectedLanguageProvider = Provider<String>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.selectedLanguage ?? 'ja';
});

// Subscription status
final subscriptionStatusProvider = Provider<String>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.subscriptionStatus ?? 'free';
});
