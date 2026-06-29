import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/providers/auth_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final language = ref.watch(selectedLanguageProvider);
    final gradeLevel = ref.watch(gradeLevelProvider);
    final userType = ref.watch(userTypeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('設定'), elevation: 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── ユーザー情報 ──
          if (user != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.primary.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppTheme.primary,
                    child: Text(
                      (user.displayName ?? user.email).substring(0, 1).toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.displayName ?? 'ゲスト', style: AppTheme.heading3),
                        Text(user.email, style: AppTheme.bodySmall),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: user.subscriptionStatus == 'free' ? AppTheme.divider : AppTheme.success.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            user.subscriptionStatus == 'free' ? '無料プラン' : 'プレミアム',
                            style: TextStyle(
                              fontSize: 11,
                              color: user.subscriptionStatus == 'free' ? AppTheme.textSecondary : AppTheme.success,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 24),

          // ── 言語設定 ──
          _SectionTitle(label: '言語'),
          _SegmentRow(
            options: const [('日本語', 'ja'), ('English', 'en')],
            selected: language,
            onChanged: (v) => ref.read(currentUserProvider.notifier).updateProfile(selectedLanguage: v),
          ),
          const SizedBox(height: 20),

          // ── ユーザータイプ ──
          _SectionTitle(label: 'ユーザータイプ'),
          _SegmentRow(
            options: const [('国内向け', 'domestic'), ('グローバル', 'global')],
            selected: userType,
            onChanged: (v) => ref.read(currentUserProvider.notifier).updateProfile(userType: v),
          ),
          const SizedBox(height: 20),

          // ── 学年設定 ──
          _SectionTitle(label: '学年 / レベル'),
          Row(
            children: [
              Text('$gradeLevel年生', style: AppTheme.heading3.copyWith(color: AppTheme.primary)),
              Expanded(
                child: Slider(
                  value: gradeLevel.toDouble(),
                  min: 1,
                  max: 6,
                  divisions: 5,
                  label: '$gradeLevel年生',
                  onChanged: (v) => ref.read(currentUserProvider.notifier).updateProfile(gradeLevel: v.toInt()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // ── アカウント操作 ──
          _SectionTitle(label: 'アカウント'),
          const SizedBox(height: 8),
          _ActionTile(
            icon: Icons.logout,
            label: 'ログアウト',
            color: AppTheme.error,
            onTap: () async {
              await ref.read(currentUserProvider.notifier).logout();
              if (context.mounted) context.go('/welcome');
            },
          ),
          const SizedBox(height: 8),
          _ActionTile(
            icon: Icons.info_outline,
            label: 'バージョン 1.0.0',
            color: AppTheme.textSecondary,
            onTap: () {},
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(label, style: AppTheme.heading3),
    );
  }
}

class _SegmentRow extends StatelessWidget {
  final List<(String, String)> options;
  final String selected;
  final ValueChanged<String> onChanged;

  const _SegmentRow({required this.options, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: options.map((opt) {
        final active = opt.$2 == selected;
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(opt.$2),
            child: Container(
              margin: EdgeInsets.only(right: opt == options.last ? 0 : 8),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: active ? AppTheme.primary : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: active ? AppTheme.primary : AppTheme.divider),
              ),
              alignment: Alignment.center,
              child: Text(opt.$1, style: TextStyle(color: active ? Colors.white : AppTheme.textPrimary, fontWeight: FontWeight.w600)),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionTile({required this.icon, required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.divider),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 12),
            Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
            const Spacer(),
            const Icon(Icons.chevron_right, color: AppTheme.textSecondary, size: 18),
          ],
        ),
      ),
    );
  }
}
