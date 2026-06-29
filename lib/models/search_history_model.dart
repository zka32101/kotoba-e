import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_history_model.freezed.dart';
part 'search_history_model.g.dart';

@freezed
class SearchHistoryModel with _$SearchHistoryModel {
  const factory SearchHistoryModel({
    required String searchHistoryId,
    required String userId,
    required String wordId,
    required String wordName,
    required DateTime searchedAt,
    required DateTime nextReviewDate,
    @Default(0) int reviewCount,
    @Default('normal') String difficulty,
    DateTime? lastReviewedAt,
  }) = _SearchHistoryModel;

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryModelFromJson(json);
}
