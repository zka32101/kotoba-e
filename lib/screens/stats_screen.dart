import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/providers/quiz_provider.dart';
import 'package:kotoba_e/providers/bookmark_provider.dart';
import 'package:kotoba_e/providers/srs_provider.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizStats = ref.watch(quizStatsProvider);
    final bookmarks = ref.watch(bookmarksProvider);
    final dueCount = ref.watch(dueCountProvider);
    final weekDone = ref.watch(weekDoneProvider);
    final thisWeekCount = ref.watch(thisWeekCountProvider);

    final masteredCount = bookmarks.where((b) => b.status == 'mastered').length;
    final reviewingCount = bookmarks.where((b) => b.status == 'reviewing').length;

    final total = quizStats['quizTotal'] as int;
    final correct = quizStats['quizCorrect'] as int;
    final rate = quizStats['correctRate'] as double;

    return Scaffold(
      appBar: AppBar(title: const Text('学習統計'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 今週の進捗 ──
            _WeekProgress(weekDone: weekDone, count: thisWeekCount),
            const SizedBox(height: 20),

            // ── クイズ統計 ──
            const _SectionTitle(label: 'クイズ成績'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _StatCard(value: total, label: '合計問題', color: AppTheme.primary, icon: Icons.quiz)),
                const SizedBox(width: 12),
                Expanded(child: _StatCard(value: correct, label: '正解数', color: AppTheme.success, icon: Icons.check_circle)),
                const SizedBox(width: 12),
                Expanded(child: _StatCardPercent(value: rate, label: '正解率', color: AppTheme.secondary)),
              ],
            ),
            const SizedBox(height: 20),

            // ── 単語習得状況 ──
            const _SectionTitle(label: '単語習得状況'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _StatCard(value: bookmarks.length, label: 'お気に入り', color: Colors.pink, icon: Icons.favorite)),
                const SizedBox(width: 12),
                Expanded(child: _StatCard(value: masteredCount, label: '習得済み', color: AppTheme.success, icon: Icons.emoji_events)),
                const SizedBox(width: 12),
                Expanded(child: _StatCard(value: dueCount, label: '今日の復習', color: AppTheme.secondary, icon: Icons.schedule)),
              ],
            ),
            const SizedBox(height: 20),

            // ── ステータス別内訳 ──
            const _SectionTitle(label: 'ステータス内訳'),
            const SizedBox(height: 12),
            if (bookmarks.isEmpty)
              const Text('まだ単語が登録されていません。単語をお気に入りに追加しましょう！', style: AppTheme.bodySmall)
            else ...[
              _ProgressBar(label: '習得済み', count: masteredCount, total: bookmarks.length, color: AppTheme.success),
              const SizedBox(height: 8),
              _ProgressBar(label: '学習中', count: reviewingCount, total: bookmarks.length, color: AppTheme.primary),
              const SizedBox(height: 8),
              _ProgressBar(
                label: '未着手',
                count: bookmarks.length - masteredCount - reviewingCount,
                total: bookmarks.length,
                color: AppTheme.textSecondary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _WeekProgress extends StatelessWidget {
  final List<bool> weekDone;
  final int count;

  const _WeekProgress({required this.weekDone, required this.count});

  @override
  Widget build(BuildContext context) {
    final days = ['月', '火', '水', '木', '金', '土', '日'];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('今週のクイズ', style: AppTheme.heading3),
              const Spacer(),
              Text('$count / 7日', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (i) {
              final done = weekDone[i];
              return Column(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: done ? AppTheme.primary : AppTheme.divider,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: done
                        ? const Icon(Icons.check, color: Colors.white, size: 18)
                        : Text(days[i], style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
                  ),
                  if (done) ...[
                    const SizedBox(height: 4),
                    Text(days[i], style: const TextStyle(fontSize: 11, color: AppTheme.primary, fontWeight: FontWeight.bold)),
                  ],
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String label;
  const _SectionTitle({required this.label});

  @override
  Widget build(BuildContext context) => Text(label, style: AppTheme.heading3);
}

class _StatCard extends StatelessWidget {
  final int value;
  final String label;
  final Color color;
  final IconData icon;

  const _StatCard({required this.value, required this.label, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 6),
          Text('$value', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
        ],
      ),
    );
  }
}

class _StatCardPercent extends StatelessWidget {
  final double value;
  final String label;
  final Color color;

  const _StatCardPercent({required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        children: [
          Icon(Icons.percent, color: color, size: 20),
          const SizedBox(height: 6),
          Text('${(value * 100).toStringAsFixed(0)}%', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final String label;
  final int count;
  final int total;
  final Color color;

  const _ProgressBar({required this.label, required this.count, required this.total, required this.color});

  @override
  Widget build(BuildContext context) {
    final frac = total > 0 ? count / total : 0.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTheme.bodySmall),
            Text('$count語 (${(frac * 100).toStringAsFixed(0)}%)', style: AppTheme.bodySmall),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: frac,
            backgroundColor: AppTheme.divider,
            valueColor: AlwaysStoppedAnimation(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
