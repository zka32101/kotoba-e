import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String userId,
    required String email,
    String? displayName,
    @Default('domestic') String userType, // domestic | global
    @Default(1) int gradeLevel,
    @Default('ja') String selectedLanguage, // ja | en
    @Default('free') String subscriptionStatus, // free | premium_monthly | premium_yearly
    DateTime? subscriptionExpiresAt,
    @Default('japanese_furigana') String textDisplayMode, // japanese_only | japanese_furigana | furigana_romaji | romaji_only
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  bool get isPremium =>
      subscriptionStatus != 'free' &&
      (subscriptionExpiresAt?.isAfter(DateTime.now()) ?? false);
}
