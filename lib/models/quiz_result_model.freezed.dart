// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizResultModel {

 String get resultId; String get userId; DateTime get quizDate; String get questionWordId; bool get correctAnswer; String get selectedAnswer; String get correctAnswerText; DateTime get completedAt;
/// Create a copy of QuizResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizResultModelCopyWith<QuizResultModel> get copyWith => _$QuizResultModelCopyWithImpl<QuizResultModel>(this as QuizResultModel, _$identity);

  /// Serializes this QuizResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuizResultModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizResultModel&&(identical(other.resultId, _this.resultId) || other.resultId == _this.resultId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.quizDate, _this.quizDate) || other.quizDate == _this.quizDate)&&(identical(other.questionWordId, _this.questionWordId) || other.questionWordId == _this.questionWordId)&&(identical(other.correctAnswer, _this.correctAnswer) || other.correctAnswer == _this.correctAnswer)&&(identical(other.selectedAnswer, _this.selectedAnswer) || other.selectedAnswer == _this.selectedAnswer)&&(identical(other.correctAnswerText, _this.correctAnswerText) || other.correctAnswerText == _this.correctAnswerText)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuizResultModel;
  return Object.hash(runtimeType,_this.resultId,_this.userId,_this.quizDate,_this.questionWordId,_this.correctAnswer,_this.selectedAnswer,_this.correctAnswerText,_this.completedAt);
}

@override
String toString() {
  final _this = this as QuizResultModel;
  return 'QuizResultModel(resultId: ${_this.resultId}, userId: ${_this.userId}, quizDate: ${_this.quizDate}, questionWordId: ${_this.questionWordId}, correctAnswer: ${_this.correctAnswer}, selectedAnswer: ${_this.selectedAnswer}, correctAnswerText: ${_this.correctAnswerText}, completedAt: ${_this.completedAt})';
}


}

/// @nodoc
abstract mixin class $QuizResultModelCopyWith<$Res>  {
  factory $QuizResultModelCopyWith(QuizResultModel value, $Res Function(QuizResultModel) _then) = _$QuizResultModelCopyWithImpl;
@useResult
$Res call({
 String resultId, String userId, DateTime quizDate, String questionWordId, bool correctAnswer, String selectedAnswer, String correctAnswerText, DateTime completedAt
});




}
/// @nodoc
class _$QuizResultModelCopyWithImpl<$Res>
    implements $QuizResultModelCopyWith<$Res> {
  _$QuizResultModelCopyWithImpl(this._self, this._then);

  final QuizResultModel _self;
  final $Res Function(QuizResultModel) _then;

/// Create a copy of QuizResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resultId = null,Object? userId = null,Object? quizDate = null,Object? questionWordId = null,Object? correctAnswer = null,Object? selectedAnswer = null,Object? correctAnswerText = null,Object? completedAt = null,}) {
  return _then(QuizResultModel(
resultId: null == resultId ? _self.resultId : resultId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,quizDate: null == quizDate ? _self.quizDate : quizDate // ignore: cast_nullable_to_non_nullable
as DateTime,questionWordId: null == questionWordId ? _self.questionWordId : questionWordId // ignore: cast_nullable_to_non_nullable
as String,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as bool,selectedAnswer: null == selectedAnswer ? _self.selectedAnswer : selectedAnswer // ignore: cast_nullable_to_non_nullable
as String,correctAnswerText: null == correctAnswerText ? _self.correctAnswerText : correctAnswerText // ignore: cast_nullable_to_non_nullable
as String,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizResultModel].
extension QuizResultModelPatterns on QuizResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizResultModel value)  $default,){
final _that = this;
switch (_that) {
case _QuizResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuizResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String resultId,  String userId,  DateTime quizDate,  String questionWordId,  bool correctAnswer,  String selectedAnswer,  String correctAnswerText,  DateTime completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizResultModel() when $default != null:
return $default(_that.resultId,_that.userId,_that.quizDate,_that.questionWordId,_that.correctAnswer,_that.selectedAnswer,_that.correctAnswerText,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String resultId,  String userId,  DateTime quizDate,  String questionWordId,  bool correctAnswer,  String selectedAnswer,  String correctAnswerText,  DateTime completedAt)  $default,) {final _that = this;
switch (_that) {
case _QuizResultModel():
return $default(_that.resultId,_that.userId,_that.quizDate,_that.questionWordId,_that.correctAnswer,_that.selectedAnswer,_that.correctAnswerText,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String resultId,  String userId,  DateTime quizDate,  String questionWordId,  bool correctAnswer,  String selectedAnswer,  String correctAnswerText,  DateTime completedAt)?  $default,) {final _that = this;
switch (_that) {
case _QuizResultModel() when $default != null:
return $default(_that.resultId,_that.userId,_that.quizDate,_that.questionWordId,_that.correctAnswer,_that.selectedAnswer,_that.correctAnswerText,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizResultModel implements QuizResultModel {
  const _QuizResultModel({required this.resultId, required this.userId, required this.quizDate, required this.questionWordId, required this.correctAnswer, required this.selectedAnswer, required this.correctAnswerText, required this.completedAt});
  factory _QuizResultModel.fromJson(Map<String, dynamic> json) => _$QuizResultModelFromJson(json);

@override final  String resultId;
@override final  String userId;
@override final  DateTime quizDate;
@override final  String questionWordId;
@override final  bool correctAnswer;
@override final  String selectedAnswer;
@override final  String correctAnswerText;
@override final  DateTime completedAt;

/// Create a copy of QuizResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizResultModelCopyWith<_QuizResultModel> get copyWith => __$QuizResultModelCopyWithImpl<_QuizResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizResultModel&&(identical(other.resultId, resultId) || other.resultId == resultId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.quizDate, quizDate) || other.quizDate == quizDate)&&(identical(other.questionWordId, questionWordId) || other.questionWordId == questionWordId)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.selectedAnswer, selectedAnswer) || other.selectedAnswer == selectedAnswer)&&(identical(other.correctAnswerText, correctAnswerText) || other.correctAnswerText == correctAnswerText)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,resultId,userId,quizDate,questionWordId,correctAnswer,selectedAnswer,correctAnswerText,completedAt);
}

@override
String toString() {
    return 'QuizResultModel(resultId: $resultId, userId: $userId, quizDate: $quizDate, questionWordId: $questionWordId, correctAnswer: $correctAnswer, selectedAnswer: $selectedAnswer, correctAnswerText: $correctAnswerText, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$QuizResultModelCopyWith<$Res> implements $QuizResultModelCopyWith<$Res> {
  factory _$QuizResultModelCopyWith(_QuizResultModel value, $Res Function(_QuizResultModel) _then) = __$QuizResultModelCopyWithImpl;
@override @useResult
$Res call({
 String resultId, String userId, DateTime quizDate, String questionWordId, bool correctAnswer, String selectedAnswer, String correctAnswerText, DateTime completedAt
});




}
/// @nodoc
class __$QuizResultModelCopyWithImpl<$Res>
    implements _$QuizResultModelCopyWith<$Res> {
  __$QuizResultModelCopyWithImpl(this._self, this._then);

  final _QuizResultModel _self;
  final $Res Function(_QuizResultModel) _then;

/// Create a copy of QuizResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resultId = null,Object? userId = null,Object? quizDate = null,Object? questionWordId = null,Object? correctAnswer = null,Object? selectedAnswer = null,Object? correctAnswerText = null,Object? completedAt = null,}) {
  return _then(_QuizResultModel(
resultId: null == resultId ? _self.resultId : resultId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,quizDate: null == quizDate ? _self.quizDate : quizDate // ignore: cast_nullable_to_non_nullable
as DateTime,questionWordId: null == questionWordId ? _self.questionWordId : questionWordId // ignore: cast_nullable_to_non_nullable
as String,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as bool,selectedAnswer: null == selectedAnswer ? _self.selectedAnswer : selectedAnswer // ignore: cast_nullable_to_non_nullable
as String,correctAnswerText: null == correctAnswerText ? _self.correctAnswerText : correctAnswerText // ignore: cast_nullable_to_non_nullable
as String,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
