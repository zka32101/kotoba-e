import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_model.freezed.dart';
part 'word_model.g.dart';

@freezed
class WordModel with _$WordModel {
  const factory WordModel({
    required String wordId,
    required String wordName,
    required String furigana,
    @Default('noun') String partsOfSpeech,
    required Map<String, String> descriptions, // grade1 ~ grade6
    @Default({}) Map<String, NuanceExplanation> nuanceExplanations,
    String? illustrationUrl,
    @Default('#F5F5F5') String illustrationPlaceholder,
    @Default(0) int frequency,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _WordModel;

  factory WordModel.fromJson(Map<String, dynamic> json) =>
      _$WordModelFromJson(json);
}

@freezed
class NuanceExplanation with _$NuanceExplanation {
  const factory NuanceExplanation({
    required String background,
    required String usage,
    required String contrast,
  }) = _NuanceExplanation;

  factory NuanceExplanation.fromJson(Map<String, dynamic> json) =>
      _$NuanceExplanationFromJson(json);
}

extension WordModelX on WordModel {
  String getDescription(int gradeLevel, String language) {
    if (language == 'en') {
      return nuanceExplanations['en']?.background ?? descriptions['grade1'] ?? '';
    }
    for (int g = gradeLevel; g >= 1; g--) {
      final desc = descriptions['grade$g'];
      if (desc != null && desc.isNotEmpty) return desc;
    }
    return descriptions.values.firstOrNull ?? '';
  }
}
