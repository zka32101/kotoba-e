import 'package:purchases_flutter/purchases_flutter.dart';

/// RevenueCat サービス（簡易実装版）
/// 注：本番環境では適切な API キー設定と ネイティブ設定が必要です
class RevenueCatService {
  static const String _iosApiKey = 'appl_MYaGkIbVqVxkIAjCwFgjdHMZWqJ';
  static const String _androidApiKey = 'goog_BXVYVJfNmrZiLpWlYYLhHzVwKJJ';

  late CustomerInfo _customerInfo;
  late List<Package> _packages;
  bool _initialized = false;

  // ── 初期化 ───────────────────────────────────
  Future<void> initialize({required String userId}) async {
    if (_initialized) return;

    try {
      await Purchases.configure(
        PurchasesConfiguration(_iosApiKey),
      );
      _initialized = true;
      await setUserId(userId);
    } catch (e) {
      print('[RevenueCat] 初期化エラー: $e');
    }
  }

  // ── ユーザー ID 設定 ───────────────────────────────────
  Future<void> setUserId(String userId) async {
    try {
      await Purchases.logIn(userId);
      _customerInfo = await Purchases.getCustomerInfo();
    } catch (e) {
      print('[RevenueCat] ユーザーID設定エラー: $e');
    }
  }

  // ── ログアウト ───────────────────────────────────
  Future<void> logout() async {
    try {
      await Purchases.logOut();
    } catch (e) {
      print('[RevenueCat] ログアウトエラー: $e');
    }
  }

  // ── 顧客情報取得 ───────────────────────────────────
  Future<CustomerInfo> getCustomerInfo() async {
    try {
      _customerInfo = await Purchases.getCustomerInfo();
      return _customerInfo;
    } catch (e) {
      print('[RevenueCat] 顧客情報取得エラー: $e');
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
      print('[RevenueCat] パッケージ取得エラー: $e');
      return [];
    }
  }

  // ── パッケージ購入 ───────────────────────────────────
  Future<CustomerInfo> purchasePackage(Package package) async {
    try {
      final customerInfo = await Purchases.purchasePackage(package);
      _customerInfo = customerInfo;
      return customerInfo;
    } catch (e) {
      print('[RevenueCat] 購入エラー: $e');
      rethrow;
    }
  }

  // ── サブスクリプション状態判定 ───────────────────────────────────
  bool get isPremium {
    try {
      if (!_initialized) return false;
      final entitlements = _customerInfo.entitlements.all;
      final premium = entitlements['premium'];
      return premium != null && premium.isActive;
    } catch (_) {
      return false;
    }
  }

  // ── ユーザーモデルへの変換 ───────────────────────────────────
  String getSubscriptionStatusFromCustomerInfo() {
    try {
      if (!_initialized) return 'free';

      final entitlements = _customerInfo.entitlements.all;
      final premium = entitlements['premium'];

      if (premium == null || !premium.isActive) {
        return 'free';
      }

      final productId = premium.productIdentifier;
      if (productId != null && productId.contains('monthly')) {
        return 'premium_monthly';
      } else if (productId != null && (productId.contains('yearly') || productId.contains('annual'))) {
        return 'premium_yearly';
      }

      return 'premium_monthly';
    } catch (_) {
      return 'free';
    }
  }

  DateTime? getSubscriptionExpiresAt() {
    try {
      if (!_initialized) return null;

      final entitlements = _customerInfo.entitlements.all;
      final premium = entitlements['premium'];

      if (premium == null) return null;

      // expirationDate は String プロパティで ISO 8601 形式
      final expirationDateStr = premium.expirationDate;
      if (expirationDateStr == null) return null;

      return DateTime.tryParse(expirationDateStr);
    } catch (_) {
      return null;
    }
  }

  // ── 顧客情報のストリーム ───────────────────────────────────
  Stream<CustomerInfo> get customerInfoStream {
    try {
      // 現在の顧客情報をストリームで返す
      if (_initialized) {
        return Stream.value(_customerInfo);
      }
      return Stream.empty();
    } catch (_) {
      return Stream.empty();
    }
  }
}

// ── シングルトンインスタンス ───────────────────────────────────
final revenueCatService = RevenueCatService();
