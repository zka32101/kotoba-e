import 'package:riverpod/riverpod.dart';
import 'package:kotoba_e/models/achievement_model.dart';
import 'package:kotoba_e/providers/quiz_provider.dart';

// ストリーク：クイズ完了日リストから連続日数を計算
final streakProvider = Provider<int>((ref) {
  final dates = ref.watch(quizCompletionDatesProvider);
  if (dates.isEmpty) return 0;

  final now = DateTime.now();
  int streak = 0;
  for (var i = 0; ; i++) {
    final day = now.subtract(Duration(days: i));
    final key =
        '${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';
    if (dates.contains(key)) {
      streak++;
    } else {
      break;
    }
  }
  return streak;
});

// Mock achievements
final _mockAchievements = [
  AchievementModel(
    achievementId: 'achievement_streak_7days',
    achievementType: 'streak_7days',
    description: '7日連続利用',
    iconUrl: null,
  ),
  AchievementModel(
    achievementId: 'achievement_streak_30days',
    achievementType: 'streak_30days',
    description: '30日連続利用',
    iconUrl: null,
  ),
  AchievementModel(
    achievementId: 'achievement_words_100',
    achievementType: 'words_100',
    description: '100単語調べた',
    iconUrl: null,
  ),
  AchievementModel(
    achievementId: 'achievement_quiz_10correct',
    achievementType: 'quiz_10correct',
    description: 'クイズ10問正解',
    iconUrl: null,
  ),
  AchievementModel(
    achievementId: 'achievement_first_bookmark',
    achievementType: 'first_bookmark',
    description: '初めてのお気に入り',
    iconUrl: null,
  ),
];

// User achievements
final userAchievementsProvider = StateNotifierProvider<
    UserAchievementsNotifier,
    AsyncValue<List<UserAchievementModel>>>((ref) {
  return UserAchievementsNotifier();
});

class UserAchievementsNotifier
    extends StateNotifier<AsyncValue<List<UserAchievementModel>>> {
  UserAchievementsNotifier() : super(const AsyncValue.loading()) {
    _initializeAchievements();
  }

  Future<void> _initializeAchievements() async {
    try {
      // TODO: Fetch from Firestore (Sonnet)
      await Future.delayed(const Duration(milliseconds: 300));
      final mockUserAchievements = [
        UserAchievementModel(
          userAchievementId: 'user_ach_1',
          userId: 'user_1',
          achievementId: 'achievement_streak_7days',
          unlockedAt: DateTime.now().subtract(const Duration(days: 7)),
          notified: true,
        ),
        UserAchievementModel(
          userAchievementId: 'user_ach_2',
          userId: 'user_1',
          achievementId: 'achievement_words_100',
          unlockedAt: DateTime.now().subtract(const Duration(days: 3)),
          notified: true,
        ),
      ];
      state = AsyncValue.data(mockUserAchievements);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> unlockAchievement(String achievementId) async {
    try {
      // TODO: Update in Firestore (Sonnet)
      final newAchievement = UserAchievementModel(
        userAchievementId: 'user_ach_${DateTime.now().millisecondsSinceEpoch}',
        userId: 'user_1',
        achievementId: achievementId,
        unlockedAt: DateTime.now(),
        notified: false,
      );

      state.whenData((achievements) {
        final newList = [...achievements, newAchievement];
        state = AsyncValue.data(newList);
      });
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Get all achievements
final allAchievementsProvider = FutureProvider<List<AchievementModel>>(
  (ref) async {
    // TODO: Fetch from Firestore (Sonnet)
    await Future.delayed(const Duration(milliseconds: 200));
    return _mockAchievements;
  },
);

// Get unlocked achievements for current user
final unlockedAchievementsProvider =
    FutureProvider<List<AchievementModel>>((ref) async {
  final achievements = await ref.watch(allAchievementsProvider.future);

  final userAchievementsAsync = ref.watch(userAchievementsProvider);

  final unlockedIds = <String>{};
  userAchievementsAsync.whenData((achievements) {
    unlockedIds.addAll(achievements.map((ua) => ua.achievementId));
  });

  return achievements
      .where((achievement) => unlockedIds.contains(achievement.achievementId))
      .toList();
});
