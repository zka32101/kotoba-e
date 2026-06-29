// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordModelImpl _$$WordModelImplFromJson(Map<String, dynamic> json) =>
    _$WordModelImpl(
      wordId: json['wordId'] as String,
      wordName: json['wordName'] as String,
      furigana: json['furigana'] as String,
      partsOfSpeech: json['partsOfSpeech'] as String? ?? 'noun',
      descriptions: Map<String, String>.from(json['descriptions'] as Map),
      nuanceExplanations:
          (json['nuanceExplanations'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(
                    k, NuanceExplanation.fromJson(e as Map<String, dynamic>)),
              ) ??
              const {},
      illustrationUrl: json['illustrationUrl'] as String?,
      illustrationPlaceholder:
          json['illustrationPlaceholder'] as String? ?? '#F5F5F5',
      frequency: (json['frequency'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$WordModelImplToJson(_$WordModelImpl instance) =>
    <String, dynamic>{
      'wordId': instance.wordId,
      'wordName': instance.wordName,
      'furigana': instance.furigana,
      'partsOfSpeech': instance.partsOfSpeech,
      'descriptions': instance.descriptions,
      'nuanceExplanations': instance.nuanceExplanations,
      'illustrationUrl': instance.illustrationUrl,
      'illustrationPlaceholder': instance.illustrationPlaceholder,
      'frequency': instance.frequency,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$NuanceExplanationImpl _$$NuanceExplanationImplFromJson(
        Map<String, dynamic> json) =>
    _$NuanceExplanationImpl(
      background: json['background'] as String,
      usage: json['usage'] as String,
      contrast: json['contrast'] as String,
    );

Map<String, dynamic> _$$NuanceExplanationImplToJson(
        _$NuanceExplanationImpl instance) =>
    <String, dynamic>{
      'background': instance.background,
      'usage': instance.usage,
      'contrast': instance.contrast,
    };
