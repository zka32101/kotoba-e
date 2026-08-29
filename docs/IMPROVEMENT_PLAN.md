# 🎯 ことばえ 改善計画（2026-08-29）

**状況**: 開発は大きく完了（UI/UX、データ、Firebase、Riverpod、RevenueCat統合済み）  
**次フェーズ**: 見た目の磨き + 世界観の一貫性 + バグ調査

---

## 優先度別改善リスト

### 🔴 優先度1: 世界観・UI一貫性の強化（即座に対応可能）

#### 1.1 NotoSansJP フォント統合
**状況**: theme.dart では `fontFamily: 'NotoSansJP'` が指定されているが、実際のフォントアセットが未作成  
**影響**: 日本語の可読性が低い、教育アプリとしての信頼感が減少  
**対応**:
1. NotoSansJP TTF ファイルを入手（Google Fonts: https://fonts.google.com/noto/specimen/Noto+Sans+JP）
   - `NotoSansJP-Regular.ttf` (Regular weight 400)
   - `NotoSansJP-Bold.ttf` (Bold weight 700)
2. `assets/fonts/` ディレクトリを作成
3. フォントファイルを配置
4. `pubspec.yaml` の fonts セクションをアンコメント・確認：
   ```yaml
   fonts:
     - family: NotoSansJP
       fonts:
         - asset: assets/fonts/NotoSansJP-Regular.ttf
         - asset: assets/fonts/NotoSansJP-Bold.ttf
           weight: 700
   ```
5. `flutter pub get` → `flutter clean && flutter pub get`
6. 実機/エミュレータで日本語テキスト表示確認

**予想効果**: 
- 日本語テキストの可読性大幅向上
- 教育的で親しみやすい世界観が強化される
- ことばえ＝質の高い学習アプリとしての印象向上

---

#### 1.2 イラスト画像タイムスタンプ + キャッシュ戦略の検討
**状況**: 単語イラスト（2,848語）は未実装。IMAGE_HANDOVER.md で引き継ぎ済み  
**次アクション**: Windows環境で画像取得・Wikimedia Commons URL マッピングを開始

---

### 🟡 優先度2: バグ調査・デバッグ

#### 2.1 achievement_provider.dart の TODO
**ファイル**: `lib/providers/achievement_provider.dart`  
**問題**: Firestore 連携の TODO が3箇所（Fetch, Update 等）  
**確認事項**:
- バッジ・実績システムは現在モック実装のままか？
- ローカルストレージ / Firestore のどちらを使うべきか設計を確認

#### 2.2 オフライン時の動作検証
- キャッシュされた単語データの表示
- ローカルストレージ（SharedPreferences）フォールバック
- RevenueCat のサブスク状態確認時のエラーハンドリング

#### 2.3 国際化（i18n）状況確認
- `lib/l10n/app_ja.arb`, `app_en.arb` の整備状況
- ペイウォール画面の多言語対応（現在は日本語のみ）

---

### 🟢 優先度3: 機能拡張・将来対応

#### 3.1 FCM プッシュ通知
**状況**: 未実装  
**想定**: 
- ストリーク継続を促す（「今日のクイズに挑戦！」通知）
- 新着の「今日のことば」（DailyWordModel）の通知

#### 3.2 ニュアンス比較 DB（nuanceExplanations）
**状況**: 言語学者による手動定義が必要  
**現状**: 英語のみ基本実装（en: background, usage, contrast）  
**次**: 他言語拡張、より詳細な比較説明

#### 3.3 Firebase 本番接続
**状況**: firebase_options.dart 設定後に再ビルドが必要  
**APK ビルド後**: Google Play へのテスト配信開始

---

## UI/UX の一貫性チェックリスト

```
[ ] NotoSansJP フォント実装済み
[ ] ボタンのアクティブ状態・ホバー状態の視覚的フィードバック確認
[ ] ダークモード対応確認（theme.dart の dark variant があるか）
[ ] ストリーク表示・バッジ表示の世界観との整合性
[ ] ペイウォール画面のデザイン統一性
[ ] 設定画面でのサブスク情報表示確認
[ ] クイズ画面での達成感の演出（アニメーション等）
[ ] エラーメッセージの表示スタイル統一
```

---

## 世界観の強化ポイント

**ことばえの世界観**: 「小学生が楽しく日本語を学ぶ、親しみやすいイラスト辞典」

**一貫性を保つために**:
1. **日本語の美しさ**: NotoSansJP で読みやすく、質感を高める
2. **カラーパレット**: theme.dart の色（青・オレンジ・緑）を全画面で統一
3. **イラスト**: 2,848語の挿絵は「小学生向け、正確で親しみやすい」スタイルに統一
4. **ゲーミフィケーション**: ストリーク・バッジ・ツリーの演出で学習継続を促す
5. **ペイウォール**: プレミアム機能を自然に提示（強引でない）

---

## デバッグ・テスト計画

### CI/CD 状態
- 現在の CI: analyze-and-test + build-ios-unsigned（両方 PASSED）
- APK ビルド: Windows 環境で `flutter build apk --release` 実行予定

### テスト項目
1. **機能テスト**: 全画面の基本操作、クイズ回答、サブスク機能
2. **互換性テスト**: iOS（先行テスト済み）/ Android（APK後）
3. **パフォーマンステスト**: 単語検索の応答速度（2,848語）
4. **オフラインテスト**: キャッシュ・ローカルストレージ動作確認

---

## 実装優先順序（推奨）

1. **NotoSansJP フォント追加** ← 最初に実装（見た目の品質向上が大きい）
2. **UI一貫性チェック** → 問題箇所を修正
3. **achievement_provider TODO** → Firestore 接続の詳細設計
4. **APK ビルド** → 実機テスト
5. **FCM・ニュアンス DB** → 将来フェーズ

---

**ステータス**: 🟢 基盤完了、🟡 見た目・デバッグ段階  
**目標**: 2026年 9月中旬までに Google Play Beta テスト配信開始
