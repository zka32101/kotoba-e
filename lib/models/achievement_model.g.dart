// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchievementModelImpl _$$AchievementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AchievementModelImpl(
      achievementId: json['achievementId'] as String,
      achievementType: json['achievementType'] as String? ?? 'streak_7days',
      description: json['description'] as String,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$$AchievementModelImplToJson(
        _$AchievementModelImpl instance) =>
    <String, dynamic>{
      'achievementId': instance.achievementId,
      'achievementType': instance.achievementType,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
    };

_$UserAchievementModelImpl _$$UserAchievementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAchievementModelImpl(
      userAchievementId: json['userAchievementId'] as String,
      userId: json['userId'] as String,
      achievementId: json['achievementId'] as String,
      unlockedAt: DateTime.parse(json['unlockedAt'] as String),
      notified: json['notified'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserAchievementModelImplToJson(
        _$UserAchievementModelImpl instance) =>
    <String, dynamic>{
      'userAchievementId': instance.userAchievementId,
      'userId': instance.userId,
      'achievementId': instance.achievementId,
      'unlockedAt': instance.unlockedAt.toIso8601String(),
      'notified': instance.notified,
    };
