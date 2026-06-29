// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WordModel _$WordModelFromJson(Map<String, dynamic> json) {
  return _WordModel.fromJson(json);
}

/// @nodoc
mixin _$WordModel {
  String get wordId => throw _privateConstructorUsedError;
  String get wordName => throw _privateConstructorUsedError;
  String get furigana => throw _privateConstructorUsedError;
  String get partsOfSpeech => throw _privateConstructorUsedError;
  Map<String, String> get descriptions =>
      throw _privateConstructorUsedError; // grade1 ~ grade6
  Map<String, NuanceExplanation> get nuanceExplanations =>
      throw _privateConstructorUsedError;
  String? get illustrationUrl => throw _privateConstructorUsedError;
  String get illustrationPlaceholder => throw _privateConstructorUsedError;
  int get frequency => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this WordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordModelCopyWith<WordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordModelCopyWith<$Res> {
  factory $WordModelCopyWith(WordModel value, $Res Function(WordModel) then) =
      _$WordModelCopyWithImpl<$Res, WordModel>;
  @useResult
  $Res call(
      {String wordId,
      String wordName,
      String furigana,
      String partsOfSpeech,
      Map<String, String> descriptions,
      Map<String, NuanceExplanation> nuanceExplanations,
      String? illustrationUrl,
      String illustrationPlaceholder,
      int frequency,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$WordModelCopyWithImpl<$Res, $Val extends WordModel>
    implements $WordModelCopyWith<$Res> {
  _$WordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordId = null,
    Object? wordName = null,
    Object? furigana = null,
    Object? partsOfSpeech = null,
    Object? descriptions = null,
    Object? nuanceExplanations = null,
    Object? illustrationUrl = freezed,
    Object? illustrationPlaceholder = null,
    Object? frequency = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      wordName: null == wordName
          ? _value.wordName
          : wordName // ignore: cast_nullable_to_non_nullable
              as String,
      furigana: null == furigana
          ? _value.furigana
          : furigana // ignore: cast_nullable_to_non_nullable
              as String,
      partsOfSpeech: null == partsOfSpeech
          ? _value.partsOfSpeech
          : partsOfSpeech // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: null == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      nuanceExplanations: null == nuanceExplanations
          ? _value.nuanceExplanations
          : nuanceExplanations // ignore: cast_nullable_to_non_nullable
              as Map<String, NuanceExplanation>,
      illustrationUrl: freezed == illustrationUrl
          ? _value.illustrationUrl
          : illustrationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      illustrationPlaceholder: null == illustrationPlaceholder
          ? _value.illustrationPlaceholder
          : illustrationPlaceholder // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordModelImplCopyWith<$Res>
    implements $WordModelCopyWith<$Res> {
  factory _$$WordModelImplCopyWith(
          _$WordModelImpl value, $Res Function(_$WordModelImpl) then) =
      __$$WordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String wordId,
      String wordName,
      String furigana,
      String partsOfSpeech,
      Map<String, String> descriptions,
      Map<String, NuanceExplanation> nuanceExplanations,
      String? illustrationUrl,
      String illustrationPlaceholder,
      int frequency,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$WordModelImplCopyWithImpl<$Res>
    extends _$WordModelCopyWithImpl<$Res, _$WordModelImpl>
    implements _$$WordModelImplCopyWith<$Res> {
  __$$WordModelImplCopyWithImpl(
      _$WordModelImpl _value, $Res Function(_$WordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordId = null,
    Object? wordName = null,
    Object? furigana = null,
    Object? partsOfSpeech = null,
    Object? descriptions = null,
    Object? nuanceExplanations = null,
    Object? illustrationUrl = freezed,
    Object? illustrationPlaceholder = null,
    Object? frequency = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$WordModelImpl(
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      wordName: null == wordName
          ? _value.wordName
          : wordName // ignore: cast_nullable_to_non_nullable
              as String,
      furigana: null == furigana
          ? _value.furigana
          : furigana // ignore: cast_nullable_to_non_nullable
              as String,
      partsOfSpeech: null == partsOfSpeech
          ? _value.partsOfSpeech
          : partsOfSpeech // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: null == descriptions
          ? _value._descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      nuanceExplanations: null == nuanceExplanations
          ? _value._nuanceExplanations
          : nuanceExplanations // ignore: cast_nullable_to_non_nullable
              as Map<String, NuanceExplanation>,
      illustrationUrl: freezed == illustrationUrl
          ? _value.illustrationUrl
          : illustrationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      illustrationPlaceholder: null == illustrationPlaceholder
          ? _value.illustrationPlaceholder
          : illustrationPlaceholder // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordModelImpl implements _WordModel {
  const _$WordModelImpl(
      {required this.wordId,
      required this.wordName,
      required this.furigana,
      this.partsOfSpeech = 'noun',
      required final Map<String, String> descriptions,
      final Map<String, NuanceExplanation> nuanceExplanations = const {},
      this.illustrationUrl,
      this.illustrationPlaceholder = '#F5F5F5',
      this.frequency = 0,
      required this.createdAt,
      required this.updatedAt})
      : _descriptions = descriptions,
        _nuanceExplanations = nuanceExplanations;

  factory _$WordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordModelImplFromJson(json);

  @override
  final String wordId;
  @override
  final String wordName;
  @override
  final String furigana;
  @override
  @JsonKey()
  final String partsOfSpeech;
  final Map<String, String> _descriptions;
  @override
  Map<String, String> get descriptions {
    if (_descriptions is EqualUnmodifiableMapView) return _descriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_descriptions);
  }

// grade1 ~ grade6
  final Map<String, NuanceExplanation> _nuanceExplanations;
// grade1 ~ grade6
  @override
  @JsonKey()
  Map<String, NuanceExplanation> get nuanceExplanations {
    if (_nuanceExplanations is EqualUnmodifiableMapView)
      return _nuanceExplanations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_nuanceExplanations);
  }

  @override
  final String? illustrationUrl;
  @override
  @JsonKey()
  final String illustrationPlaceholder;
  @override
  @JsonKey()
  final int frequency;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'WordModel(wordId: $wordId, wordName: $wordName, furigana: $furigana, partsOfSpeech: $partsOfSpeech, descriptions: $descriptions, nuanceExplanations: $nuanceExplanations, illustrationUrl: $illustrationUrl, illustrationPlaceholder: $illustrationPlaceholder, frequency: $frequency, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordModelImpl &&
            (identical(other.wordId, wordId) || other.wordId == wordId) &&
            (identical(other.wordName, wordName) ||
                other.wordName == wordName) &&
            (identical(other.furigana, furigana) ||
                other.furigana == furigana) &&
            (identical(other.partsOfSpeech, partsOfSpeech) ||
                other.partsOfSpeech == partsOfSpeech) &&
            const DeepCollectionEquality()
                .equals(other._descriptions, _descriptions) &&
            const DeepCollectionEquality()
                .equals(other._nuanceExplanations, _nuanceExplanations) &&
            (identical(other.illustrationUrl, illustrationUrl) ||
                other.illustrationUrl == illustrationUrl) &&
            (identical(
                    other.illustrationPlaceholder, illustrationPlaceholder) ||
                other.illustrationPlaceholder == illustrationPlaceholder) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      wordId,
      wordName,
      furigana,
      partsOfSpeech,
      const DeepCollectionEquality().hash(_descriptions),
      const DeepCollectionEquality().hash(_nuanceExplanations),
      illustrationUrl,
      illustrationPlaceholder,
      frequency,
      createdAt,
      updatedAt);

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordModelImplCopyWith<_$WordModelImpl> get copyWith =>
      __$$WordModelImplCopyWithImpl<_$WordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordModelImplToJson(
      this,
    );
  }
}

abstract class _WordModel implements WordModel {
  const factory _WordModel(
      {required final String wordId,
      required final String wordName,
      required final String furigana,
      final String partsOfSpeech,
      required final Map<String, String> descriptions,
      final Map<String, NuanceExplanation> nuanceExplanations,
      final String? illustrationUrl,
      final String illustrationPlaceholder,
      final int frequency,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$WordModelImpl;

  factory _WordModel.fromJson(Map<String, dynamic> json) =
      _$WordModelImpl.fromJson;

  @override
  String get wordId;
  @override
  String get wordName;
  @override
  String get furigana;
  @override
  String get partsOfSpeech;
  @override
  Map<String, String> get descriptions; // grade1 ~ grade6
  @override
  Map<String, NuanceExplanation> get nuanceExplanations;
  @override
  String? get illustrationUrl;
  @override
  String get illustrationPlaceholder;
  @override
  int get frequency;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordModelImplCopyWith<_$WordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NuanceExplanation _$NuanceExplanationFromJson(Map<String, dynamic> json) {
  return _NuanceExplanation.fromJson(json);
}

/// @nodoc
mixin _$NuanceExplanation {
  String get background => throw _privateConstructorUsedError;
  String get usage => throw _privateConstructorUsedError;
  String get contrast => throw _privateConstructorUsedError;

  /// Serializes this NuanceExplanation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NuanceExplanation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NuanceExplanationCopyWith<NuanceExplanation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NuanceExplanationCopyWith<$Res> {
  factory $NuanceExplanationCopyWith(
          NuanceExplanation value, $Res Function(NuanceExplanation) then) =
      _$NuanceExplanationCopyWithImpl<$Res, NuanceExplanation>;
  @useResult
  $Res call({String background, String usage, String contrast});
}

/// @nodoc
class _$NuanceExplanationCopyWithImpl<$Res, $Val extends NuanceExplanation>
    implements $NuanceExplanationCopyWith<$Res> {
  _$NuanceExplanationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NuanceExplanation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? background = null,
    Object? usage = null,
    Object? contrast = null,
  }) {
    return _then(_value.copyWith(
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as String,
      contrast: null == contrast
          ? _value.contrast
          : contrast // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NuanceExplanationImplCopyWith<$Res>
    implements $NuanceExplanationCopyWith<$Res> {
  factory _$$NuanceExplanationImplCopyWith(_$NuanceExplanationImpl value,
          $Res Function(_$NuanceExplanationImpl) then) =
      __$$NuanceExplanationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String background, String usage, String contrast});
}

/// @nodoc
class __$$NuanceExplanationImplCopyWithImpl<$Res>
    extends _$NuanceExplanationCopyWithImpl<$Res, _$NuanceExplanationImpl>
    implements _$$NuanceExplanationImplCopyWith<$Res> {
  __$$NuanceExplanationImplCopyWithImpl(_$NuanceExplanationImpl _value,
      $Res Function(_$NuanceExplanationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NuanceExplanation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? background = null,
    Object? usage = null,
    Object? contrast = null,
  }) {
    return _then(_$NuanceExplanationImpl(
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as String,
      contrast: null == contrast
          ? _value.contrast
          : contrast // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NuanceExplanationImpl implements _NuanceExplanation {
  const _$NuanceExplanationImpl(
      {required this.background, required this.usage, required this.contrast});

  factory _$NuanceExplanationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NuanceExplanationImplFromJson(json);

  @override
  final String background;
  @override
  final String usage;
  @override
  final String contrast;

  @override
  String toString() {
    return 'NuanceExplanation(background: $background, usage: $usage, contrast: $contrast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NuanceExplanationImpl &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            (identical(other.contrast, contrast) ||
                other.contrast == contrast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, background, usage, contrast);

  /// Create a copy of NuanceExplanation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NuanceExplanationImplCopyWith<_$NuanceExplanationImpl> get copyWith =>
      __$$NuanceExplanationImplCopyWithImpl<_$NuanceExplanationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NuanceExplanationImplToJson(
      this,
    );
  }
}

abstract class _NuanceExplanation implements NuanceExplanation {
  const factory _NuanceExplanation(
      {required final String background,
      required final String usage,
      required final String contrast}) = _$NuanceExplanationImpl;

  factory _NuanceExplanation.fromJson(Map<String, dynamic> json) =
      _$NuanceExplanationImpl.fromJson;

  @override
  String get background;
  @override
  String get usage;
  @override
  String get contrast;

  /// Create a copy of NuanceExplanation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NuanceExplanationImplCopyWith<_$NuanceExplanationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
