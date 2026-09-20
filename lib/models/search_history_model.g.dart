// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchHistoryModel _$SearchHistoryModelFromJson(Map<String, dynamic> json) =>
    _SearchHistoryModel(
      searchHistoryId: json['searchHistoryId'] as String,
      userId: json['userId'] as String,
      wordId: json['wordId'] as String,
      wordName: json['wordName'] as String,
      searchedAt: DateTime.parse(json['searchedAt'] as String),
      nextReviewDate: DateTime.parse(json['nextReviewDate'] as String),
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      difficulty: json['difficulty'] as String? ?? 'normal',
      lastReviewedAt: json['lastReviewedAt'] == null
          ? null
          : DateTime.parse(json['lastReviewedAt'] as String),
    );

Map<String, dynamic> _$SearchHistoryModelToJson(_SearchHistoryModel instance) =>
    <String, dynamic>{
      'searchHistoryId': instance.searchHistoryId,
      'userId': instance.userId,
      'wordId': instance.wordId,
      'wordName': instance.wordName,
      'searchedAt': instance.searchedAt.toIso8601String(),
      'nextReviewDate': instance.nextReviewDate.toIso8601String(),
      'reviewCount': instance.reviewCount,
      'difficulty': instance.difficulty,
      'lastReviewedAt': instance.lastReviewedAt?.toIso8601String(),
    };
