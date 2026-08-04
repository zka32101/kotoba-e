import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba_e/models/word_model.dart';
import 'package:kotoba_e/providers/word_provider.dart';
import 'package:kotoba_e/config/theme.dart';

class TreeDetailScreen extends ConsumerWidget {
  final String wordId;

  const TreeDetailScreen({
    Key? key,
    required this.wordId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordAsync = ref.watch(wordByIdProvider(wordId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('単語詳細'),
        centerTitle: true,
        backgroundColor: AppTheme.primary.withOpacity(0.9),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: wordAsync.when(
        data: (word) => word == null
            ? const Center(child: Text('単語が見つかりません'))
            : _buildContent(context, word),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(
          child: Text('エラー: ${err.toString()}'),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WordModel word) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ヘッダー
          _buildHeader(context, word),
          const SizedBox(height: 24),

          // 基本情報
          _buildBasicInfo(context, word),
          const SizedBox(height: 24),

          // 説明
          _buildDescriptions(context, word),
          const SizedBox(height: 24),

          // ニュアンス比較
          if (word.nuanceExplanations.isNotEmpty)
            _buildNuanceExplanations(context, word),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WordModel word) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primary.withOpacity(0.1),
            AppTheme.secondary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            word.wordName,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            word.furigana,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Chip(
            label: Text(word.partsOfSpeech),
            backgroundColor: AppTheme.accent.withOpacity(0.2),
            labelStyle: const TextStyle(
              color: AppTheme.accent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicInfo(BuildContext context, WordModel word) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '基本情報',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow('品詞', word.partsOfSpeech),
          const SizedBox(height: 8),
          _buildInfoRow('頻出度', '${word.frequency}'),
          const SizedBox(height: 8),
          _buildInfoRow(
            '作成日',
            '${word.createdAt.year}年${word.createdAt.month}月${word.createdAt.day}日',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptions(BuildContext context, WordModel word) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '説明',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        for (final grade in ['grade1', 'grade2', 'grade3', 'grade4', 'grade5', 'grade6'])
          if (word.descriptions.containsKey(grade) &&
              (word.descriptions[grade]?.isNotEmpty ?? false))
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${grade.replaceFirst('grade', '小学')}年',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      word.descriptions[grade] ?? '',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
      ],
    );
  }

  Widget _buildNuanceExplanations(BuildContext context, WordModel word) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ニュアンス解説',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        for (final entry in word.nuanceExplanations.entries)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildNuanceCard(context, entry.key, entry.value),
          ),
      ],
    );
  }

  Widget _buildNuanceCard(
    BuildContext context,
    String language,
    NuanceExplanation explanation,
  ) {
    final langName = language == 'en' ? 'English' : language;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            langName,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.orange.shade700,
            ),
          ),
          const SizedBox(height: 8),
          _buildNuanceRow('背景', explanation.background),
          const SizedBox(height: 8),
          _buildNuanceRow('使い方', explanation.usage),
          const SizedBox(height: 8),
          _buildNuanceRow('他の単語との違い', explanation.contrast),
        ],
      ),
    );
  }

  Widget _buildNuanceRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
