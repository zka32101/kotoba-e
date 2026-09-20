// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyWord {

 int get day; String get date; int get month; String get season; String get wordId; String get wordName; String get furigana; String get partsOfSpeech; String get description; String get seasonalContext; List<String> get illustrations;
/// Create a copy of DailyWord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyWordCopyWith<DailyWord> get copyWith => _$DailyWordCopyWithImpl<DailyWord>(this as DailyWord, _$identity);

  /// Serializes this DailyWord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyWord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyWord&&(identical(other.day, _this.day) || other.day == _this.day)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.month, _this.month) || other.month == _this.month)&&(identical(other.season, _this.season) || other.season == _this.season)&&(identical(other.wordId, _this.wordId) || other.wordId == _this.wordId)&&(identical(other.wordName, _this.wordName) || other.wordName == _this.wordName)&&(identical(other.furigana, _this.furigana) || other.furigana == _this.furigana)&&(identical(other.partsOfSpeech, _this.partsOfSpeech) || other.partsOfSpeech == _this.partsOfSpeech)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.seasonalContext, _this.seasonalContext) || other.seasonalContext == _this.seasonalContext)&&const DeepCollectionEquality().equals(other.illustrations, _this.illustrations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyWord;
  return Object.hash(runtimeType,_this.day,_this.date,_this.month,_this.season,_this.wordId,_this.wordName,_this.furigana,_this.partsOfSpeech,_this.description,_this.seasonalContext,const DeepCollectionEquality().hash(_this.illustrations));
}

@override
String toString() {
  final _this = this as DailyWord;
  return 'DailyWord(day: ${_this.day}, date: ${_this.date}, month: ${_this.month}, season: ${_this.season}, wordId: ${_this.wordId}, wordName: ${_this.wordName}, furigana: ${_this.furigana}, partsOfSpeech: ${_this.partsOfSpeech}, description: ${_this.description}, seasonalContext: ${_this.seasonalContext}, illustrations: ${_this.illustrations})';
}


}

/// @nodoc
abstract mixin class $DailyWordCopyWith<$Res>  {
  factory $DailyWordCopyWith(DailyWord value, $Res Function(DailyWord) _then) = _$DailyWordCopyWithImpl;
@useResult
$Res call({
 int day, String date, int month, String season, String wordId, String wordName, String furigana, String partsOfSpeech, String description, String seasonalContext, List<String> illustrations
});




}
/// @nodoc
class _$DailyWordCopyWithImpl<$Res>
    implements $DailyWordCopyWith<$Res> {
  _$DailyWordCopyWithImpl(this._self, this._then);

  final DailyWord _self;
  final $Res Function(DailyWord) _then;

/// Create a copy of DailyWord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? date = null,Object? month = null,Object? season = null,Object? wordId = null,Object? wordName = null,Object? furigana = null,Object? partsOfSpeech = null,Object? description = null,Object? seasonalContext = null,Object? illustrations = null,}) {
  return _then(DailyWord(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,furigana: null == furigana ? _self.furigana : furigana // ignore: cast_nullable_to_non_nullable
as String,partsOfSpeech: null == partsOfSpeech ? _self.partsOfSpeech : partsOfSpeech // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,seasonalContext: null == seasonalContext ? _self.seasonalContext : seasonalContext // ignore: cast_nullable_to_non_nullable
as String,illustrations: null == illustrations ? _self.illustrations : illustrations // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyWord].
extension DailyWordPatterns on DailyWord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyWord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyWord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyWord value)  $default,){
final _that = this;
switch (_that) {
case _DailyWord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyWord value)?  $default,){
final _that = this;
switch (_that) {
case _DailyWord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int day,  String date,  int month,  String season,  String wordId,  String wordName,  String furigana,  String partsOfSpeech,  String description,  String seasonalContext,  List<String> illustrations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyWord() when $default != null:
return $default(_that.day,_that.date,_that.month,_that.season,_that.wordId,_that.wordName,_that.furigana,_that.partsOfSpeech,_that.description,_that.seasonalContext,_that.illustrations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int day,  String date,  int month,  String season,  String wordId,  String wordName,  String furigana,  String partsOfSpeech,  String description,  String seasonalContext,  List<String> illustrations)  $default,) {final _that = this;
switch (_that) {
case _DailyWord():
return $default(_that.day,_that.date,_that.month,_that.season,_that.wordId,_that.wordName,_that.furigana,_that.partsOfSpeech,_that.description,_that.seasonalContext,_that.illustrations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int day,  String date,  int month,  String season,  String wordId,  String wordName,  String furigana,  String partsOfSpeech,  String description,  String seasonalContext,  List<String> illustrations)?  $default,) {final _that = this;
switch (_that) {
case _DailyWord() when $default != null:
return $default(_that.day,_that.date,_that.month,_that.season,_that.wordId,_that.wordName,_that.furigana,_that.partsOfSpeech,_that.description,_that.seasonalContext,_that.illustrations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyWord implements DailyWord {
  const _DailyWord({required this.day, required this.date, required this.month, required this.season, required this.wordId, required this.wordName, required this.furigana, this.partsOfSpeech = 'noun', required this.description, required this.seasonalContext,  List<String> illustrations = const []}): _illustrations = illustrations;
  factory _DailyWord.fromJson(Map<String, dynamic> json) => _$DailyWordFromJson(json);

@override final  int day;
@override final  String date;
@override final  int month;
@override final  String season;
@override final  String wordId;
@override final  String wordName;
@override final  String furigana;
@override@JsonKey() final  String partsOfSpeech;
@override final  String description;
@override final  String seasonalContext;
 final  List<String> _illustrations;
@override@JsonKey() List<String> get illustrations {
  if (_illustrations is EqualUnmodifiableListView) return _illustrations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_illustrations);
}


/// Create a copy of DailyWord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyWordCopyWith<_DailyWord> get copyWith => __$DailyWordCopyWithImpl<_DailyWord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyWordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyWord&&(identical(other.day, day) || other.day == day)&&(identical(other.date, date) || other.date == date)&&(identical(other.month, month) || other.month == month)&&(identical(other.season, season) || other.season == season)&&(identical(other.wordId, wordId) || other.wordId == wordId)&&(identical(other.wordName, wordName) || other.wordName == wordName)&&(identical(other.furigana, furigana) || other.furigana == furigana)&&(identical(other.partsOfSpeech, partsOfSpeech) || other.partsOfSpeech == partsOfSpeech)&&(identical(other.description, description) || other.description == description)&&(identical(other.seasonalContext, seasonalContext) || other.seasonalContext == seasonalContext)&&const DeepCollectionEquality().equals(other.illustrations, _illustrations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,day,date,month,season,wordId,wordName,furigana,partsOfSpeech,description,seasonalContext,const DeepCollectionEquality().hash(_illustrations));
}

@override
String toString() {
    return 'DailyWord(day: $day, date: $date, month: $month, season: $season, wordId: $wordId, wordName: $wordName, furigana: $furigana, partsOfSpeech: $partsOfSpeech, description: $description, seasonalContext: $seasonalContext, illustrations: $illustrations)';
}


}

/// @nodoc
abstract mixin class _$DailyWordCopyWith<$Res> implements $DailyWordCopyWith<$Res> {
  factory _$DailyWordCopyWith(_DailyWord value, $Res Function(_DailyWord) _then) = __$DailyWordCopyWithImpl;
@override @useResult
$Res call({
 int day, String date, int month, String season, String wordId, String wordName, String furigana, String partsOfSpeech, String description, String seasonalContext, List<String> illustrations
});




}
/// @nodoc
class __$DailyWordCopyWithImpl<$Res>
    implements _$DailyWordCopyWith<$Res> {
  __$DailyWordCopyWithImpl(this._self, this._then);

  final _DailyWord _self;
  final $Res Function(_DailyWord) _then;

/// Create a copy of DailyWord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? date = null,Object? month = null,Object? season = null,Object? wordId = null,Object? wordName = null,Object? furigana = null,Object? partsOfSpeech = null,Object? description = null,Object? seasonalContext = null,Object? illustrations = null,}) {
  return _then(_DailyWord(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,furigana: null == furigana ? _self.furigana : furigana // ignore: cast_nullable_to_non_nullable
as String,partsOfSpeech: null == partsOfSpeech ? _self.partsOfSpeech : partsOfSpeech // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,seasonalContext: null == seasonalContext ? _self.seasonalContext : seasonalContext // ignore: cast_nullable_to_non_nullable
as String,illustrations: null == illustrations ? _self._illustrations : illustrations // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$DailyWordNotification {

 String get notificationId; String get userId; DailyWord get word; DateTime get sentAt; DateTime get scheduledFor; bool get isRead;
/// Create a copy of DailyWordNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyWordNotificationCopyWith<DailyWordNotification> get copyWith => _$DailyWordNotificationCopyWithImpl<DailyWordNotification>(this as DailyWordNotification, _$identity);

  /// Serializes this DailyWordNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyWordNotification;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyWordNotification&&(identical(other.notificationId, _this.notificationId) || other.notificationId == _this.notificationId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.word, _this.word) || other.word == _this.word)&&(identical(other.sentAt, _this.sentAt) || other.sentAt == _this.sentAt)&&(identical(other.scheduledFor, _this.scheduledFor) || other.scheduledFor == _this.scheduledFor)&&(identical(other.isRead, _this.isRead) || other.isRead == _this.isRead));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyWordNotification;
  return Object.hash(runtimeType,_this.notificationId,_this.userId,_this.word,_this.sentAt,_this.scheduledFor,_this.isRead);
}

@override
String toString() {
  final _this = this as DailyWordNotification;
  return 'DailyWordNotification(notificationId: ${_this.notificationId}, userId: ${_this.userId}, word: ${_this.word}, sentAt: ${_this.sentAt}, scheduledFor: ${_this.scheduledFor}, isRead: ${_this.isRead})';
}


}

/// @nodoc
abstract mixin class $DailyWordNotificationCopyWith<$Res>  {
  factory $DailyWordNotificationCopyWith(DailyWordNotification value, $Res Function(DailyWordNotification) _then) = _$DailyWordNotificationCopyWithImpl;
@useResult
$Res call({
 String notificationId, String userId, DailyWord word, DateTime sentAt, DateTime scheduledFor, bool isRead
});


$DailyWordCopyWith<$Res> get word;

}
/// @nodoc
class _$DailyWordNotificationCopyWithImpl<$Res>
    implements $DailyWordNotificationCopyWith<$Res> {
  _$DailyWordNotificationCopyWithImpl(this._self, this._then);

  final DailyWordNotification _self;
  final $Res Function(DailyWordNotification) _then;

/// Create a copy of DailyWordNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notificationId = null,Object? userId = null,Object? word = null,Object? sentAt = null,Object? scheduledFor = null,Object? isRead = null,}) {
  return _then(DailyWordNotification(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as DailyWord,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,scheduledFor: null == scheduledFor ? _self.scheduledFor : scheduledFor // ignore: cast_nullable_to_non_nullable
as DateTime,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of DailyWordNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyWordCopyWith<$Res> get word {
  
  return $DailyWordCopyWith<$Res>(_self.word, (value) {
    return _then(_self.copyWith(word: value));
  });
}
}


/// Adds pattern-matching-related methods to [DailyWordNotification].
extension DailyWordNotificationPatterns on DailyWordNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyWordNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyWordNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyWordNotification value)  $default,){
final _that = this;
switch (_that) {
case _DailyWordNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyWordNotification value)?  $default,){
final _that = this;
switch (_that) {
case _DailyWordNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String notificationId,  String userId,  DailyWord word,  DateTime sentAt,  DateTime scheduledFor,  bool isRead)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyWordNotification() when $default != null:
return $default(_that.notificationId,_that.userId,_that.word,_that.sentAt,_that.scheduledFor,_that.isRead);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String notificationId,  String userId,  DailyWord word,  DateTime sentAt,  DateTime scheduledFor,  bool isRead)  $default,) {final _that = this;
switch (_that) {
case _DailyWordNotification():
return $default(_that.notificationId,_that.userId,_that.word,_that.sentAt,_that.scheduledFor,_that.isRead);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String notificationId,  String userId,  DailyWord word,  DateTime sentAt,  DateTime scheduledFor,  bool isRead)?  $default,) {final _that = this;
switch (_that) {
case _DailyWordNotification() when $default != null:
return $default(_that.notificationId,_that.userId,_that.word,_that.sentAt,_that.scheduledFor,_that.isRead);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyWordNotification implements DailyWordNotification {
  const _DailyWordNotification({required this.notificationId, required this.userId, required this.word, required this.sentAt, required this.scheduledFor, this.isRead = false});
  factory _DailyWordNotification.fromJson(Map<String, dynamic> json) => _$DailyWordNotificationFromJson(json);

@override final  String notificationId;
@override final  String userId;
@override final  DailyWord word;
@override final  DateTime sentAt;
@override final  DateTime scheduledFor;
@override@JsonKey() final  bool isRead;

/// Create a copy of DailyWordNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyWordNotificationCopyWith<_DailyWordNotification> get copyWith => __$DailyWordNotificationCopyWithImpl<_DailyWordNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyWordNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyWordNotification&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.word, word) || other.word == word)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.scheduledFor, scheduledFor) || other.scheduledFor == scheduledFor)&&(identical(other.isRead, isRead) || other.isRead == isRead));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,notificationId,userId,word,sentAt,scheduledFor,isRead);
}

@override
String toString() {
    return 'DailyWordNotification(notificationId: $notificationId, userId: $userId, word: $word, sentAt: $sentAt, scheduledFor: $scheduledFor, isRead: $isRead)';
}


}

/// @nodoc
abstract mixin class _$DailyWordNotificationCopyWith<$Res> implements $DailyWordNotificationCopyWith<$Res> {
  factory _$DailyWordNotificationCopyWith(_DailyWordNotification value, $Res Function(_DailyWordNotification) _then) = __$DailyWordNotificationCopyWithImpl;
@override @useResult
$Res call({
 String notificationId, String userId, DailyWord word, DateTime sentAt, DateTime scheduledFor, bool isRead
});


@override $DailyWordCopyWith<$Res> get word;

}
/// @nodoc
class __$DailyWordNotificationCopyWithImpl<$Res>
    implements _$DailyWordNotificationCopyWith<$Res> {
  __$DailyWordNotificationCopyWithImpl(this._self, this._then);

  final _DailyWordNotification _self;
  final $Res Function(_DailyWordNotification) _then;

/// Create a copy of DailyWordNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notificationId = null,Object? userId = null,Object? word = null,Object? sentAt = null,Object? scheduledFor = null,Object? isRead = null,}) {
  return _then(_DailyWordNotification(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as DailyWord,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,scheduledFor: null == scheduledFor ? _self.scheduledFor : scheduledFor // ignore: cast_nullable_to_non_nullable
as DateTime,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of DailyWordNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyWordCopyWith<$Res> get word {
  
  return $DailyWordCopyWith<$Res>(_self.word, (value) {
    return _then(_self.copyWith(word: value));
  });
}
}

// dart format on
