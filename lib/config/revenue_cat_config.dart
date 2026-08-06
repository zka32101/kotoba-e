/// RevenueCat 設定情報
/// 本番環境では環境変数またはセキュアストレージから読み込むことを推奨
class RevenueCatConfig {
  // iOS App Store API キー
  static const String iosApiKey = 'appl_MYaGkIbVqVxkIAjCwFgjdHMZWqJ';

  // Google Play API キー
  static const String androidApiKey = 'goog_BXVYVJfNmrZiLpWlYYLhHzVwKJJ';

  // エンタイトルメント ID（RevenueCat コンソールで定義）
  static const String premiumEntitlementId = 'premium';

  // パッケージ ID（RevenueCat コンソールで定義）
  static const String monthlyPackageId = 'kotoba_e_premium_monthly';
  static const String yearlyPackageId = 'kotoba_e_premium_yearly';

  // 価格情報（表示用、実際は RevenueCat から取得）
  static const String monthlyPrice = '¥550';
  static const String yearlyPrice = '¥5,500';

  // デバッグモード
  static const bool debugLogsEnabled = true;
}
