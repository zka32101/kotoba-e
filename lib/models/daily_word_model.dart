import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_word_model.freezed.dart';
part 'daily_word_model.g.dart';

@freezed
class DailyWord with _$DailyWord {
  const factory DailyWord({
    required int day,
    required String date,
    required int month,
    required String season,
    required String wordId,
    required String wordName,
    required String furigana,
    @Default('noun') String partsOfSpeech,
    required String description,
    required String seasonalContext,
    @Default([]) List<String> illustrations,
  }) = _DailyWord;

  factory DailyWord.fromJson(Map<String, dynamic> json) =>
      _$DailyWordFromJson(json);
}

@freezed
class DailyWordNotification with _$DailyWordNotification {
  const factory DailyWordNotification({
    required String notificationId,
    required String userId,
    required DailyWord word,
    required DateTime sentAt,
    required DateTime scheduledFor,
    @Default(false) bool isRead,
  }) = _DailyWordNotification;

  factory DailyWordNotification.fromJson(Map<String, dynamic> json) =>
      _$DailyWordNotificationFromJson(json);
}
