import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_model.freezed.dart';
part 'achievement_model.g.dart';

@freezed
class AchievementModel with _$AchievementModel {
  const factory AchievementModel({
    required String achievementId,
    @Default('streak_7days') String achievementType,
    required String description,
    String? iconUrl,
  }) = _AchievementModel;

  factory AchievementModel.fromJson(Map<String, dynamic> json) =>
      _$AchievementModelFromJson(json);
}

@freezed
class UserAchievementModel with _$UserAchievementModel {
  const factory UserAchievementModel({
    required String userAchievementId,
    required String userId,
    required String achievementId,
    required DateTime unlockedAt,
    @Default(false) bool notified,
  }) = _UserAchievementModel;

  factory UserAchievementModel.fromJson(Map<String, dynamic> json) =>
      _$UserAchievementModelFromJson(json);
}
