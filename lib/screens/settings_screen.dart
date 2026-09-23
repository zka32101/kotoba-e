import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/l10n/app_strings.dart';
import 'package:kotoba_e/providers/auth_provider.dart';
import 'package:kotoba_e/providers/daily_word_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final language = ref.watch(selectedLanguageProvider);
    final gradeLevel = ref.watch(gradeLevelProvider);
    final userType = ref.watch(userTypeProvider);
    final textDisplayMode = ref.watch(textDisplayModeProvider);
    final notificationsEnabled = ref.watch(notificationPermissionProvider);
    final t = ref.watch(appStringsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t('settings_title')), elevation: 0),
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
                        Text(user.displayName ?? t('settings_guest'), style: AppTheme.heading3),
                        Text(user.email, style: AppTheme.bodySmall),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: user.subscriptionStatus == 'free' ? AppTheme.divider : AppTheme.success.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            user.subscriptionStatus == 'free' ? t('settings_plan_free') : t('settings_plan_premium'),
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
          _SectionTitle(label: t('settings_section_language')),
          _SegmentRow(
            options: const [('日本語', 'ja'), ('English', 'en')],
            selected: language,
            onChanged: (v) => ref.read(currentUserProvider.notifier).updateProfile(selectedLanguage: v),
          ),
          const SizedBox(height: 20),

          // ── ユーザータイプ ──
          _SectionTitle(label: t('settings_section_user_type')),
          _SegmentRow(
            options: [
              (t('settings_user_type_domestic'), 'domestic'),
              (t('settings_user_type_global'), 'global'),
            ],
            selected: userType,
            onChanged: (v) => ref.read(currentUserProvider.notifier).updateProfile(userType: v),
          ),
          const SizedBox(height: 20),

          // ── 表示モード（グローバル向け）──
          if (userType == 'global') ...[
            _SectionTitle(label: t('settings_section_text_display')),
            _TextDisplayModeSelector(
              selected: textDisplayMode,
              onChanged: (v) => ref.read(currentUserProvider.notifier).updateProfile(textDisplayMode: v),
            ),
            const SizedBox(height: 20),
          ],

          // ── 学年設定 ──
          _SectionTitle(label: t('settings_section_grade')),
          Row(
            children: [
              Text('$gradeLevel${t('settings_grade_suffix')}', style: AppTheme.heading3.copyWith(color: AppTheme.primary)),
              Expanded(
                child: Slider(
                  value: gradeLevel.toDouble(),
                  min: 1,
                  max: 6,
                  divisions: 5,
                  label: '$gradeLevel${t('settings_grade_suffix')}',
                  onChanged: (v) => ref.read(currentUserProvider.notifier).updateProfile(gradeLevel: v.toInt()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // ── 通知設定 ──
          _SectionTitle(label: t('settings_section_notifications')),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.divider),
            ),
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(t('settings_daily_notification_toggle'), style: AppTheme.bodyMedium),
              value: notificationsEnabled,
              activeColor: AppTheme.primary,
              onChanged: (v) =>
                  ref.read(notificationPermissionProvider.notifier).setEnabled(v),
            ),
          ),
          const SizedBox(height: 24),

          // ── プレミアム ──
          _SectionTitle(label: t('settings_section_premium')),
          const SizedBox(height: 8),
          _ActionTile(
            icon: Icons.star,
            label: t('settings_manage_subscription'),
            color: AppTheme.primary,
            onTap: () => context.go('/home/paywall'),
          ),
          const SizedBox(height: 20),

          // ── アカウント操作 ──
          _SectionTitle(label: t('settings_section_account')),
          const SizedBox(height: 8),
          _ActionTile(
            icon: Icons.logout,
            label: t('settings_logout'),
            color: AppTheme.error,
            onTap: () async {
              await ref.read(currentUserProvider.notifier).logout();
              if (context.mounted) context.go('/welcome');
            },
          ),
          const SizedBox(height: 8),
          _ActionTile(
            icon: Icons.info_outline,
            label: t('settings_version'),
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

class _TextDisplayModeSelector extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const _TextDisplayModeSelector({
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TextDisplayModeOption(
          label: '日本語のみ',
          value: 'japanese_only',
          selected: selected == 'japanese_only',
          onTap: () => onChanged('japanese_only'),
        ),
        const SizedBox(height: 8),
        _TextDisplayModeOption(
          label: '日本語 + ふりがな',
          value: 'japanese_furigana',
          selected: selected == 'japanese_furigana',
          onTap: () => onChanged('japanese_furigana'),
        ),
        const SizedBox(height: 8),
        _TextDisplayModeOption(
          label: 'ふりがな + ローマ字',
          value: 'furigana_romaji',
          selected: selected == 'furigana_romaji',
          onTap: () => onChanged('furigana_romaji'),
        ),
        const SizedBox(height: 8),
        _TextDisplayModeOption(
          label: 'ローマ字のみ',
          value: 'romaji_only',
          selected: selected == 'romaji_only',
          onTap: () => onChanged('romaji_only'),
        ),
      ],
    );
  }
}

class _TextDisplayModeOption extends StatelessWidget {
  final String label;
  final String value;
  final bool selected;
  final VoidCallback onTap;

  const _TextDisplayModeOption({
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? AppTheme.primary.withValues(alpha: 0.1) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? AppTheme.primary : AppTheme.divider,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: selected ? AppTheme.primary : AppTheme.textSecondary),
                color: selected ? AppTheme.primary : Colors.transparent,
              ),
              child: selected
                  ? const Icon(Icons.check, size: 12, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  color: selected ? AppTheme.primary : AppTheme.textPrimary,
                  fontFamily: 'NotoSansJP',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
