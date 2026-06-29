import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/models/word_model.dart';
import 'package:kotoba_e/providers/word_provider.dart';

/// コレクション図鑑画面
/// - 最近見た単語（履歴）
/// - カテゴリ別コレクション進捗（図鑑）
class CollectionScreen extends ConsumerWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentWords = ref.watch(recentWordsProvider);
    final progress = ref.watch(collectionProgressProvider);
    final totalSeen = ref.watch(totalSeenProvider);
    final totalWords = ref.watch(wordCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ことば図鑑'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 全体進捗 ───────────────────────────────
            totalWords.when(
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
              data: (total) => _OverallProgress(
                seen: totalSeen,
                total: total,
              ),
            ),
            const SizedBox(height: 24),

            // ── 最近見た単語 ───────────────────────────
            recentWords.when(
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
              data: (words) {
                if (words.isEmpty) return const SizedBox.shrink();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text('🕒', style: TextStyle(fontSize: 18)),
                        SizedBox(width: 8),
                        Text(
                          '最近見た言葉',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary,
                            fontFamily: 'NotoSansJP',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: words.take(15).length,
                        separatorBuilder: (_, __) => const SizedBox(width: 10),
                        itemBuilder: (_, i) => _RecentWordCard(
                          word: words[i],
                          onTap: () =>
                              context.go('/home/word/${words[i].wordId}'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              },
            ),

            // ── カテゴリ別図鑑 ──────────────────────────
            Row(
              children: const [
                Text('📖', style: TextStyle(fontSize: 18)),
                SizedBox(width: 8),
                Text(
                  'カテゴリ図鑑',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                    fontFamily: 'NotoSansJP',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'カテゴリの言葉を調べてコンプリートしよう！',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.textSecondary,
                fontFamily: 'NotoSansJP',
              ),
            ),
            const SizedBox(height: 12),
            progress.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('エラー: $e'),
              data: (entries) => Column(
                children: entries
                    .map(
                      (e) => _CategoryProgressCard(
                        entry: e,
                        onTap: () {
                          // カテゴリを選んで検索画面へ
                          ref.read(selectedCategoryProvider.notifier).state =
                              e.group.id;
                          ref.read(searchWordProvider.notifier).state = '';
                          context.go('/home/search');
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 全体進捗バナー
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _OverallProgress extends StatelessWidget {
  final int seen;
  final int total;

  const _OverallProgress({required this.seen, required this.total});

  @override
  Widget build(BuildContext context) {
    final pct = total == 0 ? 0.0 : seen / total;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primary.withOpacity(0.15),
            AppTheme.accent.withOpacity(0.15),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primary.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          const Text(
            '📚 集めたことば',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
              fontFamily: 'NotoSansJP',
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$seen',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                    fontFamily: 'NotoSansJP',
                  ),
                ),
                TextSpan(
                  text: ' / $total 語',
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppTheme.textSecondary,
                    fontFamily: 'NotoSansJP',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: pct,
              backgroundColor: AppTheme.divider,
              valueColor: const AlwaysStoppedAnimation(AppTheme.primary),
              minHeight: 12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '達成率 ${(pct * 100).toStringAsFixed(1)}%',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.primary,
              fontFamily: 'NotoSansJP',
            ),
          ),
        ],
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 最近見た単語カード
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _RecentWordCard extends StatelessWidget {
  final WordModel word;
  final VoidCallback onTap;

  const _RecentWordCard({required this.word, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _hexToColor(word.illustrationPlaceholder),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              word.wordName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
                fontFamily: 'NotoSansJP',
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              word.furigana,
              style: const TextStyle(
                fontSize: 10,
                color: AppTheme.textSecondary,
                fontFamily: 'NotoSansJP',
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Color _hexToColor(String hex) {
    final h = hex.replaceAll('#', '');
    return Color(int.parse('FF$h', radix: 16));
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// カテゴリ進捗カード
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _CategoryProgressCard extends StatelessWidget {
  final CollectionEntry entry;
  final VoidCallback onTap;

  const _CategoryProgressCard({
    required this.entry,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: entry.isComplete
                ? AppTheme.accent
                : AppTheme.divider,
            width: entry.isComplete ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Text(entry.group.emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        entry.group.label,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                          fontFamily: 'NotoSansJP',
                        ),
                      ),
                      if (entry.isComplete) ...[
                        const SizedBox(width: 6),
                        const Text('🏆', style: TextStyle(fontSize: 14)),
                      ],
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: entry.progress,
                      backgroundColor: AppTheme.divider,
                      valueColor: AlwaysStoppedAnimation(
                        entry.isComplete
                            ? AppTheme.accent
                            : AppTheme.primary,
                      ),
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${entry.seen}/${entry.total}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: entry.isComplete
                    ? AppTheme.accent
                    : AppTheme.textSecondary,
                fontFamily: 'NotoSansJP',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
