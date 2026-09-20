// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  userId: json['userId'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String?,
  userType: json['userType'] as String? ?? 'domestic',
  gradeLevel: (json['gradeLevel'] as num?)?.toInt() ?? 1,
  selectedLanguage: json['selectedLanguage'] as String? ?? 'ja',
  subscriptionStatus: json['subscriptionStatus'] as String? ?? 'free',
  subscriptionExpiresAt: json['subscriptionExpiresAt'] == null
      ? null
      : DateTime.parse(json['subscriptionExpiresAt'] as String),
  textDisplayMode: json['textDisplayMode'] as String? ?? 'japanese_furigana',
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(
  _UserModel instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'email': instance.email,
  'displayName': instance.displayName,
  'userType': instance.userType,
  'gradeLevel': instance.gradeLevel,
  'selectedLanguage': instance.selectedLanguage,
  'subscriptionStatus': instance.subscriptionStatus,
  'subscriptionExpiresAt': instance.subscriptionExpiresAt?.toIso8601String(),
  'textDisplayMode': instance.textDisplayMode,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
