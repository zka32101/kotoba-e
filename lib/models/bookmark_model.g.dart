// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookmarkModelImpl _$$BookmarkModelImplFromJson(Map<String, dynamic> json) =>
    _$BookmarkModelImpl(
      bookmarkId: json['bookmarkId'] as String,
      userId: json['userId'] as String,
      wordId: json['wordId'] as String,
      wordName: json['wordName'] as String,
      bookmarkedAt: DateTime.parse(json['bookmarkedAt'] as String),
      reviewedAt: json['reviewedAt'] == null
          ? null
          : DateTime.parse(json['reviewedAt'] as String),
      status: json['status'] as String? ?? 'new',
    );

Map<String, dynamic> _$$BookmarkModelImplToJson(_$BookmarkModelImpl instance) =>
    <String, dynamic>{
      'bookmarkId': instance.bookmarkId,
      'userId': instance.userId,
      'wordId': instance.wordId,
      'wordName': instance.wordName,
      'bookmarkedAt': instance.bookmarkedAt.toIso8601String(),
      'reviewedAt': instance.reviewedAt?.toIso8601String(),
      'status': instance.status,
    };
