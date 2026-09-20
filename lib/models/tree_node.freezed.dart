// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TreeNode {

 String get wordId; String get wordName; int get depth; DateTime get addedAt; List<String> get childWordIds; List<String> get connectedKanji;
/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreeNodeCopyWith<TreeNode> get copyWith => _$TreeNodeCopyWithImpl<TreeNode>(this as TreeNode, _$identity);

  /// Serializes this TreeNode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TreeNode;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreeNode&&(identical(other.wordId, _this.wordId) || other.wordId == _this.wordId)&&(identical(other.wordName, _this.wordName) || other.wordName == _this.wordName)&&(identical(other.depth, _this.depth) || other.depth == _this.depth)&&(identical(other.addedAt, _this.addedAt) || other.addedAt == _this.addedAt)&&const DeepCollectionEquality().equals(other.childWordIds, _this.childWordIds)&&const DeepCollectionEquality().equals(other.connectedKanji, _this.connectedKanji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TreeNode;
  return Object.hash(runtimeType,_this.wordId,_this.wordName,_this.depth,_this.addedAt,const DeepCollectionEquality().hash(_this.childWordIds),const DeepCollectionEquality().hash(_this.connectedKanji));
}

@override
String toString() {
  final _this = this as TreeNode;
  return 'TreeNode(wordId: ${_this.wordId}, wordName: ${_this.wordName}, depth: ${_this.depth}, addedAt: ${_this.addedAt}, childWordIds: ${_this.childWordIds}, connectedKanji: ${_this.connectedKanji})';
}


}

/// @nodoc
abstract mixin class $TreeNodeCopyWith<$Res>  {
  factory $TreeNodeCopyWith(TreeNode value, $Res Function(TreeNode) _then) = _$TreeNodeCopyWithImpl;
@useResult
$Res call({
 String wordId, String wordName, int depth, DateTime addedAt, List<String> childWordIds, List<String> connectedKanji
});




}
/// @nodoc
class _$TreeNodeCopyWithImpl<$Res>
    implements $TreeNodeCopyWith<$Res> {
  _$TreeNodeCopyWithImpl(this._self, this._then);

  final TreeNode _self;
  final $Res Function(TreeNode) _then;

/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wordId = null,Object? wordName = null,Object? depth = null,Object? addedAt = null,Object? childWordIds = null,Object? connectedKanji = null,}) {
  return _then(TreeNode(
wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,depth: null == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as int,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,childWordIds: null == childWordIds ? _self.childWordIds : childWordIds // ignore: cast_nullable_to_non_nullable
as List<String>,connectedKanji: null == connectedKanji ? _self.connectedKanji : connectedKanji // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TreeNode].
extension TreeNodePatterns on TreeNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TreeNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TreeNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TreeNode value)  $default,){
final _that = this;
switch (_that) {
case _TreeNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TreeNode value)?  $default,){
final _that = this;
switch (_that) {
case _TreeNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String wordId,  String wordName,  int depth,  DateTime addedAt,  List<String> childWordIds,  List<String> connectedKanji)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TreeNode() when $default != null:
return $default(_that.wordId,_that.wordName,_that.depth,_that.addedAt,_that.childWordIds,_that.connectedKanji);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String wordId,  String wordName,  int depth,  DateTime addedAt,  List<String> childWordIds,  List<String> connectedKanji)  $default,) {final _that = this;
switch (_that) {
case _TreeNode():
return $default(_that.wordId,_that.wordName,_that.depth,_that.addedAt,_that.childWordIds,_that.connectedKanji);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String wordId,  String wordName,  int depth,  DateTime addedAt,  List<String> childWordIds,  List<String> connectedKanji)?  $default,) {final _that = this;
switch (_that) {
case _TreeNode() when $default != null:
return $default(_that.wordId,_that.wordName,_that.depth,_that.addedAt,_that.childWordIds,_that.connectedKanji);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TreeNode implements TreeNode {
  const _TreeNode({required this.wordId, required this.wordName, required this.depth, required this.addedAt,  List<String> childWordIds = const [],  List<String> connectedKanji = const []}): _childWordIds = childWordIds,_connectedKanji = connectedKanji;
  factory _TreeNode.fromJson(Map<String, dynamic> json) => _$TreeNodeFromJson(json);

@override final  String wordId;
@override final  String wordName;
@override final  int depth;
@override final  DateTime addedAt;
 final  List<String> _childWordIds;
@override@JsonKey() List<String> get childWordIds {
  if (_childWordIds is EqualUnmodifiableListView) return _childWordIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_childWordIds);
}

 final  List<String> _connectedKanji;
@override@JsonKey() List<String> get connectedKanji {
  if (_connectedKanji is EqualUnmodifiableListView) return _connectedKanji;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connectedKanji);
}


/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TreeNodeCopyWith<_TreeNode> get copyWith => __$TreeNodeCopyWithImpl<_TreeNode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TreeNodeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TreeNode&&(identical(other.wordId, wordId) || other.wordId == wordId)&&(identical(other.wordName, wordName) || other.wordName == wordName)&&(identical(other.depth, depth) || other.depth == depth)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&const DeepCollectionEquality().equals(other.childWordIds, _childWordIds)&&const DeepCollectionEquality().equals(other.connectedKanji, _connectedKanji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,wordId,wordName,depth,addedAt,const DeepCollectionEquality().hash(_childWordIds),const DeepCollectionEquality().hash(_connectedKanji));
}

@override
String toString() {
    return 'TreeNode(wordId: $wordId, wordName: $wordName, depth: $depth, addedAt: $addedAt, childWordIds: $childWordIds, connectedKanji: $connectedKanji)';
}


}

/// @nodoc
abstract mixin class _$TreeNodeCopyWith<$Res> implements $TreeNodeCopyWith<$Res> {
  factory _$TreeNodeCopyWith(_TreeNode value, $Res Function(_TreeNode) _then) = __$TreeNodeCopyWithImpl;
@override @useResult
$Res call({
 String wordId, String wordName, int depth, DateTime addedAt, List<String> childWordIds, List<String> connectedKanji
});




}
/// @nodoc
class __$TreeNodeCopyWithImpl<$Res>
    implements _$TreeNodeCopyWith<$Res> {
  __$TreeNodeCopyWithImpl(this._self, this._then);

  final _TreeNode _self;
  final $Res Function(_TreeNode) _then;

/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wordId = null,Object? wordName = null,Object? depth = null,Object? addedAt = null,Object? childWordIds = null,Object? connectedKanji = null,}) {
  return _then(_TreeNode(
wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,depth: null == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as int,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,childWordIds: null == childWordIds ? _self._childWordIds : childWordIds // ignore: cast_nullable_to_non_nullable
as List<String>,connectedKanji: null == connectedKanji ? _self._connectedKanji : connectedKanji // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$WordTree {

 String get userId; int get totalWords; DateTime get createdAt; List<TreeNode> get nodes; int get treeLevelUnlocked; DateTime? get lastUpdated;
/// Create a copy of WordTree
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordTreeCopyWith<WordTree> get copyWith => _$WordTreeCopyWithImpl<WordTree>(this as WordTree, _$identity);

  /// Serializes this WordTree to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WordTree;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordTree&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.totalWords, _this.totalWords) || other.totalWords == _this.totalWords)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&const DeepCollectionEquality().equals(other.nodes, _this.nodes)&&(identical(other.treeLevelUnlocked, _this.treeLevelUnlocked) || other.treeLevelUnlocked == _this.treeLevelUnlocked)&&(identical(other.lastUpdated, _this.lastUpdated) || other.lastUpdated == _this.lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WordTree;
  return Object.hash(runtimeType,_this.userId,_this.totalWords,_this.createdAt,const DeepCollectionEquality().hash(_this.nodes),_this.treeLevelUnlocked,_this.lastUpdated);
}

@override
String toString() {
  final _this = this as WordTree;
  return 'WordTree(userId: ${_this.userId}, totalWords: ${_this.totalWords}, createdAt: ${_this.createdAt}, nodes: ${_this.nodes}, treeLevelUnlocked: ${_this.treeLevelUnlocked}, lastUpdated: ${_this.lastUpdated})';
}


}

/// @nodoc
abstract mixin class $WordTreeCopyWith<$Res>  {
  factory $WordTreeCopyWith(WordTree value, $Res Function(WordTree) _then) = _$WordTreeCopyWithImpl;
@useResult
$Res call({
 String userId, int totalWords, DateTime createdAt, List<TreeNode> nodes, int treeLevelUnlocked, DateTime? lastUpdated
});




}
/// @nodoc
class _$WordTreeCopyWithImpl<$Res>
    implements $WordTreeCopyWith<$Res> {
  _$WordTreeCopyWithImpl(this._self, this._then);

  final WordTree _self;
  final $Res Function(WordTree) _then;

/// Create a copy of WordTree
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? totalWords = null,Object? createdAt = null,Object? nodes = null,Object? treeLevelUnlocked = null,Object? lastUpdated = freezed,}) {
  return _then(WordTree(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,totalWords: null == totalWords ? _self.totalWords : totalWords // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,nodes: null == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<TreeNode>,treeLevelUnlocked: null == treeLevelUnlocked ? _self.treeLevelUnlocked : treeLevelUnlocked // ignore: cast_nullable_to_non_nullable
as int,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [WordTree].
extension WordTreePatterns on WordTree {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordTree value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordTree() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordTree value)  $default,){
final _that = this;
switch (_that) {
case _WordTree():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordTree value)?  $default,){
final _that = this;
switch (_that) {
case _WordTree() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  int totalWords,  DateTime createdAt,  List<TreeNode> nodes,  int treeLevelUnlocked,  DateTime? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordTree() when $default != null:
return $default(_that.userId,_that.totalWords,_that.createdAt,_that.nodes,_that.treeLevelUnlocked,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  int totalWords,  DateTime createdAt,  List<TreeNode> nodes,  int treeLevelUnlocked,  DateTime? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _WordTree():
return $default(_that.userId,_that.totalWords,_that.createdAt,_that.nodes,_that.treeLevelUnlocked,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  int totalWords,  DateTime createdAt,  List<TreeNode> nodes,  int treeLevelUnlocked,  DateTime? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _WordTree() when $default != null:
return $default(_that.userId,_that.totalWords,_that.createdAt,_that.nodes,_that.treeLevelUnlocked,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WordTree implements WordTree {
  const _WordTree({required this.userId, required this.totalWords, required this.createdAt,  List<TreeNode> nodes = const [], required this.treeLevelUnlocked, this.lastUpdated}): _nodes = nodes;
  factory _WordTree.fromJson(Map<String, dynamic> json) => _$WordTreeFromJson(json);

@override final  String userId;
@override final  int totalWords;
@override final  DateTime createdAt;
 final  List<TreeNode> _nodes;
@override@JsonKey() List<TreeNode> get nodes {
  if (_nodes is EqualUnmodifiableListView) return _nodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nodes);
}

@override final  int treeLevelUnlocked;
@override final  DateTime? lastUpdated;

/// Create a copy of WordTree
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordTreeCopyWith<_WordTree> get copyWith => __$WordTreeCopyWithImpl<_WordTree>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WordTreeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordTree&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.totalWords, totalWords) || other.totalWords == totalWords)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.nodes, _nodes)&&(identical(other.treeLevelUnlocked, treeLevelUnlocked) || other.treeLevelUnlocked == treeLevelUnlocked)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId,totalWords,createdAt,const DeepCollectionEquality().hash(_nodes),treeLevelUnlocked,lastUpdated);
}

@override
String toString() {
    return 'WordTree(userId: $userId, totalWords: $totalWords, createdAt: $createdAt, nodes: $nodes, treeLevelUnlocked: $treeLevelUnlocked, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$WordTreeCopyWith<$Res> implements $WordTreeCopyWith<$Res> {
  factory _$WordTreeCopyWith(_WordTree value, $Res Function(_WordTree) _then) = __$WordTreeCopyWithImpl;
@override @useResult
$Res call({
 String userId, int totalWords, DateTime createdAt, List<TreeNode> nodes, int treeLevelUnlocked, DateTime? lastUpdated
});




}
/// @nodoc
class __$WordTreeCopyWithImpl<$Res>
    implements _$WordTreeCopyWith<$Res> {
  __$WordTreeCopyWithImpl(this._self, this._then);

  final _WordTree _self;
  final $Res Function(_WordTree) _then;

/// Create a copy of WordTree
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? totalWords = null,Object? createdAt = null,Object? nodes = null,Object? treeLevelUnlocked = null,Object? lastUpdated = freezed,}) {
  return _then(_WordTree(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,totalWords: null == totalWords ? _self.totalWords : totalWords // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,nodes: null == nodes ? _self._nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<TreeNode>,treeLevelUnlocked: null == treeLevelUnlocked ? _self.treeLevelUnlocked : treeLevelUnlocked // ignore: cast_nullable_to_non_nullable
as int,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
