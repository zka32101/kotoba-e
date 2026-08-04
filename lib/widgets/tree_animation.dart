import 'package:flutter/material.dart';
import 'package:kotoba_e/models/tree_node.dart';

class TreeGrowthAnimation extends StatefulWidget {
  final TreeLevel level;
  final VoidCallback onComplete;

  const TreeGrowthAnimation({
    Key? key,
    required this.level,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<TreeGrowthAnimation> createState() => _TreeGrowthAnimationState();
}

class _TreeGrowthAnimationState extends State<TreeGrowthAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 800 + (widget.level.level * 200)),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward().then((_) {
      widget.onComplete();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: _buildLevelEmoji(widget.level),
      ),
    );
  }

  Widget _buildLevelEmoji(TreeLevel level) {
    final size = 120 + (level.level * 20).toDouble();
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Image.asset(
          treeLevelImagePath(level),
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// ツリーレベルごとの生成イラスト画像パス
String treeLevelImagePath(TreeLevel level) {
  const paths = {
    TreeLevel.seed: 'assets/images/tree/tree_seed.png',
    TreeLevel.sprout: 'assets/images/tree/tree_sprout.png',
    TreeLevel.leaf: 'assets/images/tree/tree_leaf.png',
    TreeLevel.flower: 'assets/images/tree/tree_flower.png',
    TreeLevel.fruit: 'assets/images/tree/tree_fruit.png',
    TreeLevel.full: 'assets/images/tree/tree_full.png',
  };
  return paths[level] ?? paths[TreeLevel.seed]!;
}

class TreeLevelUnlockDialog extends StatelessWidget {
  final TreeLevel newLevel;
  final int totalWords;

  const TreeLevelUnlockDialog({
    Key? key,
    required this.newLevel,
    required this.totalWords,
  }) : super(key: key);

  static Future<void> show(
    BuildContext context,
    TreeLevel newLevel,
    int totalWords,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => TreeLevelUnlockDialog(
        newLevel: newLevel,
        totalWords: totalWords,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const descriptions = {
      TreeLevel.seed: '小さな種が地に落ちました',
      TreeLevel.sprout: '芽吹きが始まりました',
      TreeLevel.leaf: '緑の葉が茂り始めます',
      TreeLevel.flower: '美しい花が咲きました',
      TreeLevel.fruit: '実がたくさんなりました',
      TreeLevel.full: 'ついに大樹に成長しました！',
    };

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                // アニメーション
                SizedBox(
                  height: 150,
                  child: TreeGrowthAnimation(
                    level: newLevel,
                    onComplete: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // レベル情報
                Text(
                  'ツリーが成長しました！',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                Text(
                  '${newLevel.name}（${newLevel.range}）',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                Text(
                  descriptions[newLevel] ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '合計 $totalWords 語を学習しました',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
