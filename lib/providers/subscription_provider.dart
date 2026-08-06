import 'package:riverpod/riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:kotoba_e/services/revenue_cat_service.dart';
import 'package:kotoba_e/providers/auth_provider.dart';

// ── RevenueCat Service Provider ───────────────────────────────────
final revenueCatServiceProvider = Provider((ref) => revenueCatService);

// ── Customer Info Stream Provider ───────────────────────────────────
final customerInfoStreamProvider =
    StreamProvider<CustomerInfo>((ref) {
  final service = ref.watch(revenueCatServiceProvider);
  return service.customerInfoStream;
});

// ── Available Packages Provider ───────────────────────────────────
final availablePackagesProvider =
    FutureProvider<List<Package>>((ref) async {
  final service = ref.watch(revenueCatServiceProvider);
  return service.getAvailablePackages();
});

// ── Is Premium Provider ───────────────────────────────────────
final isPremiumProvider = Provider<bool>((ref) {
  final customerInfo = ref.watch(customerInfoStreamProvider);

  return customerInfo.when(
    data: (info) {
      final entitlements = info.entitlements.all;
      return entitlements.containsKey('premium') &&
          entitlements['premium']!.isActive;
    },
    loading: () => false,
    error: (err, stack) => false,
  );
});

// ── Active Entitlement Provider ───────────────────────────────────
final activeEntitlementProvider =
    Provider<Entitlement?>((ref) {
  final customerInfo = ref.watch(customerInfoStreamProvider);

  return customerInfo.when(
    data: (info) {
      final entitlements = info.entitlements.all;
      final premium = entitlements['premium'];
      return premium != null && premium.isActive ? premium : null;
    },
    loading: () => null,
    error: (err, stack) => null,
  );
});

// ── Subscription Status Provider（UserModel 用） ───────────────────────────────────
final subscriptionStatusProvider = Provider<String>((ref) {
  final customerInfo = ref.watch(customerInfoStreamProvider);

  return customerInfo.when(
    data: (info) {
      final entitlements = info.entitlements.all;

      if (!entitlements.containsKey('premium')) {
        return 'free';
      }

      final premium = entitlements['premium']!;
      if (!premium.isActive) {
        return 'free';
      }

      // productIdentifier から月額/年額を判定
      final latest = premium.latestPurchaseInfo;
      if (latest != null) {
        if (latest.productIdentifier.contains('monthly')) {
          return 'premium_monthly';
        } else if (latest.productIdentifier.contains('yearly') ||
            latest.productIdentifier.contains('annual')) {
          return 'premium_yearly';
        }
      }

      return 'premium_monthly'; // デフォルト
    },
    loading: () => 'free',
    error: (err, stack) => 'free',
  );
});

// ── Subscription Expires At Provider ───────────────────────────────────
final subscriptionExpiresAtProvider =
    Provider<DateTime?>((ref) {
  final customerInfo = ref.watch(customerInfoStreamProvider);

  return customerInfo.when(
    data: (info) {
      final entitlements = info.entitlements.all;
      if (!entitlements.containsKey('premium')) {
        return null;
      }

      final premium = entitlements['premium']!;
      return premium.expirationDate;
    },
    loading: () => null,
    error: (err, stack) => null,
  );
});

// ── Purchase Package Notifier ───────────────────────────────────
class PurchasePackageNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    // 初期状態は何もしない
  }

  Future<void> purchasePackage(Package package) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final service = ref.read(revenueCatServiceProvider);
      await service.purchasePackage(package);
    });
  }
}

final purchasePackageProvider =
    AsyncNotifierProvider<PurchasePackageNotifier, void>(
  () => PurchasePackageNotifier(),
);

// ── Restore Purchases Notifier ───────────────────────────────────
class RestorePurchasesNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    // 初期状態は何もしない
  }

  Future<void> restorePurchases() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final service = ref.read(revenueCatServiceProvider);
      await service.getCustomerInfo();
    });
  }
}

final restorePurchasesProvider =
    AsyncNotifierProvider<RestorePurchasesNotifier, void>(
  () => RestorePurchasesNotifier(),
);

// ── RevenueCat Sync Provider（ユーザーログイン時に自動同期） ───────────────────────────────────
final revenueCatSyncProvider = FutureProvider<void>((ref) async {
  final user = ref.watch(currentUserProvider);

  if (user != null && user.userId != 'guest' && user.userId != 'anonymous') {
    // ユーザーがログインしている場合、RevenueCat に userId を設定
    final service = ref.watch(revenueCatServiceProvider);
    try {
      await service.setUserId(user.userId);

      // subscription 情報を取得して、ユーザーモデルを更新
      await ref.read(currentUserProvider.notifier).updateSubscriptionFromRevenueCat();
    } catch (e) {
      print('RevenueCat 同期エラー: $e');
    }
  }
});
