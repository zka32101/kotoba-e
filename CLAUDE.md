# 📚 ことばえ（kotoba-e）— Claude Code 実装ガイド

## プロジェクト概要

**アプリ名：** イラスト国語辞典「ことばえ」  
**対象：** 小学1～6年生（国内）+ 海外日本語学習者  
**目標：** v1.0 リリース（5～6ヶ月）  
**技術スタック：** Flutter 3.x / Firebase / Riverpod / Go Router

---

## 📐 アーキテクチャ & フォルダ構成

```
kotoba-e/
├── lib/
│   ├── main.dart              # アプリエントリーポイント
│   ├── config/
│   │   ├── constants.dart
│   │   ├── theme.dart         # Material Design テーマ
│   │   └── firebase_config.dart # Firebase設定（Sonnetで実装）
│   ├── models/                # Firestore モデル（freezed）
│   │   ├── user_model.dart
│   │   ├── word_model.dart
│   │   ├── quiz_model.dart
│   │   └── achievement_model.dart
│   ├── services/              # Firebase / API サービス層
│   │   ├── firebase_service.dart
│   │   ├── auth_service.dart
│   │   ├── firestore_service.dart
│   │   └── cloud_functions_service.dart
│   ├── providers/             # Riverpod プロバイダー
│   │   ├── auth_provider.dart
│   │   ├── user_provider.dart
│   │   ├── word_provider.dart
│   │   ├── quiz_provider.dart
│   │   └── achievement_provider.dart
│   ├── screens/               # UI 画面
│   │   ├── welcome_screen.dart
│   │   ├── login_screen.dart
│   │   ├── home_screen.dart
│   │   ├── search_screen.dart
│   │   ├── word_detail_screen.dart
│   │   ├── quiz_screen.dart
│   │   ├── favorites_screen.dart
│   │   └── settings_screen.dart
│   ├── widgets/               # 共有 UI コンポーネント
│   │   ├── custom_app_bar.dart
│   │   ├── bottom_nav_bar.dart
│   │   ├── word_card.dart
│   │   ├── quiz_card.dart
│   │   ├── streak_display.dart
│   │   └── badge_display.dart
│   ├── utils/
│   │   ├── validators.dart
│   │   ├── extensions.dart
│   │   └── app_router.dart    # Go Router 定義
│   └── l10n/                  # 国際化（多言語対応）
│       ├── app_ja.arb
│       └── app_en.arb
├── test/                      # ユニットテスト & ウィジェットテスト
├── pubspec.yaml              # パッケージ定義
├── analysis_options.yaml      # Lint ルール
└── CLAUDE.md                 # このファイル
```

---

## 🛠 開発フロー

### Haiku（この段階）でやること
1. **UI レイアウト**（Figma デザインをコード化）
2. **ナビゲーション設定**（Go Router）
3. **Riverpod 基本構造**（プロバイダー定義）
4. **ダミーデータ表示**（Firebase 連携前のモック）
5. **ローカルストレージ**（SharedPreferences で簡易保存）

### Sonnet に任せること（後で依頼）
1. **Firebase 統合**（Authentication, Firestore, Cloud Storage）
2. **Cloud Functions API**（SRS クイズ出題、バッジ判定等）
3. **セキュリティルール設定**
4. **RevenueCat 統合**（課金管理）
5. **プッシュ通知実装**（FCM）

---

## 🎯 実装フェーズ（Week by Week）

### Phase 1: 基盤構築（2週間）
**Week 1:**
- [ ] Firebase プロジェクト初期設定（Sonnet 依頼）
- [ ] UI テーマ設定
- [ ] ウェルカム画面 UI
- [ ] ログイン画面 UI（ダミー）

**Week 2:**
- [ ] Riverpod プロバイダー基本構造
- [ ] ローカルストレージ（SharedPreferences）
- [ ] ナビゲーション実装（Go Router）

### Phase 2: コア機能（4週間）
**Week 3:**
- [ ] 単語検索画面 UI
- [ ] 単語詳細画面 UI（イラスト枠 + プレースホルダー）

**Week 4:**
- [ ] SRS（クイズ）画面 UI
- [ ] クイズ回答ロジック（ダミー）

**Week 5:**
- [ ] お気に入り画面 UI
- [ ] ストリーク表示実装

**Week 6:**
- [ ] バッジシステム UI
- [ ] 統計画面実装
- [ ] ホーム画面統合

### Phase 3: テスト・最適化（2週間）
**Week 7:**
- [ ] ユニットテスト（モデル、ロジック）
- [ ] ウィジェットテスト（UI）

**Week 8:**
- [ ] iOS/Android 実機テスト
- [ ] バグ修正・最適化

---

## 📦 主要パッケージと用途

| パッケージ | 用途 |
|----------|------|
| **firebase_core** | Firebase 初期化 |
| **cloud_firestore** | Firestore データベース |
| **firebase_auth** | 認証（Email/Password, Google） |
| **firebase_storage** | イラスト・アセット保存 |
| **riverpod, hooks_riverpod** | 状態管理 |
| **go_router** | ナビゲーション・ルーティング |
| **freezed** | データクラス生成（immutable） |
| **cached_network_image** | ネットワーク画像キャッシング |
| **lottie** | アニメーション（将来の「ことばの木」） |
| **intl** | 国際化（多言語） |

---

## 🔐 セキュリティ・ベストプラクティス

### 認証
- Firebase Auth で Email/Password と Google Sign-in を実装
- トークンは Secure Storage に保存
- ID トークンと Refresh トークンを分離

### Firestore セキュリティルール
```firestore
- users/{userId} → 自分のデータのみ読み書き可
- words/{wordId} → 未認証でも読み取り可（公開辞書）
- userSearchHistory/{docId} → userId = request.auth.uid で判定
- userBookmarks/{docId} → userId = request.auth.uid で判定
```

### API 呼び出し
- Cloud Functions は HTTPS Callable Functions を使用
- リクエストに認証トークンを自動付与

---

## 🌍 多言語対応（国際化）

Intl + ARB ファイルで実装：
- `lib/l10n/app_ja.arb` — 日本語
- `lib/l10n/app_en.arb` — 英語

**ホーム画面上部にタブを配置** → ユーザーが言語を切り替え可能

---

## 📊 データモデル（Firestore）

### users/{userId}
```dart
{
  email: "user@example.com",
  displayName: "名前",
  userType: "domestic" | "global",
  gradeLevel: 3,
  selectedLanguage: "ja" | "en",
  subscriptionStatus: "free" | "premium_monthly" | "premium_yearly",
  createdAt: Timestamp,
  updatedAt: Timestamp,
}
```

### words/{wordId}
```dart
{
  wordName: "漢字",
  furigana: "かんじ",
  partsOfSpeech: "noun",
  descriptions: {
    "grade1": "...",
    "grade2": "...",
    // ...
  },
  nuanceExplanations: {
    "en": {
      "background": "...",
      "usage": "...",
      "contrast": "...",
    }
  },
  illustrationUrl: "https://...", // nullable
  illustrationPlaceholder: "#F5F5F5",
  frequency: 100,
  createdAt: Timestamp,
  updatedAt: Timestamp,
}
```

### userSearchHistory/{userId_wordId}
```dart
{
  userId: "user123",
  wordId: "word456",
  wordName: "漢字",
  searchedAt: Timestamp,
  nextReviewDate: Timestamp,
  reviewCount: 2,
  difficulty: "normal",
  lastReviewedAt: Timestamp,
}
```

### userBookmarks/{userId_bookmarkId}
```dart
{
  userId: "user123",
  wordId: "word456",
  wordName: "漢字",
  bookmarkedAt: Timestamp,
  status: "new" | "reviewing" | "mastered",
}
```

---

## 🧪 テスト戦略

### ユニットテスト
- モデルの serialization/deserialization
- Riverpod プロバイダーのロジック
- ユーティリティ関数

### ウィジェットテスト
- 主要画面の UI レンダリング
- ユーザーインタラクション（タップ、スクロール等）

### 統合テスト
- ナビゲーションフロー
- Firebase 連携後の E2E テスト（Sonnet 段階）

**テストコマンド：**
```bash
flutter test              # 全テスト実行
flutter test test/screens/ # 画面テストのみ
```

---

## 🚀 実行・デバッグコマンド

```bash
# アプリ実行
flutter run

# デバッグモード（ホットリロード有効）
flutter run -v

# ビルド（Release）
flutter build apk    # Android
flutter build ios    # iOS

# 生成コード実行（freezed, json_serializable）
flutter pub run build_runner build

# Lint 実行
flutter analyze

# パッケージ更新チェック
flutter pub outdated
```

---

## 💾 Git ワークフロー

**ブランチ戦略：** feature/xxx から main へ
```bash
git checkout -b feature/word-search
# ... 実装 ...
git add .
git commit -m "feat: 単語検索画面を実装"
git push origin feature/word-search
```

**コミットメッセージ：** Conventional Commits
- `feat:` — 新機能
- `fix:` — バグ修正
- `refactor:` — リファクタリング
- `test:` — テスト追加
- `docs:` — ドキュメント

---

## 📝 デザインリファレンス

- **設計書：** `G:\マイドライブ\design\ことばえ\kokugo-jiten-design-v1.1.md`
- **企画書：** `G:\マイドライブ\design\ことばえ\kokugo-jiten-plan-v1.4.md`

### 画面構成（8画面）
1. **ウェルカム** — 初回起動時のみ
2. **ログイン/サインアップ** — Email または Google Sign-in
3. **ホーム** — ストリーク、言語タブ、クイックリンク
4. **検索** — 単語検索＋フィルター
5. **単語詳細** — イラスト＋説明＋ニュアンス比較
6. **SRS（クイズ）** — 4択問題＋復習日計算
7. **お気に入り** — ブックマーク一覧＋進捗
8. **設定** — プロフィール＋言語切り替え＋サブスク

### UI 配色
- **Primary Color：** #2196F3（青）
- **Secondary Color：** #FF9800（オレンジ）
- **Background：** #FAFAFA（明灰色）
- **Text Primary：** #212121
- **Text Secondary：** #757575

---

## 🔗 リソース・参考

- [Flutter 公式ドキュメント](https://flutter.dev)
- [Riverpod ガイド](https://riverpod.dev)
- [Go Router](https://pub.dev/packages/go_router)
- [Firebase Flutter](https://firebase.flutter.dev)
- [Firestore セキュリティルール](https://firebase.google.com/docs/firestore/security/start)

---

## ✨ 最新実装状況

### Phase 1-2 完了
- ✅ UI レイアウト（11画面）
- ✅ テーマ・カラースキーム（教育的で親しみやすい配色）
- ✅ ナビゲーション（Go Router、auth-aware）
- ✅ Riverpod 状態管理（全プロバイダー実装）
- ✅ 単語データ（3,000語、20カテゴリ）
- ✅ WordIndex サービス（検索・カテゴリ・漢字逆引き）
- ✅ Firebase 基盤（firestore_service, auth_service, cloud_functions）
- ✅ Firestore セキュリティルール
- ✅ Cloud Functions（TypeScript）

### UI/UX 改善 (2026-06-24)
- ✅ README.md（プロジェクト概要・クイックスタート）
- ✅ ストア申請用説明文（Google Play / App Store）
- ✅ テーマ全体リデザイン（カラー・フォント・ボタンスタイル）
- ✅ ウェルカム画面リデザイン（ロゴ・説明・ゲストモード）
- ✅ ログイン画面改善（エラー表示・ローディング）
- ✅ **操作性・わかりやすさ・メニュー構成改善**
  - ボトムナビゲーション：5項目 → 4項目（設定を AppBar に移動）
  - ホーム画面リデザイン：ストリーク表示強調、クイズ CTA 大型化
  - ラベル改善：「お気に入り」→「マイ単語」（より直感的）
  - 機能グリッド：4個の主要機能を大きく表示
  - ユーザーフロー最適化：ホーム → 検索 → クイズ → マイ単語

## ⚠️ 次の TODO

- [ ] Firebase 本番接続（flutterfire configure）
- [ ] NotoSansJP フォント asset 追加（pubspec.yaml） ← **優先度最高**
- [x] ~~RevenueCat 統合（課金管理）~~ ✅ **2026-08-14 完了**
- [ ] FCM プッシュ通知実装
- [ ] APK 再ビルド（firebase_options.dart 置き換え後）
- [ ] Google Play 申請
- [ ] AI イラスト生成パイプライン（別途検討）
- [ ] ニュアンス比較 DB（言語学者による手動定義が必要）

**詳細**: `docs/IMPROVEMENT_PLAN.md` 参照

---

## 📞 質問 / トラブルシューティング

- **Flutter 環境セットアップ：** `flutter doctor`
- **パッケージエラー：** `flutter pub get --clean` を実行
- **ビルドキャッシュ削除：** `flutter clean && flutter pub get`
- **Firebase 接続エラー：** Sonnet に詳細設定を依頼

---

**準備完了。実装開始できます。** 🚀
