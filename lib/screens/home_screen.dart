import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/providers/auth_provider.dart';
import 'package:kotoba_e/providers/quiz_provider.dart';
import 'package:kotoba_e/providers/srs_provider.dart';
import 'package:kotoba_e/providers/word_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final selectedLanguage = ref.watch(selectedLanguageProvider);
    final weekDone = ref.watch(weekDoneProvider);
    final dueCount = ref.watch(dueCountProvider);
    final todayDone = ref.watch(todayQuizCompletedProvider);
    final streak = ref.watch(quizCompletionDatesProvider).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ことばえ'),
        centerTitle: false,
        elevation: 0,
        actions: [
          // 設定ボタン
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.go('/home/settings'),
            tooltip: '設定',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── 1. ストリーク表示（強調）─────────────────
                _StreakShowcase(
                  streak: streak,
                  weekDone: weekDone.where((d) => d).length,
                  todayDone: todayDone,
                ),
                const SizedBox(height: 24),

                // ── 2. クイズバナー（大きく・呼び出し強調）──
                if (dueCount > 0 && !todayDone)
                  _QuizCTA(
                    dueCount: dueCount,
                    onTap: () => context.go('/home/quiz'),
                  ),

                if (dueCount > 0 && !todayDone) const SizedBox(height: 20),

                // ── 3. 言語タブ ──────────────────────────
                _LanguageToggle(
                  selectedLanguage: selectedLanguage,
                  ref: ref,
                ),
                const SizedBox(height: 20),

                // ── 4. 検索ボックス + ランダムガチャ ──────
                Row(
                  children: [
                    Expanded(
                      child: _SearchBox(
                        onTap: () => context.go('/home/search'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _RandomWordButton(),
                  ],
                ),
                const SizedBox(height: 24),

                // ── 5. 機能グリッド ──────────────────────
                _FeatureGrid(context: context),
                const SizedBox(height: 24),

                // ── 6. ユーザー情報 ──────────────────────
                if (user != null) _UserCard(user: user),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// ストリーク表示（強調版）
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _StreakShowcase extends StatelessWidget {
  final int streak;
  final int weekDone;
  final bool todayDone;

  const _StreakShowcase({
    required this.streak,
    required this.weekDone,
    required this.todayDone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primary.withOpacity(0.1),
            AppTheme.primaryLight.withOpacity(0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        border: Border.all(color: AppTheme.primary.withOpacity(0.15)),
      ),
      child: Column(
        children: [
          // ストリーク数（大きく）
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '🔥',
                style: TextStyle(fontSize: 36),
              ),
              const SizedBox(width: 12),
              Text(
                '$streak日連続',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                  fontFamily: 'NotoSansJP',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 本日の状態
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: todayDone ? AppTheme.success : AppTheme.secondary,
              borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
            ),
            child: Text(
              todayDone ? '✅ 本日完了！' : '⏳ 本日のクイズに取り組む',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'NotoSansJP',
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 週間進捗
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '今週：',
                style: TextStyle(color: AppTheme.textSecondary, fontFamily: 'NotoSansJP'),
              ),
              ..._buildWeekProgressDots(weekDone),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildWeekProgressDots(int done) {
    return List.generate(7, (i) {
      final isCompleted = i < done;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: isCompleted ? AppTheme.success : AppTheme.divider,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '${i + 1}',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isCompleted ? Colors.white : AppTheme.textSecondary,
              ),
            ),
          ),
        ),
      );
    });
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// クイズ CTA（呼び出し強調）
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _QuizCTA extends StatelessWidget {
  final int dueCount;
  final VoidCallback onTap;

  const _QuizCTA({
    required this.dueCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: AppTheme.warmGradient,
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          boxShadow: [
            BoxShadow(
              color: AppTheme.secondary.withOpacity(0.3),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            const Text('🎯', style: TextStyle(fontSize: 32)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'クイズに挑戦',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'NotoSansJP',
                    ),
                  ),
                  Text(
                    '$dueCount問の復習待ちです',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                      fontFamily: 'NotoSansJP',
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 言語タブ
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _LanguageToggle extends StatelessWidget {
  final String selectedLanguage;
  final WidgetRef ref;

  const _LanguageToggle({
    required this.selectedLanguage,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '説明言語',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textSecondary,
            fontFamily: 'NotoSansJP',
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _LanguageButton(
              label: '日本語',
              isSelected: selectedLanguage == 'ja',
              onTap: () {
                ref
                    .read(currentUserProvider.notifier)
                    .updateProfile(selectedLanguage: 'ja');
              },
            ),
            const SizedBox(width: 8),
            _LanguageButton(
              label: 'English',
              isSelected: selectedLanguage == 'en',
              onTap: () {
                ref
                    .read(currentUserProvider.notifier)
                    .updateProfile(selectedLanguage: 'en');
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppTheme.primary : AppTheme.divider,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppTheme.textSecondary,
            fontFamily: 'NotoSansJP',
          ),
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 検索ボックス
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _SearchBox extends StatelessWidget {
  final VoidCallback onTap;

  const _SearchBox({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          boxShadow: AppTheme.softShadow,
        ),
        child: Row(
          children: const [
            Icon(Icons.search, color: AppTheme.textSecondary),
            SizedBox(width: 8),
            Text(
              '単語を検索...',
              style: TextStyle(color: AppTheme.textSecondary, fontFamily: 'NotoSansJP'),
            ),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// ランダム単語ガチャボタン
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _RandomWordButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        final words = await ref.read(allWordsProvider.future);
        if (words.isEmpty) return;
        // タイムスタンプベースでランダム選択
        final idx = DateTime.now().microsecondsSinceEpoch % words.length;
        final word = words[idx];
        if (context.mounted) {
          context.go('/home/word/${word.wordId}');
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          gradient: AppTheme.growthGradient,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          boxShadow: [
            BoxShadow(
              color: AppTheme.accent.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Center(
          child: Text('🎲', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 機能グリッド（4個）
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _FeatureGrid extends StatelessWidget {
  final BuildContext context;

  const _FeatureGrid({required this.context});

  @override
  Widget build(BuildContext context) {
    final features = [
      ('📚', '単語一覧', '3,000語から探索', '/home/search'),
      ('📖', 'ことば図鑑', '集めて記録', '/home/collection'),
      ('❤️', 'マイ単語', 'お気に入りを管理', '/home/favorites'),
      ('📊', '統計', '学習進捗を確認', '/home/stats'),
    ];

    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: features
          .map(
            (f) => _FeatureCard(
              emoji: f.$1,
              title: f.$2,
              subtitle: f.$3,
              onTap: () => this.context.go(f.$4),
            ),
          )
          .toList(),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          boxShadow: AppTheme.softShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 36)),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                  fontFamily: 'NotoSansJP',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppTheme.textSecondary,
                  fontFamily: 'NotoSansJP',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// ユーザー情報カード
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _UserCard extends StatelessWidget {
  final dynamic user;

  const _UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceAlt,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppTheme.primary.withOpacity(0.15),
            child: Text(
              (user.displayName ?? user.email).substring(0, 1).toUpperCase(),
              style: const TextStyle(
                color: AppTheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.displayName ?? user.email,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                    fontFamily: 'NotoSansJP',
                  ),
                ),
                Text(
                  '${user.gradeLevel}年生 / ${user.userType == "domestic" ? "国内" : "グローバル"}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                    fontFamily: 'NotoSansJP',
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
