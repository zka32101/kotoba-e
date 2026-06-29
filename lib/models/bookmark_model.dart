import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark_model.freezed.dart';
part 'bookmark_model.g.dart';

@freezed
class BookmarkModel with _$BookmarkModel {
  const factory BookmarkModel({
    required String bookmarkId,
    required String userId,
    required String wordId,
    required String wordName,
    required DateTime bookmarkedAt,
    DateTime? reviewedAt,
    @Default('new') String status,
  }) = _BookmarkModel;

  factory BookmarkModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkModelFromJson(json);
}
