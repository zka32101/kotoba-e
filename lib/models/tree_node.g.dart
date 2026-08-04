// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreeNodeImpl _$$TreeNodeImplFromJson(Map<String, dynamic> json) =>
    _$TreeNodeImpl(
      wordId: json['wordId'] as String,
      wordName: json['wordName'] as String,
      depth: (json['depth'] as num).toInt(),
      addedAt: DateTime.parse(json['addedAt'] as String),
      childWordIds: (json['childWordIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      connectedKanji: (json['connectedKanji'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TreeNodeImplToJson(_$TreeNodeImpl instance) =>
    <String, dynamic>{
      'wordId': instance.wordId,
      'wordName': instance.wordName,
      'depth': instance.depth,
      'addedAt': instance.addedAt.toIso8601String(),
      'childWordIds': instance.childWordIds,
      'connectedKanji': instance.connectedKanji,
    };

_$WordTreeImpl _$$WordTreeImplFromJson(Map<String, dynamic> json) =>
    _$WordTreeImpl(
      userId: json['userId'] as String,
      totalWords: (json['totalWords'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      nodes: (json['nodes'] as List<dynamic>?)
              ?.map((e) => TreeNode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      treeLevelUnlocked: (json['treeLevelUnlocked'] as num).toInt(),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$WordTreeImplToJson(_$WordTreeImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'totalWords': instance.totalWords,
      'createdAt': instance.createdAt.toIso8601String(),
      'nodes': instance.nodes,
      'treeLevelUnlocked': instance.treeLevelUnlocked,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };
