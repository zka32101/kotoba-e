import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/providers/subscription_provider.dart';
import 'package:kotoba_e/providers/auth_provider.dart';

class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packagesAsync = ref.watch(availablePackagesProvider);
    final isPremium = ref.watch(isPremiumProvider);
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('プレミアム'),
        elevation: 0,
      ),
      body: packagesAsync.when(
        data: (packages) {
          if (packages.isEmpty) {
            return const Center(
              child: Text('パッケージを取得できませんでした'),
            );
          }

          // パッケージをID別にソート
          final monthly = packages.firstWhere(
            (p) => p.identifier.contains('monthly'),
            orElse: () => packages.first,
          );
          final yearly = packages.firstWhere(
            (p) => p.identifier.contains('yearly'),
            orElse: () => packages.last,
          );

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // ── ヘッダー ──
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 48,
                      color: AppTheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'プレミアムへようこそ',
                      style: AppTheme.heading2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '全機能を制限なく利用できます',
                      style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // ── 無料プランカード ──
              _PlanCard(
                title: '無料プラン',
                price: '¥0',
                description: '現在のプラン',
                features: const [
                  '単語検索',
                  '基本的なクイズ',
                  '学習履歴（7日分）',
                ],
                isSelected: !isPremium,
                isCurrentPlan: !isPremium,
                onTap: () {},
              ),
              const SizedBox(height: 16),

              // ── 月額プランカード ──
              _PlanCard(
                title: 'プレミアム（月額）',
                price: monthly.packageType == PackageType.monthly
                    ? (monthly.storeProduct.priceString)
                    : '¥550',
                description: '月単位で購読',
                features: const [
                  '無料プランの全機能',
                  '詳細なクイズ分析',
                  '完全な学習履歴',
                  '優先サポート',
                ],
                isSelected: isPremium && user?.subscriptionStatus == 'premium_monthly',
                isCurrentPlan: user?.subscriptionStatus == 'premium_monthly',
                onTap: () => _purchasePackage(context, ref, monthly),
              ),
              const SizedBox(height: 16),

              // ── 年額プランカード（割引強調） ──
              Stack(
                children: [
                  _PlanCard(
                    title: 'プレミアム（年額）',
                    price: yearly.packageType == PackageType.annual
                        ? (yearly.storeProduct.priceString)
                        : '¥5,500',
                    description: '年単位で購読',
                    features: const [
                      '無料プランの全機能',
                      '詳細なクイズ分析',
                      '完全な学習履歴',
                      '優先サポート',
                    ],
                    isSelected: isPremium && user?.subscriptionStatus == 'premium_yearly',
                    isCurrentPlan: user?.subscriptionStatus == 'premium_yearly',
                    onTap: () => _purchasePackage(context, ref, yearly),
                  ),
                  Positioned(
                    top: -12,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.success,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '17% OFF',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // ── 復元購入ボタン ──
              if (!isPremium)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: OutlinedButton(
                    onPressed: () => _restorePurchases(context, ref),
                    child: const Text('以前の購入を復元'),
                  ),
                ),

              const SizedBox(height: 24),

              // ── 利用規約等 ──
              Center(
                child: Text(
                  '自動更新される購読です。いつでも設定から\nキャンセルできます。',
                  style: AppTheme.bodySmall.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('エラーが発生しました: $err'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.refresh(availablePackagesProvider);
                },
                child: const Text('もう一度試す'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _purchasePackage(BuildContext context, WidgetRef ref, Package package) {
    try {
      unawaited(ref.read(purchasePackageProvider.notifier).purchasePackage(package));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('購入処理中...')),
      );
      // iOS/Android の購入画面が自動的に表示されます
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('購入エラー: $e')),
      );
    }
  }

  void _restorePurchases(BuildContext context, WidgetRef ref) {
    try {
      unawaited(ref.read(restorePurchasesProvider.notifier).restorePurchases());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('購入を復元中...')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('復元エラー: $e')),
      );
    }
  }
}

class _PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final List<String> features;
  final bool isSelected;
  final bool isCurrentPlan;
  final VoidCallback onTap;

  const _PlanCard({
    required this.title,
    required this.price,
    required this.description,
    required this.features,
    required this.isSelected,
    required this.isCurrentPlan,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isCurrentPlan ? null : onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary.withValues(alpha: 0.08) : Colors.white,
          border: Border.all(
            color: isSelected ? AppTheme.primary : AppTheme.divider,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── タイトルと価格 ──
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTheme.heading3),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
                Text(
                  price,
                  style: AppTheme.heading2.copyWith(
                    color: AppTheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ── 機能リスト ──
            ...features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 18,
                    color: AppTheme.success,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    feature,
                    style: AppTheme.bodySmall,
                  ),
                ],
              ),
            )),
            const SizedBox(height: 12),

            // ── ボタン ──
            if (isCurrentPlan)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  '現在のプラン',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            else
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onTap,
                  child: const Text('このプランにする'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
