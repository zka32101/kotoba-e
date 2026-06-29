# Firebase セットアップガイド（ことばえ）

このガイドはユーザーが Firebase を設定するための手順です。**従量課金操作のため、ユーザーが実施してください。**

---

## 必要な環境

- Google アカウント
- Firebase CLI がインストール済み（なければ `npm install -g firebase-tools`）
- Flutter 環境が整っている

---

## ステップ 1: Firebase プロジェクト作成

1. [Firebase Console](https://console.firebase.google.com) にアクセス
2. 「プロジェクトを作成」をクリック
3. プロジェクト名：`kotoba-e`
4. Google Analytics：不要（オフ）
5. 「作成」をクリック

---

## ステップ 2: flutterfire configure を実行

ターミナルで以下を実行：

```bash
cd G:\マイドライブ\apps\kotoba-e

# flutterfire_cli がなければインストール
dart pub global activate flutterfire_cli

# Firebase プロジェクトと連携
flutterfire configure --project=kotoba-e
```

これにより：
- `lib/firebase_options.dart` が自動生成される
- `android/` と `ios/` が更新される

---

## ステップ 3: main.dart で Firebase を有効化

`lib/main.dart` を開き、以下を確認：

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Firebase 初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
```

---

## ステップ 4: Firestore セキュリティルール をデプロイ

ターミナルで以下を実行：

```bash
cd G:\マイドライブ\apps\kotoba-e\firebase

# Firebase プロジェクトにデプロイ
firebase deploy --only firestore:rules
```

> セキュリティルール（`firestore.rules`）が自動で適用されます

---

## ステップ 5: Cloud Functions をデプロイ

### 事前準備：

```bash
cd G:\マイドライブ\apps\kotoba-e\firebase\functions

# Node.js プロジェクトを初期化
npm init -y
npm install firebase-admin firebase-functions
```

### 関数をデプロイ：

```bash
firebase deploy --only functions
```

---

## ステップ 6: Firebase Authentication を有効化

1. [Firebase Console](https://console.firebase.google.com) → プロジェクト選択
2. 左ナビゲーション → 「Authentication」
3. 「Sign-in method」タブ
4. 以下を有効化：
   - **Email/Password** → クリック → 有効にする
   - **Google** → クリック → 有効にする（Web SDK キーは自動）

---

## ステップ 7: Firestore データベース を作成

1. 左ナビゲーション → 「Cloud Firestore」
2. 「データベースを作成」
3. セキュリティルール：**ステップ4で適用済み**
4. ロケーション：`asia-northeast1`（東京）
5. 「作成」

---

## ステップ 8: 初期データを投入（オプション）

Firebase Console から：

### words コレクション

ドキュメント ID: `word1`
```json
{
  "wordId": "word1",
  "wordName": "漢字",
  "furigana": "かんじ",
  "partsOfSpeech": "noun",
  "descriptions": {
    "grade1": "文字を表す字",
    "grade2": "...",
    "grade3": "..."
  },
  "nuanceExplanations": {
    "en": {
      "background": "Chinese characters...",
      "usage": "Used in modern Japanese...",
      "contrast": "vs Hiragana, Katakana..."
    }
  },
  "illustrationUrl": null,
  "illustrationPlaceholder": "#F5F5F5",
  "frequency": 100,
  "createdAt": "2026-06-20T00:00:00Z",
  "updatedAt": "2026-06-20T00:00:00Z"
}
```

### achievements コレクション

ドキュメント ID: `ach1`
```json
{
  "achievementId": "ach1",
  "achievementType": "quiz_10correct",
  "description": "10問正解",
  "icon": "✅"
}
```

---

## ステップ 9: アプリをテスト

```bash
flutter pub get
flutter run -d chrome
```

アプリが起動し、以下が動作することを確認：
- ユーザーログイン（Email/Password, Google）
- ブックマーク追加（Firestore に書き込み）
- クイズ実行（Cloud Functions で SRS 更新）

---

## トラブルシューティング

### "permission denied" エラー
→ Firestore セキュリティルールが正しくデプロイされているか確認

### Cloud Functions が動作しない
→ `firebase logs` でエラーを確認
```bash
firebase functions:log --follow
```

### Firebase が初期化されない
→ `lib/firebase_options.dart` が存在することを確認
→ `flutterfire configure` を再実行

---

## 料金見積もり

- **Firebase Auth**: 無料プラン（月50,000アクティブユーザーまで）
- **Firestore**: スパークプラン（無料、1GB/月）
- **Cloud Functions**: 無料プラン（月100万呼び出しまで）

> 無料プランで十分まかなえます

---

**完了後、アプリを firebase deploy などで本番環境にデプロイできます。**
