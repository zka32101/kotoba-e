// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyWordImpl _$$DailyWordImplFromJson(Map<String, dynamic> json) =>
    _$DailyWordImpl(
      day: (json['day'] as num).toInt(),
      date: json['date'] as String,
      month: (json['month'] as num).toInt(),
      season: json['season'] as String,
      wordId: json['wordId'] as String,
      wordName: json['wordName'] as String,
      furigana: json['furigana'] as String,
      partsOfSpeech: json['partsOfSpeech'] as String? ?? 'noun',
      description: json['description'] as String,
      seasonalContext: json['seasonalContext'] as String,
      illustrations: (json['illustrations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DailyWordImplToJson(_$DailyWordImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'date': instance.date,
      'month': instance.month,
      'season': instance.season,
      'wordId': instance.wordId,
      'wordName': instance.wordName,
      'furigana': instance.furigana,
      'partsOfSpeech': instance.partsOfSpeech,
      'description': instance.description,
      'seasonalContext': instance.seasonalContext,
      'illustrations': instance.illustrations,
    };

_$DailyWordNotificationImpl _$$DailyWordNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyWordNotificationImpl(
      notificationId: json['notificationId'] as String,
      userId: json['userId'] as String,
      word: DailyWord.fromJson(json['word'] as Map<String, dynamic>),
      sentAt: DateTime.parse(json['sentAt'] as String),
      scheduledFor: DateTime.parse(json['scheduledFor'] as String),
      isRead: json['isRead'] as bool? ?? false,
    );

Map<String, dynamic> _$$DailyWordNotificationImplToJson(
        _$DailyWordNotificationImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'userId': instance.userId,
      'word': instance.word,
      'sentAt': instance.sentAt.toIso8601String(),
      'scheduledFor': instance.scheduledFor.toIso8601String(),
      'isRead': instance.isRead,
    };
