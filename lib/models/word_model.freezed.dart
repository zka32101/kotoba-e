// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WordModel {

 String get wordId; String get wordName; String get furigana; String get partsOfSpeech; Map<String, String> get descriptions; Map<String, NuanceExplanation> get nuanceExplanations; String? get illustrationUrl; String get illustrationPlaceholder; int get frequency; String? get jlptLevel; String? get romaji; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of WordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordModelCopyWith<WordModel> get copyWith => _$WordModelCopyWithImpl<WordModel>(this as WordModel, _$identity);

  /// Serializes this WordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WordModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordModel&&(identical(other.wordId, _this.wordId) || other.wordId == _this.wordId)&&(identical(other.wordName, _this.wordName) || other.wordName == _this.wordName)&&(identical(other.furigana, _this.furigana) || other.furigana == _this.furigana)&&(identical(other.partsOfSpeech, _this.partsOfSpeech) || other.partsOfSpeech == _this.partsOfSpeech)&&const DeepCollectionEquality().equals(other.descriptions, _this.descriptions)&&const DeepCollectionEquality().equals(other.nuanceExplanations, _this.nuanceExplanations)&&(identical(other.illustrationUrl, _this.illustrationUrl) || other.illustrationUrl == _this.illustrationUrl)&&(identical(other.illustrationPlaceholder, _this.illustrationPlaceholder) || other.illustrationPlaceholder == _this.illustrationPlaceholder)&&(identical(other.frequency, _this.frequency) || other.frequency == _this.frequency)&&(identical(other.jlptLevel, _this.jlptLevel) || other.jlptLevel == _this.jlptLevel)&&(identical(other.romaji, _this.romaji) || other.romaji == _this.romaji)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WordModel;
  return Object.hash(runtimeType,_this.wordId,_this.wordName,_this.furigana,_this.partsOfSpeech,const DeepCollectionEquality().hash(_this.descriptions),const DeepCollectionEquality().hash(_this.nuanceExplanations),_this.illustrationUrl,_this.illustrationPlaceholder,_this.frequency,_this.jlptLevel,_this.romaji,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as WordModel;
  return 'WordModel(wordId: ${_this.wordId}, wordName: ${_this.wordName}, furigana: ${_this.furigana}, partsOfSpeech: ${_this.partsOfSpeech}, descriptions: ${_this.descriptions}, nuanceExplanations: ${_this.nuanceExplanations}, illustrationUrl: ${_this.illustrationUrl}, illustrationPlaceholder: ${_this.illustrationPlaceholder}, frequency: ${_this.frequency}, jlptLevel: ${_this.jlptLevel}, romaji: ${_this.romaji}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $WordModelCopyWith<$Res>  {
  factory $WordModelCopyWith(WordModel value, $Res Function(WordModel) _then) = _$WordModelCopyWithImpl;
@useResult
$Res call({
 String wordId, String wordName, String furigana, String partsOfSpeech, Map<String, String> descriptions, Map<String, NuanceExplanation> nuanceExplanations, String? illustrationUrl, String illustrationPlaceholder, int frequency, String? jlptLevel, String? romaji, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$WordModelCopyWithImpl<$Res>
    implements $WordModelCopyWith<$Res> {
  _$WordModelCopyWithImpl(this._self, this._then);

  final WordModel _self;
  final $Res Function(WordModel) _then;

/// Create a copy of WordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wordId = null,Object? wordName = null,Object? furigana = null,Object? partsOfSpeech = null,Object? descriptions = null,Object? nuanceExplanations = null,Object? illustrationUrl = freezed,Object? illustrationPlaceholder = null,Object? frequency = null,Object? jlptLevel = freezed,Object? romaji = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(WordModel(
wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,furigana: null == furigana ? _self.furigana : furigana // ignore: cast_nullable_to_non_nullable
as String,partsOfSpeech: null == partsOfSpeech ? _self.partsOfSpeech : partsOfSpeech // ignore: cast_nullable_to_non_nullable
as String,descriptions: null == descriptions ? _self.descriptions : descriptions // ignore: cast_nullable_to_non_nullable
as Map<String, String>,nuanceExplanations: null == nuanceExplanations ? _self.nuanceExplanations : nuanceExplanations // ignore: cast_nullable_to_non_nullable
as Map<String, NuanceExplanation>,illustrationUrl: freezed == illustrationUrl ? _self.illustrationUrl : illustrationUrl // ignore: cast_nullable_to_non_nullable
as String?,illustrationPlaceholder: null == illustrationPlaceholder ? _self.illustrationPlaceholder : illustrationPlaceholder // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as int,jlptLevel: freezed == jlptLevel ? _self.jlptLevel : jlptLevel // ignore: cast_nullable_to_non_nullable
as String?,romaji: freezed == romaji ? _self.romaji : romaji // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WordModel].
extension WordModelPatterns on WordModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordModel value)  $default,){
final _that = this;
switch (_that) {
case _WordModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordModel value)?  $default,){
final _that = this;
switch (_that) {
case _WordModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String wordId,  String wordName,  String furigana,  String partsOfSpeech,  Map<String, String> descriptions,  Map<String, NuanceExplanation> nuanceExplanations,  String? illustrationUrl,  String illustrationPlaceholder,  int frequency,  String? jlptLevel,  String? romaji,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordModel() when $default != null:
return $default(_that.wordId,_that.wordName,_that.furigana,_that.partsOfSpeech,_that.descriptions,_that.nuanceExplanations,_that.illustrationUrl,_that.illustrationPlaceholder,_that.frequency,_that.jlptLevel,_that.romaji,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String wordId,  String wordName,  String furigana,  String partsOfSpeech,  Map<String, String> descriptions,  Map<String, NuanceExplanation> nuanceExplanations,  String? illustrationUrl,  String illustrationPlaceholder,  int frequency,  String? jlptLevel,  String? romaji,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _WordModel():
return $default(_that.wordId,_that.wordName,_that.furigana,_that.partsOfSpeech,_that.descriptions,_that.nuanceExplanations,_that.illustrationUrl,_that.illustrationPlaceholder,_that.frequency,_that.jlptLevel,_that.romaji,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String wordId,  String wordName,  String furigana,  String partsOfSpeech,  Map<String, String> descriptions,  Map<String, NuanceExplanation> nuanceExplanations,  String? illustrationUrl,  String illustrationPlaceholder,  int frequency,  String? jlptLevel,  String? romaji,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _WordModel() when $default != null:
return $default(_that.wordId,_that.wordName,_that.furigana,_that.partsOfSpeech,_that.descriptions,_that.nuanceExplanations,_that.illustrationUrl,_that.illustrationPlaceholder,_that.frequency,_that.jlptLevel,_that.romaji,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WordModel implements WordModel {
  const _WordModel({required this.wordId, required this.wordName, required this.furigana, this.partsOfSpeech = 'noun', required  Map<String, String> descriptions,  Map<String, NuanceExplanation> nuanceExplanations = const {}, this.illustrationUrl, this.illustrationPlaceholder = '#F5F5F5', this.frequency = 0, this.jlptLevel, this.romaji, required this.createdAt, required this.updatedAt}): _descriptions = descriptions,_nuanceExplanations = nuanceExplanations;
  factory _WordModel.fromJson(Map<String, dynamic> json) => _$WordModelFromJson(json);

@override final  String wordId;
@override final  String wordName;
@override final  String furigana;
@override@JsonKey() final  String partsOfSpeech;
 final  Map<String, String> _descriptions;
@override Map<String, String> get descriptions {
  if (_descriptions is EqualUnmodifiableMapView) return _descriptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_descriptions);
}

 final  Map<String, NuanceExplanation> _nuanceExplanations;
@override@JsonKey() Map<String, NuanceExplanation> get nuanceExplanations {
  if (_nuanceExplanations is EqualUnmodifiableMapView) return _nuanceExplanations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_nuanceExplanations);
}

@override final  String? illustrationUrl;
@override@JsonKey() final  String illustrationPlaceholder;
@override@JsonKey() final  int frequency;
@override final  String? jlptLevel;
@override final  String? romaji;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of WordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordModelCopyWith<_WordModel> get copyWith => __$WordModelCopyWithImpl<_WordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WordModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordModel&&(identical(other.wordId, wordId) || other.wordId == wordId)&&(identical(other.wordName, wordName) || other.wordName == wordName)&&(identical(other.furigana, furigana) || other.furigana == furigana)&&(identical(other.partsOfSpeech, partsOfSpeech) || other.partsOfSpeech == partsOfSpeech)&&const DeepCollectionEquality().equals(other.descriptions, _descriptions)&&const DeepCollectionEquality().equals(other.nuanceExplanations, _nuanceExplanations)&&(identical(other.illustrationUrl, illustrationUrl) || other.illustrationUrl == illustrationUrl)&&(identical(other.illustrationPlaceholder, illustrationPlaceholder) || other.illustrationPlaceholder == illustrationPlaceholder)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.jlptLevel, jlptLevel) || other.jlptLevel == jlptLevel)&&(identical(other.romaji, romaji) || other.romaji == romaji)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,wordId,wordName,furigana,partsOfSpeech,const DeepCollectionEquality().hash(_descriptions),const DeepCollectionEquality().hash(_nuanceExplanations),illustrationUrl,illustrationPlaceholder,frequency,jlptLevel,romaji,createdAt,updatedAt);
}

@override
String toString() {
    return 'WordModel(wordId: $wordId, wordName: $wordName, furigana: $furigana, partsOfSpeech: $partsOfSpeech, descriptions: $descriptions, nuanceExplanations: $nuanceExplanations, illustrationUrl: $illustrationUrl, illustrationPlaceholder: $illustrationPlaceholder, frequency: $frequency, jlptLevel: $jlptLevel, romaji: $romaji, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$WordModelCopyWith<$Res> implements $WordModelCopyWith<$Res> {
  factory _$WordModelCopyWith(_WordModel value, $Res Function(_WordModel) _then) = __$WordModelCopyWithImpl;
@override @useResult
$Res call({
 String wordId, String wordName, String furigana, String partsOfSpeech, Map<String, String> descriptions, Map<String, NuanceExplanation> nuanceExplanations, String? illustrationUrl, String illustrationPlaceholder, int frequency, String? jlptLevel, String? romaji, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$WordModelCopyWithImpl<$Res>
    implements _$WordModelCopyWith<$Res> {
  __$WordModelCopyWithImpl(this._self, this._then);

  final _WordModel _self;
  final $Res Function(_WordModel) _then;

/// Create a copy of WordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wordId = null,Object? wordName = null,Object? furigana = null,Object? partsOfSpeech = null,Object? descriptions = null,Object? nuanceExplanations = null,Object? illustrationUrl = freezed,Object? illustrationPlaceholder = null,Object? frequency = null,Object? jlptLevel = freezed,Object? romaji = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_WordModel(
wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,furigana: null == furigana ? _self.furigana : furigana // ignore: cast_nullable_to_non_nullable
as String,partsOfSpeech: null == partsOfSpeech ? _self.partsOfSpeech : partsOfSpeech // ignore: cast_nullable_to_non_nullable
as String,descriptions: null == descriptions ? _self._descriptions : descriptions // ignore: cast_nullable_to_non_nullable
as Map<String, String>,nuanceExplanations: null == nuanceExplanations ? _self._nuanceExplanations : nuanceExplanations // ignore: cast_nullable_to_non_nullable
as Map<String, NuanceExplanation>,illustrationUrl: freezed == illustrationUrl ? _self.illustrationUrl : illustrationUrl // ignore: cast_nullable_to_non_nullable
as String?,illustrationPlaceholder: null == illustrationPlaceholder ? _self.illustrationPlaceholder : illustrationPlaceholder // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as int,jlptLevel: freezed == jlptLevel ? _self.jlptLevel : jlptLevel // ignore: cast_nullable_to_non_nullable
as String?,romaji: freezed == romaji ? _self.romaji : romaji // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$NuanceExplanation {

 String get background; String get usage; String get contrast;
/// Create a copy of NuanceExplanation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NuanceExplanationCopyWith<NuanceExplanation> get copyWith => _$NuanceExplanationCopyWithImpl<NuanceExplanation>(this as NuanceExplanation, _$identity);

  /// Serializes this NuanceExplanation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NuanceExplanation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NuanceExplanation&&(identical(other.background, _this.background) || other.background == _this.background)&&(identical(other.usage, _this.usage) || other.usage == _this.usage)&&(identical(other.contrast, _this.contrast) || other.contrast == _this.contrast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NuanceExplanation;
  return Object.hash(runtimeType,_this.background,_this.usage,_this.contrast);
}

@override
String toString() {
  final _this = this as NuanceExplanation;
  return 'NuanceExplanation(background: ${_this.background}, usage: ${_this.usage}, contrast: ${_this.contrast})';
}


}

/// @nodoc
abstract mixin class $NuanceExplanationCopyWith<$Res>  {
  factory $NuanceExplanationCopyWith(NuanceExplanation value, $Res Function(NuanceExplanation) _then) = _$NuanceExplanationCopyWithImpl;
@useResult
$Res call({
 String background, String usage, String contrast
});




}
/// @nodoc
class _$NuanceExplanationCopyWithImpl<$Res>
    implements $NuanceExplanationCopyWith<$Res> {
  _$NuanceExplanationCopyWithImpl(this._self, this._then);

  final NuanceExplanation _self;
  final $Res Function(NuanceExplanation) _then;

/// Create a copy of NuanceExplanation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? background = null,Object? usage = null,Object? contrast = null,}) {
  return _then(NuanceExplanation(
background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as String,usage: null == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as String,contrast: null == contrast ? _self.contrast : contrast // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NuanceExplanation].
extension NuanceExplanationPatterns on NuanceExplanation {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NuanceExplanation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NuanceExplanation() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NuanceExplanation value)  $default,){
final _that = this;
switch (_that) {
case _NuanceExplanation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NuanceExplanation value)?  $default,){
final _that = this;
switch (_that) {
case _NuanceExplanation() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String background,  String usage,  String contrast)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NuanceExplanation() when $default != null:
return $default(_that.background,_that.usage,_that.contrast);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String background,  String usage,  String contrast)  $default,) {final _that = this;
switch (_that) {
case _NuanceExplanation():
return $default(_that.background,_that.usage,_that.contrast);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String background,  String usage,  String contrast)?  $default,) {final _that = this;
switch (_that) {
case _NuanceExplanation() when $default != null:
return $default(_that.background,_that.usage,_that.contrast);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NuanceExplanation implements NuanceExplanation {
  const _NuanceExplanation({required this.background, required this.usage, required this.contrast});
  factory _NuanceExplanation.fromJson(Map<String, dynamic> json) => _$NuanceExplanationFromJson(json);

@override final  String background;
@override final  String usage;
@override final  String contrast;

/// Create a copy of NuanceExplanation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NuanceExplanationCopyWith<_NuanceExplanation> get copyWith => __$NuanceExplanationCopyWithImpl<_NuanceExplanation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NuanceExplanationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NuanceExplanation&&(identical(other.background, background) || other.background == background)&&(identical(other.usage, usage) || other.usage == usage)&&(identical(other.contrast, contrast) || other.contrast == contrast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,background,usage,contrast);
}

@override
String toString() {
    return 'NuanceExplanation(background: $background, usage: $usage, contrast: $contrast)';
}


}

/// @nodoc
abstract mixin class _$NuanceExplanationCopyWith<$Res> implements $NuanceExplanationCopyWith<$Res> {
  factory _$NuanceExplanationCopyWith(_NuanceExplanation value, $Res Function(_NuanceExplanation) _then) = __$NuanceExplanationCopyWithImpl;
@override @useResult
$Res call({
 String background, String usage, String contrast
});




}
/// @nodoc
class __$NuanceExplanationCopyWithImpl<$Res>
    implements _$NuanceExplanationCopyWith<$Res> {
  __$NuanceExplanationCopyWithImpl(this._self, this._then);

  final _NuanceExplanation _self;
  final $Res Function(_NuanceExplanation) _then;

/// Create a copy of NuanceExplanation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? background = null,Object? usage = null,Object? contrast = null,}) {
  return _then(_NuanceExplanation(
background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as String,usage: null == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as String,contrast: null == contrast ? _self.contrast : contrast // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
