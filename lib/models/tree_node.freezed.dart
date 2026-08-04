// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TreeNode _$TreeNodeFromJson(Map<String, dynamic> json) {
  return _TreeNode.fromJson(json);
}

/// @nodoc
mixin _$TreeNode {
  String get wordId => throw _privateConstructorUsedError;
  String get wordName => throw _privateConstructorUsedError;
  int get depth => throw _privateConstructorUsedError;
  DateTime get addedAt => throw _privateConstructorUsedError;
  List<String> get childWordIds => throw _privateConstructorUsedError;
  List<String> get connectedKanji => throw _privateConstructorUsedError;

  /// Serializes this TreeNode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreeNodeCopyWith<TreeNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeNodeCopyWith<$Res> {
  factory $TreeNodeCopyWith(TreeNode value, $Res Function(TreeNode) then) =
      _$TreeNodeCopyWithImpl<$Res, TreeNode>;
  @useResult
  $Res call(
      {String wordId,
      String wordName,
      int depth,
      DateTime addedAt,
      List<String> childWordIds,
      List<String> connectedKanji});
}

/// @nodoc
class _$TreeNodeCopyWithImpl<$Res, $Val extends TreeNode>
    implements $TreeNodeCopyWith<$Res> {
  _$TreeNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordId = null,
    Object? wordName = null,
    Object? depth = null,
    Object? addedAt = null,
    Object? childWordIds = null,
    Object? connectedKanji = null,
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
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      childWordIds: null == childWordIds
          ? _value.childWordIds
          : childWordIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      connectedKanji: null == connectedKanji
          ? _value.connectedKanji
          : connectedKanji // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreeNodeImplCopyWith<$Res>
    implements $TreeNodeCopyWith<$Res> {
  factory _$$TreeNodeImplCopyWith(
          _$TreeNodeImpl value, $Res Function(_$TreeNodeImpl) then) =
      __$$TreeNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String wordId,
      String wordName,
      int depth,
      DateTime addedAt,
      List<String> childWordIds,
      List<String> connectedKanji});
}

/// @nodoc
class __$$TreeNodeImplCopyWithImpl<$Res>
    extends _$TreeNodeCopyWithImpl<$Res, _$TreeNodeImpl>
    implements _$$TreeNodeImplCopyWith<$Res> {
  __$$TreeNodeImplCopyWithImpl(
      _$TreeNodeImpl _value, $Res Function(_$TreeNodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordId = null,
    Object? wordName = null,
    Object? depth = null,
    Object? addedAt = null,
    Object? childWordIds = null,
    Object? connectedKanji = null,
  }) {
    return _then(_$TreeNodeImpl(
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      wordName: null == wordName
          ? _value.wordName
          : wordName // ignore: cast_nullable_to_non_nullable
              as String,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      childWordIds: null == childWordIds
          ? _value._childWordIds
          : childWordIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      connectedKanji: null == connectedKanji
          ? _value._connectedKanji
          : connectedKanji // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreeNodeImpl implements _TreeNode {
  const _$TreeNodeImpl(
      {required this.wordId,
      required this.wordName,
      required this.depth,
      required this.addedAt,
      final List<String> childWordIds = const [],
      final List<String> connectedKanji = const []})
      : _childWordIds = childWordIds,
        _connectedKanji = connectedKanji;

  factory _$TreeNodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreeNodeImplFromJson(json);

  @override
  final String wordId;
  @override
  final String wordName;
  @override
  final int depth;
  @override
  final DateTime addedAt;
  final List<String> _childWordIds;
  @override
  @JsonKey()
  List<String> get childWordIds {
    if (_childWordIds is EqualUnmodifiableListView) return _childWordIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_childWordIds);
  }

  final List<String> _connectedKanji;
  @override
  @JsonKey()
  List<String> get connectedKanji {
    if (_connectedKanji is EqualUnmodifiableListView) return _connectedKanji;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_connectedKanji);
  }

  @override
  String toString() {
    return 'TreeNode(wordId: $wordId, wordName: $wordName, depth: $depth, addedAt: $addedAt, childWordIds: $childWordIds, connectedKanji: $connectedKanji)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeNodeImpl &&
            (identical(other.wordId, wordId) || other.wordId == wordId) &&
            (identical(other.wordName, wordName) ||
                other.wordName == wordName) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            const DeepCollectionEquality()
                .equals(other._childWordIds, _childWordIds) &&
            const DeepCollectionEquality()
                .equals(other._connectedKanji, _connectedKanji));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      wordId,
      wordName,
      depth,
      addedAt,
      const DeepCollectionEquality().hash(_childWordIds),
      const DeepCollectionEquality().hash(_connectedKanji));

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeNodeImplCopyWith<_$TreeNodeImpl> get copyWith =>
      __$$TreeNodeImplCopyWithImpl<_$TreeNodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeNodeImplToJson(
      this,
    );
  }
}

abstract class _TreeNode implements TreeNode {
  const factory _TreeNode(
      {required final String wordId,
      required final String wordName,
      required final int depth,
      required final DateTime addedAt,
      final List<String> childWordIds,
      final List<String> connectedKanji}) = _$TreeNodeImpl;

  factory _TreeNode.fromJson(Map<String, dynamic> json) =
      _$TreeNodeImpl.fromJson;

  @override
  String get wordId;
  @override
  String get wordName;
  @override
  int get depth;
  @override
  DateTime get addedAt;
  @override
  List<String> get childWordIds;
  @override
  List<String> get connectedKanji;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreeNodeImplCopyWith<_$TreeNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WordTree _$WordTreeFromJson(Map<String, dynamic> json) {
  return _WordTree.fromJson(json);
}

/// @nodoc
mixin _$WordTree {
  String get userId => throw _privateConstructorUsedError;
  int get totalWords => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<TreeNode> get nodes => throw _privateConstructorUsedError;
  int get treeLevelUnlocked => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this WordTree to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordTree
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordTreeCopyWith<WordTree> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordTreeCopyWith<$Res> {
  factory $WordTreeCopyWith(WordTree value, $Res Function(WordTree) then) =
      _$WordTreeCopyWithImpl<$Res, WordTree>;
  @useResult
  $Res call(
      {String userId,
      int totalWords,
      DateTime createdAt,
      List<TreeNode> nodes,
      int treeLevelUnlocked,
      DateTime? lastUpdated});
}

/// @nodoc
class _$WordTreeCopyWithImpl<$Res, $Val extends WordTree>
    implements $WordTreeCopyWith<$Res> {
  _$WordTreeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordTree
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalWords = null,
    Object? createdAt = null,
    Object? nodes = null,
    Object? treeLevelUnlocked = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalWords: null == totalWords
          ? _value.totalWords
          : totalWords // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nodes: null == nodes
          ? _value.nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<TreeNode>,
      treeLevelUnlocked: null == treeLevelUnlocked
          ? _value.treeLevelUnlocked
          : treeLevelUnlocked // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordTreeImplCopyWith<$Res>
    implements $WordTreeCopyWith<$Res> {
  factory _$$WordTreeImplCopyWith(
          _$WordTreeImpl value, $Res Function(_$WordTreeImpl) then) =
      __$$WordTreeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      int totalWords,
      DateTime createdAt,
      List<TreeNode> nodes,
      int treeLevelUnlocked,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$WordTreeImplCopyWithImpl<$Res>
    extends _$WordTreeCopyWithImpl<$Res, _$WordTreeImpl>
    implements _$$WordTreeImplCopyWith<$Res> {
  __$$WordTreeImplCopyWithImpl(
      _$WordTreeImpl _value, $Res Function(_$WordTreeImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordTree
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalWords = null,
    Object? createdAt = null,
    Object? nodes = null,
    Object? treeLevelUnlocked = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$WordTreeImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalWords: null == totalWords
          ? _value.totalWords
          : totalWords // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nodes: null == nodes
          ? _value._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<TreeNode>,
      treeLevelUnlocked: null == treeLevelUnlocked
          ? _value.treeLevelUnlocked
          : treeLevelUnlocked // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordTreeImpl implements _WordTree {
  const _$WordTreeImpl(
      {required this.userId,
      required this.totalWords,
      required this.createdAt,
      final List<TreeNode> nodes = const [],
      required this.treeLevelUnlocked,
      this.lastUpdated})
      : _nodes = nodes;

  factory _$WordTreeImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordTreeImplFromJson(json);

  @override
  final String userId;
  @override
  final int totalWords;
  @override
  final DateTime createdAt;
  final List<TreeNode> _nodes;
  @override
  @JsonKey()
  List<TreeNode> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  @override
  final int treeLevelUnlocked;
  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'WordTree(userId: $userId, totalWords: $totalWords, createdAt: $createdAt, nodes: $nodes, treeLevelUnlocked: $treeLevelUnlocked, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordTreeImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalWords, totalWords) ||
                other.totalWords == totalWords) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._nodes, _nodes) &&
            (identical(other.treeLevelUnlocked, treeLevelUnlocked) ||
                other.treeLevelUnlocked == treeLevelUnlocked) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      totalWords,
      createdAt,
      const DeepCollectionEquality().hash(_nodes),
      treeLevelUnlocked,
      lastUpdated);

  /// Create a copy of WordTree
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordTreeImplCopyWith<_$WordTreeImpl> get copyWith =>
      __$$WordTreeImplCopyWithImpl<_$WordTreeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordTreeImplToJson(
      this,
    );
  }
}

abstract class _WordTree implements WordTree {
  const factory _WordTree(
      {required final String userId,
      required final int totalWords,
      required final DateTime createdAt,
      final List<TreeNode> nodes,
      required final int treeLevelUnlocked,
      final DateTime? lastUpdated}) = _$WordTreeImpl;

  factory _WordTree.fromJson(Map<String, dynamic> json) =
      _$WordTreeImpl.fromJson;

  @override
  String get userId;
  @override
  int get totalWords;
  @override
  DateTime get createdAt;
  @override
  List<TreeNode> get nodes;
  @override
  int get treeLevelUnlocked;
  @override
  DateTime? get lastUpdated;

  /// Create a copy of WordTree
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordTreeImplCopyWith<_$WordTreeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
