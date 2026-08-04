import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/config/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 20 : 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // ── アプリロゴ・マスコット ──
                Container(
                  width: isMobile ? 120 : 160,
                  height: isMobile ? 120 : 160,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryLight.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                    child: Image.asset(
                      'assets/images/brand/mascot.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // ── アプリ名 ──
                const Text(
                  'ことばえ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                    fontFamily: 'NotoSansJP',
                  ),
                ),
                const SizedBox(height: 8),

                // ── サブタイトル ──
                const Text(
                  'イラスト国語辞典',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'NotoSansJP',
                  ),
                ),
                const SizedBox(height: 32),

                // ── 説明文 ──
                const Text(
                  '小学1年～6年、そして海外の学習者まで。\n3,000語のイラスト辞書で、\n楽しく日本語が身につく。',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.textPrimary,
                    height: 1.6,
                    fontFamily: 'NotoSansJP',
                  ),
                ),
                const SizedBox(height: 24),

                // ── ヒーローイラスト ──
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                  child: Image.asset(
                    'assets/images/brand/welcome_hero.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 32),

                // ── 特徴アイコン行 ──
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _FeatureCard(
                      imagePath: 'assets/images/features/feature_srs.png',
                      label: 'SRS学習',
                      description: '忘却曲線で\n効率的に',
                    ),
                    _FeatureCard(
                      imagePath: 'assets/images/features/feature_gamify.png',
                      label: 'ゲーミフィ',
                      description: 'バッジ・\nストリーク',
                    ),
                    _FeatureCard(
                      imagePath: 'assets/images/features/feature_offline.png',
                      label: 'オフライン',
                      description: 'ネット不要\nで学習',
                    ),
                  ],
                ),
                const SizedBox(height: 48),

                // ── ボタングループ ──
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => context.go('/login'),
                        icon: const Icon(Icons.login),
                        label: const Text('ログイン'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                        ),
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton.icon(
                        onPressed: () => context.go('/signup'),
                        icon: const Icon(Icons.person_add),
                        label: const Text('新規登録'),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () => context.go('/home'),
                        child: const Text(
                          '✨ ゲストモードで試す',
                          style: TextStyle(color: AppTheme.secondary),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // ── フッター ──
                const Text(
                  '小学教育アプリシリーズ\nPetit Works Apps',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                    fontFamily: 'NotoSansJP',
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String? imagePath;
  final String fallbackEmoji;
  final String label;
  final String description;

  const _FeatureCard({
    this.imagePath,
    // ignore: unused_element_parameter
    this.fallbackEmoji = '✨',
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        imagePath != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                child: Image.asset(imagePath!, width: 40, height: 40, fit: BoxFit.cover),
              )
            : Text(fallbackEmoji, style: const TextStyle(fontSize: 40)),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
            fontFamily: 'NotoSansJP',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 11,
            color: AppTheme.textSecondary,
            height: 1.4,
            fontFamily: 'NotoSansJP',
          ),
        ),
      ],
    );
  }
}
