import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:kotoba_e/models/user_model.dart';

class RevenueCatService {
  static const String _iosApiKey = 'appl_MYaGkIbVqVxkIAjCwFgjdHMZWqJ';
  static const String _androidApiKey = 'goog_BXVYVJfNmrZiLpWlYYLhHzVwKJJ';

  late CustomerInfo _customerInfo;
  late List<Package> _packages;

  // ── 初期化 ───────────────────────────────────
  Future<void> initialize({required String userId}) async {
    try {
      await Purchases.setLogLevel(LogLevel.debug);

      // API キー設定（プラットフォーム別）
      await Purchases.configure(
        PurchasesConfiguration(
          _iosApiKey,
          googlePlayApiKey: _androidApiKey,
        ),
      );

      // ユーザー ID 設定
      await Purchases.logIn(userId);

      // 初期顧客情報取得
      _customerInfo = await Purchases.getCustomerInfo();
    } catch (e) {
      print('RevenueCat初期化エラー: $e');
      rethrow;
    }
  }

  // ── ユーザー ID 設定 ───────────────────────────────────
  Future<void> setUserId(String userId) async {
    try {
      await Purchases.logIn(userId);
      _customerInfo = await Purchases.getCustomerInfo();
    } catch (e) {
      print('RevenueCat ユーザーID設定エラー: $e');
      rethrow;
    }
  }

  // ── ログアウト ───────────────────────────────────
  Future<void> logout() async {
    try {
      await Purchases.logOut();
    } catch (e) {
      print('RevenueCat ログアウトエラー: $e');
      rethrow;
    }
  }

  // ── 顧客情報取得 ───────────────────────────────────
  Future<CustomerInfo> getCustomerInfo() async {
    try {
      _customerInfo = await Purchases.getCustomerInfo();
      return _customerInfo;
    } catch (e) {
      print('RevenueCat 顧客情報取得エラー: $e');
      rethrow;
    }
  }

  // ── 利用可能なパッケージ取得 ───────────────────────────────────
  Future<List<Package>> getAvailablePackages() async {
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;
      if (current == null) {
        return [];
      }
      _packages = current.availablePackages;
      return _packages;
    } catch (e) {
      print('RevenueCat パッケージ取得エラー: $e');
      rethrow;
    }
  }

  // ── パッケージ購入 ───────────────────────────────────
  Future<CustomerInfo> purchasePackage(Package package) async {
    try {
      final customerInfo = await Purchases.purchasePackage(package);
      _customerInfo = customerInfo;
      return customerInfo;
    } catch (e) {
      print('RevenueCat 購入エラー: $e');
      rethrow;
    }
  }

  // ── サブスクリプション状態判定 ───────────────────────────────────
  bool get isPremium {
    final entitlements = _customerInfo.entitlements.all;
    return entitlements.containsKey('premium') &&
        entitlements['premium']!.isActive;
  }

  // ── アクティブなエンタイトルメント取得 ───────────────────────────────────
  EntitlementInfo? get activeEntitlement {
    final entitlements = _customerInfo.entitlements.all;
    final premium = entitlements['premium'];
    return (premium != null && premium.isActive) ? premium : null;
  }

  // ── 購読を解約 ───────────────────────────────────
  Future<void> cancelSubscription() async {
    try {
      if (Purchases.canMakePayments()) {
        // ネイティブ実装に委譲（iOS/Android）
        // 実装はプラットフォーム側で行う必要がある
        print('購読キャンセル: ネイティブ側で処理してください');
      }
    } catch (e) {
      print('RevenueCat キャンセルエラー: $e');
      rethrow;
    }
  }

  // ── ユーザーモデルへの変換 ───────────────────────────────────
  String getSubscriptionStatusFromCustomerInfo() {
    final entitlements = _customerInfo.entitlements.all;

    if (!entitlements.containsKey('premium')) {
      return 'free';
    }

    final premium = entitlements['premium']!;
    if (!premium.isActive) {
      return 'free';
    }

    // productIdentifier から月額/年額を判定（RevenueCat コンソール設定に応じる）
    // premium.productIdentifier が存在しない場合は、デフォルトで monthly と判定
    final productId = premium.productIdentifier ?? '';
    if (productId.contains('monthly')) {
      return 'premium_monthly';
    } else if (productId.contains('yearly') || productId.contains('annual')) {
      return 'premium_yearly';
    }

    return 'premium_monthly'; // デフォルト
  }

  DateTime? getSubscriptionExpiresAt() {
    final entitlements = _customerInfo.entitlements.all;
    if (!entitlements.containsKey('premium')) {
      return null;
    }

    final premium = entitlements['premium']!;
    final expiration = premium.expirationDate;
    return expiration;
  }

  // ── 顧客情報のストリーム（リアクティブ監視） ───────────────────────────────────
  Stream<CustomerInfo> get customerInfoStream {
    // Purchases.customerInfoUpdatedStream を使用して自動監視
    return Purchases.customerInfoUpdatedStream;
  }
}

// ── シングルトンインスタンス ───────────────────────────────────
final revenueCatService = RevenueCatService();
