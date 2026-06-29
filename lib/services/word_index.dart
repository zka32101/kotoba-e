import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:kotoba_e/models/word_model.dart';

/// カテゴリグループの定義（word_groups.json から読み込む）
class WordGroup {
  final String id;
  final String label;
  final String emoji;
  final String color;
  final int order;

  const WordGroup({
    required this.id,
    required this.label,
    required this.emoji,
    required this.color,
    required this.order,
  });

  factory WordGroup.fromJson(Map<String, dynamic> j) => WordGroup(
        id: j['id'] as String,
        label: j['label'] as String,
        emoji: j['emoji'] as String,
        color: j['color'] as String,
        order: j['order'] as int? ?? 99,
      );
}

/// 単語検索インデックス
/// - カテゴリ自動分類
/// - 全文検索（wordName / furigana / 説明文）
/// - 漢字逆引き（ある漢字を含む単語一覧）
/// - 関連語（同カテゴリ）
class WordIndex {
  final Map<String, WordModel> _byId;
  final Map<String, String> _wordCategory;       // wordId → categoryId
  final Map<String, List<String>> _byCategory;   // categoryId → wordIds
  final Map<String, List<String>> _byKanji;      // 漢字1字 → wordIds
  final List<WordGroup> groups;

  WordIndex._({
    required Map<String, WordModel> byId,
    required Map<String, String> wordCategory,
    required Map<String, List<String>> byCategory,
    required Map<String, List<String>> byKanji,
    required this.groups,
  })  : _byId = byId,
        _wordCategory = wordCategory,
        _byCategory = byCategory,
        _byKanji = byKanji;

  // ── 構築 ────────────────────────────────────────────────

  static Future<WordIndex> build(List<WordModel> words) async {
    final groups = await _loadGroups();
    final byId = <String, WordModel>{for (final w in words) w.wordId: w};
    final wordCategory = <String, String>{};
    final byCategory = <String, List<String>>{};
    final byKanji = <String, List<String>>{};

    for (final w in words) {
      // カテゴリ分類
      final cat = _detectCategory(w);
      wordCategory[w.wordId] = cat;
      byCategory.putIfAbsent(cat, () => []).add(w.wordId);

      // 漢字インデックス
      for (final ch in w.wordName.runes) {
        final c = String.fromCharCode(ch);
        if (_isKanji(c)) {
          byKanji.putIfAbsent(c, () => []).add(w.wordId);
        }
      }
    }

    return WordIndex._(
      byId: byId,
      wordCategory: wordCategory,
      byCategory: byCategory,
      byKanji: byKanji,
      groups: groups,
    );
  }

  static Future<List<WordGroup>> _loadGroups() async {
    try {
      final raw = await rootBundle.loadString('assets/data/word_groups.json');
      final data = jsonDecode(raw) as Map<String, dynamic>;
      final list = (data['groups'] as List<dynamic>)
          .map((g) => WordGroup.fromJson(g as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => a.order.compareTo(b.order));
      return list;
    } catch (_) {
      return [];
    }
  }

  // ── カテゴリ自動分類ルール ───────────────────────────────
  // 優先度順（早い方が優先）

  static const _rules = <String, List<String>>{
    'math': [
      '三角形', '四角形', '正方形', '長方形', '五角形', '六角形', '台形', 'ひし形',
      '立方体', '円周率', '面積', '体積', '直径', '半径', '方程式', '素数', '倍数',
      '約数', '平均', '割合', 'パーセント', '棒グラフ', '折れ線', '円グラフ',
      'メートル', 'センチ', 'キログラム', 'リットル', '角度', '直角', '鋭角', '鈍角',
    ],
    'science': [
      '宇宙', '銀河', '星座', '惑星', '太陽系', '光年', '重力', '摩擦', '慣性',
      '電磁石', '磁石', '電流', '電圧', '抵抗', '回路', '原子', '分子', '元素',
      '化学反応', '燃焼', '蒸発', '凝固', '溶解', '結晶', '流れ星', '隕石',
      '日食', '月食', '積乱雲', '稲妻',
    ],
    'technology': [
      'コンピュータ', 'スマートフォン', 'パソコン', 'インターネット', 'Wi-Fi',
      'SNS', 'ゲーム機', 'テレビゲーム', 'GPS', 'ナビ', 'ドローン', 'ロボット',
      'AI', '人工知能', 'クラウド', 'セキュリティ', 'パスワード', '暗号化',
      'ダウンロード', 'アップロード', 'ストリーミング', 'サブスクリプション',
      'バックアップ', 'ウイルス', 'ハッキング', '衛星', '拡張現実', '仮想現実',
    ],
    'transport': [
      '電車', 'バス', 'タクシー', '自転車', '自動車', '自動車', 'ガソリン',
      '電気自動車', '横断歩道', '歩道', '信号機', '渋滞', '駐車場', '乗り換え',
      '終点', '始発', '終電', 'バス停', 'ホーム', '改札', '路線図', '時刻表',
      '遅延', '運休', 'シートベルト', 'ヘルメット', 'トンネル', '橋',
    ],
    'travel': [
      '旅行', '空港', '搭乗', 'ホテル', '旅館', '民宿', 'キャンプ',
      'パスポート', 'ビザ', '両替', '荷物', 'スーツケース', '登山', 'ハイキング',
      'トレッキング', 'バーベキュー', '焚き火', '野外',
    ],
    'environment': [
      'SDGs', 'リサイクル', 'リユース', 'リデュース', '温暖化', '再生可能',
      '太陽光発電', '風力発電', '節電', '節水', 'エコバッグ', '食品ロス',
      '有機農業', '環境問題', 'ゴミ', '分別', '可燃', '不燃',
    ],
    'job': [
      '消防士', '警察官', '弁護士', '裁判官', '検察官', '建築家', '大工',
      'シェフ', '栄養士', '調理師', '保育士', '介護士', '看護師', '薬剤師',
      '医師', '教師', '農家', '漁師', '林業',
    ],
    'society': [
      '選挙', '投票', '国会', '内閣', '首相', '大臣', '条約', '国際連合',
      '平和', '戦争', '紛争', '難民', '支援', '復興', '経済', '景気',
      '税金', '消費税', '年金', '保険', '社会保障', '福祉',
    ],
    'food': [
      '食べ', '朝食', '昼食', '夕食', '食事', '給食', '弁当', '定食',
      '料理', '調理', '調味', '醤油', 'みそ', '酢', '砂糖', '塩',
      '野菜', '大根', 'ほうれん草', 'キャベツ', 'たまねぎ', 'にんじん',
      '豆腐', '納豆', '天ぷら', '寿司', 'そば', 'うどん', 'ラーメン', 'パン',
      '飲み物', 'コーヒー', '紅茶', '緑茶', 'ジュース', 'お菓子', '果物',
      '食器', '皿', '箸', '鍋', 'フライパン', '包丁', '炊飯器',
    ],
    'home': [
      '家電', '掃除機', '洗濯機', '電子レンジ', '冷蔵庫',
      '玄関', '廊下', '和室', '屋根', '壁', '床', '庭', '植木',
      '水道', 'ガス', '電気料金',
    ],
    'body': [
      '肺', '心臓', '胃', '腸', '肝臓', '腎臓', '脳', '骨格', '筋肉',
      '血液', '体温', '発熱', '頭痛', '腹痛', 'アレルギー', '花粉症',
      '骨折', '捻挫', '包帯', '湿布', '注射', '手術', '入院', '退院',
      '診断', '薬局', '救急車', 'リハビリ', '予防接種',
    ],
    'sport': [
      'スポーツ', 'サッカー', '野球', 'テニス', 'バスケ', '水泳', '陸上',
      '体操', '柔道', '剣道', '空手', '相撲', '弓道', 'ゴール', 'スコア',
      '勝利', '敗北', '試合', '選手', 'コーチ', 'スタジアム', '体育館',
      'グラウンド', '縄跳び', '鬼ごっこ', 'かくれんぼ', 'ボール遊び',
      'トレーニング', 'オリンピック', '金メダル',
    ],
    'art': [
      '書道', '茶道', '華道', '武道', '折り紙', '工作', '絵具', '水彩',
      '油絵', '陶器', '漆器', '染め物', '織物', '刺繍', '民芸', '工芸',
      '文化遺産', '世界遺産', '伝統', '文化',
    ],
    'animal': [
      '蝶', '蛾', 'てんとう虫', 'かまきり', 'ゴキブリ', 'カブトムシ',
      'クワガタ', 'ホタル', 'トンボ', 'バッタ', 'コオロギ', 'セミ',
      'タコ', 'イカ', 'エビ', 'カニ', 'ウニ', 'ヒトデ', 'クラゲ',
      'サメ', 'クジラ', 'イルカ', 'アザラシ', 'ペンギン', 'フクロウ',
      'ワシ', 'タカ', 'ハト', 'スズメ', 'カラス', 'ツバメ', 'コウモリ',
      'リス', 'ハムスター', 'うさぎ', 'モルモット', '亀', 'トカゲ',
      'カエル', 'オタマジャクシ', 'ヤモリ', '金魚', 'メダカ', 'コイ',
      'サンマ', 'マグロ', 'サバ', 'アジ', 'サケ', 'ニジマス',
    ],
    'nature': [
      '桜', '梅', '菊', '朝顔', 'ひまわり', 'バラ', 'チューリップ',
      'タンポポ', 'クローバー', '苔', 'きのこ', '紅葉', '落ち葉', '新緑',
      '山頂', '山脈', '峠', '谷', '崖', '洞窟', '滝', '泉', '池', '沼', '湖',
      '渓谷', '清流', '源泉', '氷河', '砂浜', 'サンゴ', '磯', '干潟',
    ],
    'weather': [
      '霧', '露', '霜', '氷', '雷', '稲妻', '梅雨', '気温', '湿度', '気圧',
      '高気圧', '低気圧', '天気予報', '晴天', '曇天', '吹雪', 'なだれ',
      '熱波', '猛暑', '寒波', '厳冬',
    ],
    'emotion': [
      'かわいそう', 'もったいない', '素直', '頑固', 'わがまま', '素朴',
      '礼儀正しい', 'おおらか', '几帳面', '慎重', '大胆', '積極的', '消極的',
      '向上心', '好奇心', '情熱', '意欲', '夢中', '熱中', 'ストレス',
      '満足', '不満', '後悔', '挫折', '絆', '思いやり', '共感', '同情',
      '勇気', '誠実', '信念', '正義感', '尊敬', '憧れ',
    ],
    'school': [
      '算数', '国語', '理科', '社会', '体育', '図工', '音楽', '英語',
      '宿題', 'テスト', '教科書', '時間割', '授業', '先生', '生徒',
      '給食', '部活', '委員会', '文化祭', '運動会',
    ],
    'language': [
      '漢字', 'ひらがな', 'カタカナ', '文字', '言葉', '国語', '辞書',
      '文章', '作文', '日記', '手紙', '読書', '朗読', '物語', '絵本',
      '図鑑', '童話', '書く', '読む',
    ],
  };

  static String _detectCategory(WordModel w) {
    final name = w.wordName;
    final desc = w.descriptions.values.isNotEmpty
        ? w.descriptions.values.first
        : '';

    for (final entry in _rules.entries) {
      for (final kw in entry.value) {
        if (name.contains(kw) || desc.contains(kw)) {
          return entry.key;
        }
      }
    }
    return 'other';
  }

  // ── クエリ API ───────────────────────────────────────────

  WordModel? get(String wordId) => _byId[wordId];

  /// カテゴリ ID → WordGroup
  WordGroup? group(String categoryId) {
    try {
      return groups.firstWhere((g) => g.id == categoryId);
    } catch (_) {
      return null;
    }
  }

  /// wordId → カテゴリ ID
  String categoryOf(String wordId) => _wordCategory[wordId] ?? 'other';

  /// カテゴリ ID → その単語リスト（頻度順）
  List<WordModel> byCategory(String categoryId) {
    final ids = _byCategory[categoryId] ?? [];
    final result = ids.map((id) => _byId[id]).whereType<WordModel>().toList();
    result.sort((a, b) => b.frequency.compareTo(a.frequency));
    return result;
  }

  /// カテゴリ別の件数マップ
  Map<String, int> get categoryCounts =>
      {for (final e in _byCategory.entries) e.key: e.value.length};

  /// 関連語（同じカテゴリ、frequency 降順、最大 [limit] 件）
  List<WordModel> relatedTo(String wordId, {int limit = 8}) {
    final cat = categoryOf(wordId);
    return byCategory(cat)
        .where((w) => w.wordId != wordId)
        .take(limit)
        .toList();
  }

  /// 漢字逆引き：指定した漢字を含む単語リスト
  List<WordModel> byKanji(String kanji) {
    if (kanji.isEmpty || !_isKanji(kanji)) return [];
    final ids = _byKanji[kanji] ?? [];
    return ids.map((id) => _byId[id]).whereType<WordModel>().toList()
      ..sort((a, b) => b.frequency.compareTo(a.frequency));
  }

  /// 頻出漢字トップ N 件（[min] 件以上の単語に登場するもの）
  List<MapEntry<String, int>> topKanji({int topN = 30, int min = 3}) {
    final sorted = _byKanji.entries
        .where((e) => e.value.length >= min)
        .map((e) => MapEntry(e.key, e.value.length))
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sorted.take(topN).toList();
  }

  /// 全文検索（wordName / furigana / 全説明文）
  /// 関連度スコア順で返す
  List<WordModel> search(String query) {
    if (query.trim().isEmpty) return [];
    final q = query.trim();
    final scored = <_ScoredWord>[];

    for (final w in _byId.values) {
      final score = _score(w, q);
      if (score > 0) scored.add(_ScoredWord(w, score));
    }

    scored.sort((a, b) => b.score.compareTo(a.score));
    return scored.map((s) => s.word).toList();
  }

  int _score(WordModel w, String q) {
    int s = 0;
    if (w.wordName == q) s += 100;
    else if (w.wordName.startsWith(q)) s += 40;
    else if (w.wordName.contains(q)) s += 20;
    if (w.furigana == q) s += 90;
    else if (w.furigana.startsWith(q)) s += 35;
    else if (w.furigana.contains(q)) s += 15;
    if (s == 0) {
      for (final desc in w.descriptions.values) {
        if (desc.contains(q)) { s += 5; break; }
      }
    }
    if (s > 0) s += w.frequency ~/ 20;
    return s;
  }

  // ── ユーティリティ ──────────────────────────────────────

  static bool _isKanji(String ch) {
    final code = ch.runes.first;
    return code >= 0x4E00 && code <= 0x9FFF;
  }

  int get totalWords => _byId.length;
  List<String> get allCategoryIds => _byCategory.keys.toList()..sort();
}

class _ScoredWord {
  final WordModel word;
  final int score;
  const _ScoredWord(this.word, this.score);
}
