import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba_e/models/daily_word_model.dart';
import 'package:kotoba_e/providers/daily_word_provider.dart';
import 'package:kotoba_e/config/theme.dart';

class DailyWordScreen extends ConsumerWidget {
  const DailyWordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayWordAsync = ref.watch(todaysDailyWordProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('今日のことば'),
      ),
      body: todayWordAsync.when(
        data: (word) => word == null
            ? const Center(
                child: Text('本日のことばが見つかりません'),
              )
            : _buildContent(context, word),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(
          child: Text('エラー: ${err.toString()}'),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, DailyWord word) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ヘッダーカード
          _buildHeaderCard(context, word),
          const SizedBox(height: 24),

          // 説明セクション
          _buildDescriptionSection(context, word),
          const SizedBox(height: 24),

          // 季節コンテキスト
          _buildSeasonalContextCard(context, word),
          const SizedBox(height: 24),

          // 絵文字表示
          if (word.illustrations.isNotEmpty)
            _buildIllustrationsSection(context, word),
        ],
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context, DailyWord word) {
    const seasonColors = {
      '春': Color(0xFFFF69B4),
      '夏': Color(0xFFFFA500),
      '秋': Color(0xFFFF8C00),
      '冬': Color(0xFF87CEEB),
    };

    final seasonColor = seasonColors[word.season] ?? AppTheme.primary;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            seasonColor.withOpacity(0.85),
            seasonColor.withOpacity(0.5),
          ],
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        boxShadow: [
          BoxShadow(
            color: seasonColor.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 季節バッジ
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
            ),
            child: Text(
              word.season,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 単語名
          Text(
            word.wordName,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          // ふりがな
          Text(
            word.furigana,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 12),

          // 品詞
          Chip(
            label: Text(word.partsOfSpeech),
            backgroundColor: Colors.white.withOpacity(0.3),
            labelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(BuildContext context, DailyWord word) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '意味',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.primaryLight.withOpacity(0.25),
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          ),
          child: Text(
            word.description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  Widget _buildSeasonalContextCard(BuildContext context, DailyWord word) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.secondaryLight.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '季節の背景',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.secondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            word.seasonalContext,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildIllustrationsSection(BuildContext context, DailyWord word) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'イメージ',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          children: word.illustrations
              .map((emoji) => Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceAlt,
                      borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                    ),
                    child: Text(
                      emoji,
                      style: const TextStyle(fontSize: 40),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
