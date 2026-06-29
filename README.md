# ことばえ（kotoba-e）— イラスト国語辞典

**シンプルで楽しい日本語学習アプリ。** 小学1～6年生の児童から海外日本語学習者まで、すべての学習者向けの**イラスト国語辞典**です。

---

## 🎯 特徴

### 📚 3,000語の充実した辞書
- 学年別対応（小1～小6）
- わかりやすいイラスト付き説明
- 関連語・用例で深掘り学習
- 20カテゴリで楽しく探索

### 🧠 SRS（忘却曲線学習）
スペーシング・リピティション・システムによる**最適な復習スケジュール**：
- 難易度に応じた復習日の自動計算
- AI が最適な単語を選出
- 毎日5分で効率的に学習

### 🏆 ゲーミフィケーション
モチベーション維持のための仕組み：
- **連続学習ストリーク** — 毎日の学習を可視化
- **バッジシステム** — 達成感を実感
- **週間進捗グラフ** — 学習量を記録

### 🌍 多言語対応
- 日本語（デフォルト）
- 英語（解説・用例）

### 🔐 プライベート設計
- Firebase で安全に同期
- オフライン対応（キャッシュ済み単語）
- 子どもの学習履歴を保護

---

## 🚀 クイックスタート

### 必要な環境
- Flutter 3.0 以上
- Dart 3.0 以上
- Android SDK 21+ / iOS 11.0+

### インストール

```bash
git clone https://github.com/petitworks/kotoba-e.git
cd kotoba-e
flutter pub get
flutter pub run build_runner build
flutter run
```

### Firebase 設定

```bash
dart pub global activate flutterfire_cli
flutterfire configure --project=kotoba-e-XXXXX
firebase deploy --only firestore:rules,firestore:indexes
cd functions && npm install && npm run deploy
```

---

## 📖 ユーザーガイド

| 機能 | 説明 |
|---|---|
| **📝 単語検索** | 漢字・ひらがな・カテゴリで3,000語を検索 |
| **🎯 SRS学習** | 毎日5問のクイズで効率的に復習 |
| **❤️ お気に入り** | 学習中の単語をまとめて管理 |
| **📊 統計** | 週間・月間の学習進捗を可視化 |
| **🏆 バッジ** | 達成目標をクリアしてバッジゲット |

---

## 🏗 技術スタック

- **UI フレームワーク** — Flutter 3.x
- **状態管理** — Riverpod
- **ルーティング** — Go Router
- **データベース** — Firestore
- **認証** — Firebase Authentication
- **バックエンド** — Cloud Functions（TypeScript）

---

## 📚 単語データ

- **総数** — 3,000語（mock 152 + JSON 2,848）
- **学年対応** — 小1～小6
- **カテゴリ** — 20種（食べ物・動物・乗り物・テクノロジー等）
- **全文検索** — 単語名・ひらがな・説明文で検索可

---

## 🧪 テスト

```bash
flutter test
flutter test --coverage
```

---

## 📱 ビルド

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web
```

---

## 🔗 リンク

- [Petit Works 公式サイト](https://petitworks.jp)
- [設計書](G:\マイドライブ\design\ことばえ\kokugo-jiten-design-v1.1.md)
- [Flutter 公式](https://flutter.dev)

---

**バージョン：v1.0.0** | **開発：Petit Works Apps**
