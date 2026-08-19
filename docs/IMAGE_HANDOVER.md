# 🖼 単語イラスト画像 実装 引き継ぎメモ

作成日: 2026-08-18
目的: Windows 版 Claude Code で Wikipedia / Wikimedia Commons 等から単語イラスト画像を取得・組み込む作業のための引き継ぎ情報。

---

## 1. 現状（何が実装済みで、何が未実装か）

- ❌ **単語イラスト画像は1枚も存在しない。** 現状は色プレースホルダーのみで表示している。
- ✅ UI 側の受け皿（`Image.network` 表示ロジック）はすでに実装済み。画像 URL さえ入れば即座に表示される。
- ❌ 画像のアップロード先（Firebase Storage）は **未接続**。`pubspec.yaml` に `firebase_storage` パッケージすら入っていない。
- ❌ 画像取得・変換・アップロードの自動化スクリプトは存在しない（`tool/` フォルダには JSON 生成スクリプトが1つあるのみ）。

これは CLAUDE.md 側にも明記されている既知の未着手タスク：
> `AI イラスト生成パイプライン（別途検討）`

---

## 2. データ構造

### 2.1 単語マスタデータ: `assets/data/words.json`
- **2,848件** の単語データ（コンパクト形式、v1/v2互換）
- 例:
```json
{
  "wordId": "w153",
  "wordName": "頭",
  "furigana": "あたま",
  "partsOfSpeech": "noun",
  "desc1": "からだの一番上にある部分",
  "desc3": "考えたり感じたりする大切な部分",
  "color": "#FFE0B2",
  "freq": 95
}
```
- `wordId` が画像を紐づけるための一意キーになる（**画像ファイル名は wordId を使うことを推奨**：例 `w153.png` / `w153.webp`）
- `color` は現在イラストが無い間の背景プレースホルダー色（`WordModel.illustrationPlaceholder`）
- **注意**: `assets/data/words.json` のコンパクト形式には `illustrationUrl` フィールドが定義されていない。読み込みロジック（`lib/services/word_data_service.dart`）も現状パースしていない。画像対応する際はここに `"img": "w153"` や `"illustrationUrl": "https://..."` 相当のフィールドを追加し、`word_data_service.dart` の `_fromCompact()` にパース処理を追加する必要がある。

### 2.2 カテゴリ情報: `assets/data/word_groups.json`
- 20カテゴリ（`language`, `food`, `home`, `nature`, `weather`, `animal`, `body`, ... など）
- 各カテゴリに `id`, `label`（日本語名）, `emoji`, `color`, `order` あり
- 画像取得の優先順位付けに使える（例: `freq`（頻度）が高い単語から着手、カテゴリ単位で進める等）

### 2.3 モデル定義: `lib/models/word_model.dart`
```dart
@freezed
class WordModel with _$WordModel {
  const factory WordModel({
    required String wordId,
    required String wordName,
    ...
    String? illustrationUrl,               // ← ここに画像URLを入れる
    @Default('#F5F5F5') String illustrationPlaceholder,
    ...
  }) = _WordModel;
}
```

### 2.4 表示箇所: `lib/screens/word_detail_screen.dart`（422〜429行目付近）
```dart
final bg = _hexToColor(word.illustrationPlaceholder);
...
child: word.illustrationUrl != null
    ? Image.network(word.illustrationUrl!, fit: BoxFit.contain)
    : ...(プレースホルダー表示)
```
→ `illustrationUrl` がセットされていればそのまま `Image.network` で表示される。ローカルアセット方式にする場合はここを `Image.asset` に分岐させる改修が必要。

### 2.5 データ生成ツール: `tool/generate_words_json.dart`
- `dart run tool/generate_words_json.dart`
- `lib/data/mock_words.dart`（フル `WordModel` 定義のマスタ）→ `assets/data/words.json`（軽量配布用）へ変換するスクリプト
- `illustrationUrl` フィールドの出力にはすでに対応済み（22行目）。**つまり `mock_words.dart` 側に `illustrationUrl` を設定してこのスクリプトを再実行すれば `words.json` に反映される経路がある。**
  - ただし現状 `word_data_service.dart`（アプリが実際に読むランタイム側）はこのフィールドを見ていないので、そちらの追加対応も必要（2.1参照）。

---

## 3. 画像の格納方式（要意思決定）

まだ決まっていないので、Windows側の作業開始前に方針を決めること。選択肢：

### 案A: アプリに同梱（ローカルアセット）
- `assets/images/words/{wordId}.webp` 等に配置
- `pubspec.yaml` の `flutter: assets:` に追加
- メリット: オフラインで確実に表示、Firebase不要
- デメリット: 2,848語 × 画像 でアプリサイズが肥大化。全部埋めるなら数百MB〜GB級になる可能性が高い（要圧縮・webp化必須）

### 案B: Firebase Storage（CLAUDE.md記載の設計方針）
- `illustrationUrl: "https://..."` で配信
- `pubspec.yaml` に `firebase_storage` パッケージ追加が必要（現状未追加）
- メリット: アプリサイズ増加なし、後から差し替え可能
- デメリット: オフライン非対応（`cached_network_image` パッケージは既に依存関係にあるのでキャッシュは可能）、Firebase実装が別途必要（Sonnet依頼事項としてCLAUDE.mdに記載あり）

**現状のUI実装（`Image.network`）は案B前提。** 案Aにする場合はコード改修が要る。

---

## 4. ⚠️ 重要: ライセンス・著作権の注意

このアプリは **有料サブスクリプション（プレミアムプラン）を含む商用アプリ**。Wikipedia / Wikimedia から画像を取得する際は必ず以下を確認すること：

1. **必ず Wikimedia Commons（commons.wikimedia.org）から取得する。** 各言語版 Wikipedia 記事に貼られたサムネイルの中には「フェアユース」扱いの非フリー画像（ロゴ、書影、キャラクター画像等）が混在しており、それらは商用利用不可。Commons上のファイルはほぼ全て再利用可能なライセンス。
2. 各画像のファイルページで **ライセンス種別を個別確認**：
   - `CC0` / `Public Domain` → 表示義務なし、そのまま利用可
   - `CC-BY` / `CC-BY-SA` → **作者名・ライセンス・出典元の表示義務あり**。アプリ内 or 別ページに謝辞（クレジット）一覧を用意する必要がある
   - `CC-BY-SA` は **改変後も同一ライセンスでの再配布義務（継承）** があるため、イラストを加工・再配色する場合は特に注意
3. 取得した画像ごとに **出典・作者・ライセンス種別を記録**しておくこと（後で `docs/IMAGE_CREDITS.md` 等にまとめられるように、CSV等で管理推奨: `wordId, sourceUrl, author, license, retrievedAt`）
4. 小学生向け教育アプリという性質上、画像の内容が年齢に適切か（グロテスクでない、誤解を招かない）も確認すること

---

## 5. リポジトリ / Git 情報

- リポジトリ: `zka32101/kotoba-e`
- 現在の `main` ブランチは最新（RevenueCatマネタイズ実装 PR #1 マージ済み、コミット `b47ea76`）
- 画像作業は `main` から新しい feature ブランチを切って進める想定：
  ```bash
  git checkout main
  git pull origin main
  git checkout -b feature/word-illustrations
  ```
- コミットメッセージは Conventional Commits 形式（`feat:`, `fix:` 等）— CLAUDE.md 参照

---

## 6. 推奨される進め方（提案）

1. まず案A/案B（4章）のどちらにするか決定
2. 優先度の高い単語から着手（`freq` 降順、または特定カテゴリから）— 2,848語全部は非現実的なので、まず数十〜数百語のパイロットを推奨
3. Wikimedia Commons API（`https://commons.wikimedia.org/w/api.php`）で検索・取得するスクリプトを作成（Python or Dart）
4. 取得画像は `wordId` 単位でリネーム・リサイズ・webp変換
5. ライセンス台帳（CSV/Markdown）を必ず並行して作成
6. `words.json` フォーマット拡張 + `word_data_service.dart` のパース対応
7. `word_detail_screen.dart` 側の表示確認（案Aならコード改修も）

---

## 7. 関連ファイル一覧（参照用）

| ファイル | 役割 |
|---|---|
| `assets/data/words.json` | 単語マスタ（2,848件、画像なし） |
| `assets/data/word_groups.json` | 20カテゴリ定義 |
| `lib/data/mock_words.dart` | フル WordModel マスタ（generate_words_json.dart の入力） |
| `tool/generate_words_json.dart` | mock_words.dart → words.json 変換スクリプト |
| `lib/services/word_data_service.dart` | words.json → WordModel 読み込み（illustrationUrl 未パース） |
| `lib/models/word_model.dart` | WordModel 定義（illustrationUrl フィールドあり） |
| `lib/screens/word_detail_screen.dart` | イラスト表示箇所（422〜429行目） |
| `assets/images/` | ブランド/UI用画像（ことばの木、マスコット等）。単語イラストとは別物 |
| `pubspec.yaml` | `firebase_storage` 未追加、`assets/images/` は登録済み |

---

**この文書は Windows 側の Claude Code セッションに引き継ぐための一次資料。作業開始前に必ず 3章（格納方式）と 4章（ライセンス）の方針を確認・決定すること。**
