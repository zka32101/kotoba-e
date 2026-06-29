import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/providers/quiz_provider.dart';
import 'package:kotoba_e/providers/auth_provider.dart';
import 'package:kotoba_e/providers/srs_provider.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  bool _quizStarted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gradeLevel = ref.watch(gradeLevelProvider);
    final quizSession = ref.watch(quizSessionProvider);
    final dueCount = ref.watch(dueCountProvider);

    if (!_quizStarted) {
      return _QuizStartScreen(
        dueCount: dueCount,
        onStart: () {
          ref.read(quizSessionProvider.notifier).initializeQuiz(
            gradeLevel: gradeLevel,
          );
          setState(() => _quizStarted = true);
        },
      );
    }

    if (quizSession.questions.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (quizSession.isCompleted) {
      return _QuizResultScreen(
        correctCount: quizSession.correctCount,
        totalCount: quizSession.questions.length,
        correctRate: quizSession.correctRate,
        onRestart: () {
          ref.read(quizSessionProvider.notifier).reset();
          setState(() => _quizStarted = false);
        },
      );
    }

    return _QuizQuestionScreen(
      question: quizSession.currentQuestion!,
      questionIndex: quizSession.currentIndex,
      totalQuestions: quizSession.questions.length,
      onAnswered: (selectedIndex) {
        ref.read(quizSessionProvider.notifier).answerQuestion(selectedIndex);
      },
    );
  }
}

// ── クイズ開始画面 ────────────────────────────────────

class _QuizStartScreen extends StatelessWidget {
  final int dueCount;
  final VoidCallback onStart;

  const _QuizStartScreen({
    required this.dueCount,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('クイズ'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    '📚',
                    style: TextStyle(fontSize: 80),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    '日本語をマスターしよう',
                    style: AppTheme.heading2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '忘却曲線に基づいた復習で、\n単語を確実に身につけます',
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  // 統計
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppTheme.primary.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Column(
                      children: [
                        if (dueCount > 0) ...[
                          const Text(
                            '📅 今日の復習',
                            style: AppTheme.heading3,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$dueCount件の単語が復習対象です',
                            style: AppTheme.bodyMedium.copyWith(
                              color: AppTheme.secondary,
                            ),
                          ),
                        ] else
                          const Text(
                            '新しい単語から学ぼう！',
                            style: AppTheme.bodyMedium,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: onStart,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('クイズを開始'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── クイズ問題画面 ────────────────────────────────────

class _QuizQuestionScreen extends ConsumerWidget {
  final dynamic question;
  final int questionIndex;
  final int totalQuestions;
  final Function(int) onAnswered;

  const _QuizQuestionScreen({
    required this.question,
    required this.questionIndex,
    required this.totalQuestions,
    required this.onAnswered,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('クイズ'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 進捗バー
              LinearProgressIndicator(
                value: (questionIndex + 1) / totalQuestions,
                backgroundColor: AppTheme.divider,
                valueColor: const AlwaysStoppedAnimation(AppTheme.primary),
                minHeight: 6,
              ),
              const SizedBox(height: 24),
              // 問題番号
              Text(
                '問題 ${questionIndex + 1}/$totalQuestions',
                style: AppTheme.bodySmall.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              // 問題文
              Text(
                question.question,
                style: AppTheme.heading2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // 選択肢
              Expanded(
                child: ListView.builder(
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _OptionButton(
                        option: question.options[index],
                        index: index,
                        onTap: () => onAnswered(index),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String option;
  final int index;
  final VoidCallback onTap;

  const _OptionButton({
    required this.option,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final labels = ['A', 'B', 'C', 'D'];
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          border: Border.all(color: AppTheme.divider),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                labels[index],
                style: const TextStyle(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                option,
                style: AppTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── クイズ結果画面 ────────────────────────────────────

class _QuizResultScreen extends StatelessWidget {
  final int correctCount;
  final int totalCount;
  final double correctRate;
  final VoidCallback onRestart;

  const _QuizResultScreen({
    required this.correctCount,
    required this.totalCount,
    required this.correctRate,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final isGreat = correctRate >= 0.8;
    final isGood = correctRate >= 0.6;

    return Scaffold(
      appBar: AppBar(
        title: const Text('結果'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    isGreat
                        ? '🎉'
                        : isGood
                            ? '👏'
                            : '💪',
                    style: const TextStyle(fontSize: 80),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    isGreat
                        ? '素晴らしい！'
                        : isGood
                            ? 'いい調子！'
                            : '頑張ろう',
                    style: AppTheme.heading2,
                  ),
                  const SizedBox(height: 32),
                  // スコア表示
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _ScoreItem(
                        label: '正解',
                        value: '$correctCount',
                        unit: '問',
                        color: AppTheme.success,
                      ),
                      _ScoreItem(
                        label: '不正解',
                        value: '${totalCount - correctCount}',
                        unit: '問',
                        color: AppTheme.error,
                      ),
                      _ScoreItem(
                        label: '正解率',
                        value: '${(correctRate * 100).toStringAsFixed(0)}',
                        unit: '%',
                        color: AppTheme.primary,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: onRestart,
                      icon: const Icon(Icons.refresh),
                      label: const Text('もう一度やる'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('ホームに戻る'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreItem extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color color;

  const _ScoreItem({
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: AppTheme.bodySmall),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              TextSpan(
                text: unit,
                style: TextStyle(
                  fontSize: 14,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
