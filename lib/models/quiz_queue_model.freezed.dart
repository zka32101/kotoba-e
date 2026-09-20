// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_queue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizQueueModel {

 String get queueId; String get date; String get userId; String get wordId; String get wordName; int get questionIndex; DateTime get createdAt;
/// Create a copy of QuizQueueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizQueueModelCopyWith<QuizQueueModel> get copyWith => _$QuizQueueModelCopyWithImpl<QuizQueueModel>(this as QuizQueueModel, _$identity);

  /// Serializes this QuizQueueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuizQueueModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizQueueModel&&(identical(other.queueId, _this.queueId) || other.queueId == _this.queueId)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.wordId, _this.wordId) || other.wordId == _this.wordId)&&(identical(other.wordName, _this.wordName) || other.wordName == _this.wordName)&&(identical(other.questionIndex, _this.questionIndex) || other.questionIndex == _this.questionIndex)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuizQueueModel;
  return Object.hash(runtimeType,_this.queueId,_this.date,_this.userId,_this.wordId,_this.wordName,_this.questionIndex,_this.createdAt);
}

@override
String toString() {
  final _this = this as QuizQueueModel;
  return 'QuizQueueModel(queueId: ${_this.queueId}, date: ${_this.date}, userId: ${_this.userId}, wordId: ${_this.wordId}, wordName: ${_this.wordName}, questionIndex: ${_this.questionIndex}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $QuizQueueModelCopyWith<$Res>  {
  factory $QuizQueueModelCopyWith(QuizQueueModel value, $Res Function(QuizQueueModel) _then) = _$QuizQueueModelCopyWithImpl;
@useResult
$Res call({
 String queueId, String date, String userId, String wordId, String wordName, int questionIndex, DateTime createdAt
});




}
/// @nodoc
class _$QuizQueueModelCopyWithImpl<$Res>
    implements $QuizQueueModelCopyWith<$Res> {
  _$QuizQueueModelCopyWithImpl(this._self, this._then);

  final QuizQueueModel _self;
  final $Res Function(QuizQueueModel) _then;

/// Create a copy of QuizQueueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? queueId = null,Object? date = null,Object? userId = null,Object? wordId = null,Object? wordName = null,Object? questionIndex = null,Object? createdAt = null,}) {
  return _then(QuizQueueModel(
queueId: null == queueId ? _self.queueId : queueId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,questionIndex: null == questionIndex ? _self.questionIndex : questionIndex // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizQueueModel].
extension QuizQueueModelPatterns on QuizQueueModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizQueueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizQueueModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizQueueModel value)  $default,){
final _that = this;
switch (_that) {
case _QuizQueueModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizQueueModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuizQueueModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String queueId,  String date,  String userId,  String wordId,  String wordName,  int questionIndex,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizQueueModel() when $default != null:
return $default(_that.queueId,_that.date,_that.userId,_that.wordId,_that.wordName,_that.questionIndex,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String queueId,  String date,  String userId,  String wordId,  String wordName,  int questionIndex,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _QuizQueueModel():
return $default(_that.queueId,_that.date,_that.userId,_that.wordId,_that.wordName,_that.questionIndex,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String queueId,  String date,  String userId,  String wordId,  String wordName,  int questionIndex,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _QuizQueueModel() when $default != null:
return $default(_that.queueId,_that.date,_that.userId,_that.wordId,_that.wordName,_that.questionIndex,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizQueueModel implements QuizQueueModel {
  const _QuizQueueModel({required this.queueId, required this.date, required this.userId, required this.wordId, required this.wordName, required this.questionIndex, required this.createdAt});
  factory _QuizQueueModel.fromJson(Map<String, dynamic> json) => _$QuizQueueModelFromJson(json);

@override final  String queueId;
@override final  String date;
@override final  String userId;
@override final  String wordId;
@override final  String wordName;
@override final  int questionIndex;
@override final  DateTime createdAt;

/// Create a copy of QuizQueueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizQueueModelCopyWith<_QuizQueueModel> get copyWith => __$QuizQueueModelCopyWithImpl<_QuizQueueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizQueueModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizQueueModel&&(identical(other.queueId, queueId) || other.queueId == queueId)&&(identical(other.date, date) || other.date == date)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.wordId, wordId) || other.wordId == wordId)&&(identical(other.wordName, wordName) || other.wordName == wordName)&&(identical(other.questionIndex, questionIndex) || other.questionIndex == questionIndex)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,queueId,date,userId,wordId,wordName,questionIndex,createdAt);
}

@override
String toString() {
    return 'QuizQueueModel(queueId: $queueId, date: $date, userId: $userId, wordId: $wordId, wordName: $wordName, questionIndex: $questionIndex, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$QuizQueueModelCopyWith<$Res> implements $QuizQueueModelCopyWith<$Res> {
  factory _$QuizQueueModelCopyWith(_QuizQueueModel value, $Res Function(_QuizQueueModel) _then) = __$QuizQueueModelCopyWithImpl;
@override @useResult
$Res call({
 String queueId, String date, String userId, String wordId, String wordName, int questionIndex, DateTime createdAt
});




}
/// @nodoc
class __$QuizQueueModelCopyWithImpl<$Res>
    implements _$QuizQueueModelCopyWith<$Res> {
  __$QuizQueueModelCopyWithImpl(this._self, this._then);

  final _QuizQueueModel _self;
  final $Res Function(_QuizQueueModel) _then;

/// Create a copy of QuizQueueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? queueId = null,Object? date = null,Object? userId = null,Object? wordId = null,Object? wordName = null,Object? questionIndex = null,Object? createdAt = null,}) {
  return _then(_QuizQueueModel(
queueId: null == queueId ? _self.queueId : queueId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,questionIndex: null == questionIndex ? _self.questionIndex : questionIndex // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$QuizQuestion {

 String get wordId; String get wordName; String get question; List<String> get options; int get correctIndex; int get questionNumber; int get totalQuestions;
/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizQuestionCopyWith<QuizQuestion> get copyWith => _$QuizQuestionCopyWithImpl<QuizQuestion>(this as QuizQuestion, _$identity);

  /// Serializes this QuizQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuizQuestion;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizQuestion&&(identical(other.wordId, _this.wordId) || other.wordId == _this.wordId)&&(identical(other.wordName, _this.wordName) || other.wordName == _this.wordName)&&(identical(other.question, _this.question) || other.question == _this.question)&&const DeepCollectionEquality().equals(other.options, _this.options)&&(identical(other.correctIndex, _this.correctIndex) || other.correctIndex == _this.correctIndex)&&(identical(other.questionNumber, _this.questionNumber) || other.questionNumber == _this.questionNumber)&&(identical(other.totalQuestions, _this.totalQuestions) || other.totalQuestions == _this.totalQuestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuizQuestion;
  return Object.hash(runtimeType,_this.wordId,_this.wordName,_this.question,const DeepCollectionEquality().hash(_this.options),_this.correctIndex,_this.questionNumber,_this.totalQuestions);
}

@override
String toString() {
  final _this = this as QuizQuestion;
  return 'QuizQuestion(wordId: ${_this.wordId}, wordName: ${_this.wordName}, question: ${_this.question}, options: ${_this.options}, correctIndex: ${_this.correctIndex}, questionNumber: ${_this.questionNumber}, totalQuestions: ${_this.totalQuestions})';
}


}

/// @nodoc
abstract mixin class $QuizQuestionCopyWith<$Res>  {
  factory $QuizQuestionCopyWith(QuizQuestion value, $Res Function(QuizQuestion) _then) = _$QuizQuestionCopyWithImpl;
@useResult
$Res call({
 String wordId, String wordName, String question, List<String> options, int correctIndex, int questionNumber, int totalQuestions
});




}
/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._self, this._then);

  final QuizQuestion _self;
  final $Res Function(QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wordId = null,Object? wordName = null,Object? question = null,Object? options = null,Object? correctIndex = null,Object? questionNumber = null,Object? totalQuestions = null,}) {
  return _then(QuizQuestion(
wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctIndex: null == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,questionNumber: null == questionNumber ? _self.questionNumber : questionNumber // ignore: cast_nullable_to_non_nullable
as int,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizQuestion].
extension QuizQuestionPatterns on QuizQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizQuestion value)  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String wordId,  String wordName,  String question,  List<String> options,  int correctIndex,  int questionNumber,  int totalQuestions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.wordId,_that.wordName,_that.question,_that.options,_that.correctIndex,_that.questionNumber,_that.totalQuestions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String wordId,  String wordName,  String question,  List<String> options,  int correctIndex,  int questionNumber,  int totalQuestions)  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion():
return $default(_that.wordId,_that.wordName,_that.question,_that.options,_that.correctIndex,_that.questionNumber,_that.totalQuestions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String wordId,  String wordName,  String question,  List<String> options,  int correctIndex,  int questionNumber,  int totalQuestions)?  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.wordId,_that.wordName,_that.question,_that.options,_that.correctIndex,_that.questionNumber,_that.totalQuestions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizQuestion implements QuizQuestion {
  const _QuizQuestion({required this.wordId, required this.wordName, required this.question, required  List<String> options, required this.correctIndex, required this.questionNumber, required this.totalQuestions}): _options = options;
  factory _QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);

@override final  String wordId;
@override final  String wordName;
@override final  String question;
 final  List<String> _options;
@override List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  int correctIndex;
@override final  int questionNumber;
@override final  int totalQuestions;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizQuestionCopyWith<_QuizQuestion> get copyWith => __$QuizQuestionCopyWithImpl<_QuizQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizQuestion&&(identical(other.wordId, wordId) || other.wordId == wordId)&&(identical(other.wordName, wordName) || other.wordName == wordName)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex)&&(identical(other.questionNumber, questionNumber) || other.questionNumber == questionNumber)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,wordId,wordName,question,const DeepCollectionEquality().hash(_options),correctIndex,questionNumber,totalQuestions);
}

@override
String toString() {
    return 'QuizQuestion(wordId: $wordId, wordName: $wordName, question: $question, options: $options, correctIndex: $correctIndex, questionNumber: $questionNumber, totalQuestions: $totalQuestions)';
}


}

/// @nodoc
abstract mixin class _$QuizQuestionCopyWith<$Res> implements $QuizQuestionCopyWith<$Res> {
  factory _$QuizQuestionCopyWith(_QuizQuestion value, $Res Function(_QuizQuestion) _then) = __$QuizQuestionCopyWithImpl;
@override @useResult
$Res call({
 String wordId, String wordName, String question, List<String> options, int correctIndex, int questionNumber, int totalQuestions
});




}
/// @nodoc
class __$QuizQuestionCopyWithImpl<$Res>
    implements _$QuizQuestionCopyWith<$Res> {
  __$QuizQuestionCopyWithImpl(this._self, this._then);

  final _QuizQuestion _self;
  final $Res Function(_QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wordId = null,Object? wordName = null,Object? question = null,Object? options = null,Object? correctIndex = null,Object? questionNumber = null,Object? totalQuestions = null,}) {
  return _then(_QuizQuestion(
wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctIndex: null == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,questionNumber: null == questionNumber ? _self.questionNumber : questionNumber // ignore: cast_nullable_to_non_nullable
as int,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$QuizAnswer {

 String get wordId; bool get isCorrect; String get explanation; DateTime get nextReviewDate; String get newDifficulty;
/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizAnswerCopyWith<QuizAnswer> get copyWith => _$QuizAnswerCopyWithImpl<QuizAnswer>(this as QuizAnswer, _$identity);

  /// Serializes this QuizAnswer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuizAnswer;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizAnswer&&(identical(other.wordId, _this.wordId) || other.wordId == _this.wordId)&&(identical(other.isCorrect, _this.isCorrect) || other.isCorrect == _this.isCorrect)&&(identical(other.explanation, _this.explanation) || other.explanation == _this.explanation)&&(identical(other.nextReviewDate, _this.nextReviewDate) || other.nextReviewDate == _this.nextReviewDate)&&(identical(other.newDifficulty, _this.newDifficulty) || other.newDifficulty == _this.newDifficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuizAnswer;
  return Object.hash(runtimeType,_this.wordId,_this.isCorrect,_this.explanation,_this.nextReviewDate,_this.newDifficulty);
}

@override
String toString() {
  final _this = this as QuizAnswer;
  return 'QuizAnswer(wordId: ${_this.wordId}, isCorrect: ${_this.isCorrect}, explanation: ${_this.explanation}, nextReviewDate: ${_this.nextReviewDate}, newDifficulty: ${_this.newDifficulty})';
}


}

/// @nodoc
abstract mixin class $QuizAnswerCopyWith<$Res>  {
  factory $QuizAnswerCopyWith(QuizAnswer value, $Res Function(QuizAnswer) _then) = _$QuizAnswerCopyWithImpl;
@useResult
$Res call({
 String wordId, bool isCorrect, String explanation, DateTime nextReviewDate, String newDifficulty
});




}
/// @nodoc
class _$QuizAnswerCopyWithImpl<$Res>
    implements $QuizAnswerCopyWith<$Res> {
  _$QuizAnswerCopyWithImpl(this._self, this._then);

  final QuizAnswer _self;
  final $Res Function(QuizAnswer) _then;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wordId = null,Object? isCorrect = null,Object? explanation = null,Object? nextReviewDate = null,Object? newDifficulty = null,}) {
  return _then(QuizAnswer(
wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,nextReviewDate: null == nextReviewDate ? _self.nextReviewDate : nextReviewDate // ignore: cast_nullable_to_non_nullable
as DateTime,newDifficulty: null == newDifficulty ? _self.newDifficulty : newDifficulty // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizAnswer].
extension QuizAnswerPatterns on QuizAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizAnswer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizAnswer value)  $default,){
final _that = this;
switch (_that) {
case _QuizAnswer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _QuizAnswer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String wordId,  bool isCorrect,  String explanation,  DateTime nextReviewDate,  String newDifficulty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizAnswer() when $default != null:
return $default(_that.wordId,_that.isCorrect,_that.explanation,_that.nextReviewDate,_that.newDifficulty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String wordId,  bool isCorrect,  String explanation,  DateTime nextReviewDate,  String newDifficulty)  $default,) {final _that = this;
switch (_that) {
case _QuizAnswer():
return $default(_that.wordId,_that.isCorrect,_that.explanation,_that.nextReviewDate,_that.newDifficulty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String wordId,  bool isCorrect,  String explanation,  DateTime nextReviewDate,  String newDifficulty)?  $default,) {final _that = this;
switch (_that) {
case _QuizAnswer() when $default != null:
return $default(_that.wordId,_that.isCorrect,_that.explanation,_that.nextReviewDate,_that.newDifficulty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizAnswer implements QuizAnswer {
  const _QuizAnswer({required this.wordId, required this.isCorrect, required this.explanation, required this.nextReviewDate, required this.newDifficulty});
  factory _QuizAnswer.fromJson(Map<String, dynamic> json) => _$QuizAnswerFromJson(json);

@override final  String wordId;
@override final  bool isCorrect;
@override final  String explanation;
@override final  DateTime nextReviewDate;
@override final  String newDifficulty;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizAnswerCopyWith<_QuizAnswer> get copyWith => __$QuizAnswerCopyWithImpl<_QuizAnswer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizAnswerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizAnswer&&(identical(other.wordId, wordId) || other.wordId == wordId)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.nextReviewDate, nextReviewDate) || other.nextReviewDate == nextReviewDate)&&(identical(other.newDifficulty, newDifficulty) || other.newDifficulty == newDifficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,wordId,isCorrect,explanation,nextReviewDate,newDifficulty);
}

@override
String toString() {
    return 'QuizAnswer(wordId: $wordId, isCorrect: $isCorrect, explanation: $explanation, nextReviewDate: $nextReviewDate, newDifficulty: $newDifficulty)';
}


}

/// @nodoc
abstract mixin class _$QuizAnswerCopyWith<$Res> implements $QuizAnswerCopyWith<$Res> {
  factory _$QuizAnswerCopyWith(_QuizAnswer value, $Res Function(_QuizAnswer) _then) = __$QuizAnswerCopyWithImpl;
@override @useResult
$Res call({
 String wordId, bool isCorrect, String explanation, DateTime nextReviewDate, String newDifficulty
});




}
/// @nodoc
class __$QuizAnswerCopyWithImpl<$Res>
    implements _$QuizAnswerCopyWith<$Res> {
  __$QuizAnswerCopyWithImpl(this._self, this._then);

  final _QuizAnswer _self;
  final $Res Function(_QuizAnswer) _then;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wordId = null,Object? isCorrect = null,Object? explanation = null,Object? nextReviewDate = null,Object? newDifficulty = null,}) {
  return _then(_QuizAnswer(
wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,nextReviewDate: null == nextReviewDate ? _self.nextReviewDate : nextReviewDate // ignore: cast_nullable_to_non_nullable
as DateTime,newDifficulty: null == newDifficulty ? _self.newDifficulty : newDifficulty // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
