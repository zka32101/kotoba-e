import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/providers/subscription_provider.dart';

/// プレミアム機能へのアクセスを促すモーダルダイアログ
/// 使用例:
/// ```dart
/// showPaywallModal(
///   context: context,
///   title: 'プレミアム機能',
///   message: 'クイズ履歴はプレミアム会員のみ利用できます',
/// );
/// ```
void showPaywallModal({
  required BuildContext context,
  required String title,
  required String message,
  String? featureDescription,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => _PaywallModal(
      title: title,
      message: message,
      featureDescription: featureDescription,
    ),
  );
}

class _PaywallModal extends ConsumerWidget {
  final String title;
  final String message;
  final String? featureDescription;

  const _PaywallModal({
    required this.title,
    required this.message,
    this.featureDescription,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packagesAsync = ref.watch(availablePackagesProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, controller) {
        return packagesAsync.when(
          data: (packages) {
            if (packages.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.error_outline, size: 48),
                    SizedBox(height: 16),
                    Text('パッケージを取得できませんでした'),
                  ],
                ),
              );
            }

            // 月額プランを取得
            final monthly = packages.firstWhere(
              (p) => p.identifier.contains('monthly'),
              orElse: () => packages.first,
            );

            // 年額プランを取得
            final yearly = packages.firstWhere(
              (p) => p.identifier.contains('yearly'),
              orElse: () => packages.last,
            );

            return SingleChildScrollView(
              controller: controller,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ── ドラッグハンドル ──
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppTheme.divider,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ── タイトルとメッセージ ──
                    Text(title, style: AppTheme.heading2),
                    const SizedBox(height: 8),
                    Text(
                      message,
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    if (featureDescription != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppTheme.primary.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Text(
                          featureDescription ?? '',
                          style: AppTheme.bodySmall.copyWith(
                            color: AppTheme.primary,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),

                    // ── プランオプション ──
                    Text(
                      'プランを選択',
                      style: AppTheme.heading3,
                    ),
                    const SizedBox(height: 12),

                    // 月額プラン
                    _MiniPlanOption(
                      title: 'プレミアム（月額）',
                      price: monthly.storeProduct.priceString ?? '¥550',
                      description: '毎月自動更新',
                      package: monthly,
                    ),
                    const SizedBox(height: 12),

                    // 年額プラン（割引表示）
                    Stack(
                      children: [
                        _MiniPlanOption(
                          title: 'プレミアム（年額）',
                          price: yearly.storeProduct.priceString ?? '¥5,500',
                          description: '毎年自動更新',
                          package: yearly,
                        ),
                        Positioned(
                          top: -8,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.success,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '17% OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // ── キャンセルボタン ──
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('今は結構です'),
                    ),
                    const SizedBox(height: 8),

                    // ── 利用規約 ──
                    Text(
                      '自動更新される購読です。設定からいつでもキャンセルできます。',
                      style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text('エラー: $err'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MiniPlanOption extends ConsumerWidget {
  final String title;
  final String price;
  final String description;
  final Package package;

  const _MiniPlanOption({
    required this.title,
    required this.price,
    required this.description,
    required this.package,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _purchasePackage(context, ref),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppTheme.divider),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTheme.heading3),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: AppTheme.bodySmall.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: AppTheme.heading3.copyWith(
                    color: AppTheme.primary,
                  ),
                ),
                const SizedBox(height: 2),
                const Icon(Icons.chevron_right, color: AppTheme.textSecondary),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _purchasePackage(BuildContext context, WidgetRef ref) async {
    try {
      ref.read(purchasePackageProvider.notifier).purchasePackage(package);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('購入処理中...')),
      );
      // 成功時は自動的にモーダルが閉じます（購入完了後）
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('購入エラー: $e')),
      );
    }
  }
}
