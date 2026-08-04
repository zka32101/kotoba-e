import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/models/tree_node.dart';
import 'package:kotoba_e/providers/tree_provider.dart';
import 'package:kotoba_e/widgets/tree_painter.dart';
import 'package:kotoba_e/widgets/tree_share_card.dart';
import 'package:kotoba_e/widgets/tree_animation.dart';
import 'package:kotoba_e/config/theme.dart';

class TreeScreen extends ConsumerStatefulWidget {
  const TreeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TreeScreen> createState() => _TreeScreenState();
}

class _TreeScreenState extends ConsumerState<TreeScreen> {
  int selectedNodeIndex = -1;

  @override
  Widget build(BuildContext context) {
    final treeAsync = ref.watch(userTreeProvider);
    final levelAsync = ref.watch(treeCurrentLevelProvider);
    final progressAsync = ref.watch(treeProgressProvider);
    final achievementAsync = ref.watch(treeUnlockAchievementProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ことばの木'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppTheme.primary.withOpacity(0.9),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ツリー進捗ヘッダー
              _buildProgressHeader(levelAsync, progressAsync, achievementAsync),
              const SizedBox(height: 24),

              // ツリー描画エリア
              treeAsync.when(
                data: (tree) => _buildTreeVisualization(tree),
                loading: () => const SizedBox(
                  height: 300,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (err, st) => SizedBox(
                  height: 300,
                  child: Center(
                    child: Text('エラー: ${err.toString()}'),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // アンロック情報
              achievementAsync.when(
                data: (achievement) =>
                    _buildAchievementCards(achievement),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 24),

              // シェアカード
              treeAsync.when(
                data: (tree) {
                  final wordsUntilNext = achievementAsync.maybeWhen(
                    data: (achievement) => achievement.wordsUntilNextLevel,
                    orElse: () => 0,
                  );
                  return TreeShareCard(
                    tree: tree,
                    level: TreeLevel.fromWordCount(tree.totalWords),
                    wordsUntilNext: wordsUntilNext,
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressHeader(
    AsyncValue<TreeLevel> levelAsync,
    AsyncValue<double> progressAsync,
    AsyncValue<TreeAchievement> achievementAsync,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppTheme.growthGradient,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        boxShadow: [
          BoxShadow(
            color: AppTheme.accent.withOpacity(0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 現在のレベル表示
          levelAsync.when(
            data: (level) => Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      treeLevelImagePath(level),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ツリーレベル：${level.name}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        level.range,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            loading: () => const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
            error: (_, __) => const Text(
              'レベル読み込みエラー',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),

          // 進捗バー
          progressAsync.when(
            data: (progress) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '次のレベルまで',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${(progress * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
              ],
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildTreeVisualization(WordTree tree) {
    if (tree.nodes.isEmpty) {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          color: AppTheme.surfaceAlt,
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🌱', style: TextStyle(fontSize: 48)),
              const SizedBox(height: 16),
              Text(
                '単語をまだ学習していません\n「検索」から単語を見てツリーを育てましょう',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.textSecondary,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final level = TreeLevel.fromWordCount(tree.totalWords);

    return Column(
      children: [
        // ツリー描画Canvas
        GestureDetector(
          onTapDown: (details) {
            setState(() {
              selectedNodeIndex =
                  _hitTestNodeAt(details.localPosition, tree, level);
            });
          },
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
              color: AppTheme.surface,
              boxShadow: AppTheme.cardShadow,
            ),
            clipBehavior: Clip.antiAlias,
            child: CustomPaint(
              painter: TreePainter(
                tree: tree,
                level: level,
                selectedWordIndex: selectedNodeIndex,
              ),
              size: Size.infinite,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // 選択ノード情報
        if (selectedNodeIndex >= 0 && selectedNodeIndex < tree.nodes.length)
          _buildNodeDetailCard(context, tree.nodes[selectedNodeIndex]),
      ],
    );
  }

  Widget _buildNodeDetailCard(BuildContext context, TreeNode node) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '選択中の単語',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            node.wordName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ツリーの深さ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      '${node.depth}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '関連漢字',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      node.connectedKanji.join(''),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '子ノード',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      '${node.childWordIds.length}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                context.go('/home/tree/${node.wordId}');
              },
              icon: const Icon(Icons.info_outline),
              label: const Text('詳細を見る'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCards(TreeAchievement achievement) {
    final levels = [
      ('種', achievement.seedUnlocked),
      ('芽', achievement.sproutUnlocked),
      ('葉', achievement.leafUnlocked),
      ('花', achievement.flowerUnlocked),
      ('実', achievement.fruitUnlocked),
      ('大樹', achievement.fullTreeUnlocked),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'アンロック進捗 (${achievement.unlockedCount}/6)',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: levels
              .map(
                (level) => Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: level.$2
                        ? AppTheme.accent.withOpacity(0.2)
                        : Colors.grey.shade200,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          level.$1,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: level.$2 ? AppTheme.accent : Colors.grey,
                          ),
                        ),
                        if (level.$2)
                          const Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Icon(
                              Icons.check,
                              size: 12,
                              color: AppTheme.accent,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        if (achievement.wordsUntilNextLevel > 0) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.amber),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'あと${achievement.wordsUntilNextLevel}語でツリーが成長します',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  /// タップ位置がツリーのどのノードか判定
  int _hitTestNodeAt(Offset position, WordTree tree, TreeLevel level) {
    // 簡易実装：最初のノードだけ判定（本実装では全ノードの円判定が必要）
    const radius = 25.0;
    const startY = 50.0;

    // ルートノードの判定
    final dx = position.dx - (MediaQuery.of(context).size.width / 2);
    final dy = position.dy - startY;

    if (dx * dx + dy * dy <= radius * radius) {
      return 0;
    }

    // 他のノードについては省略（実際には Canvas 座標計算で全ノードを判定）
    return -1;
  }
}
