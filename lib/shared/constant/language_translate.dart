enum LanguageTranslate {
  nativeAd("NativeAd", "native"),
  auto("Automatic", "auto"),
  afrikaans("Afrikaans", "af"),
  albanian("Albanian", "sq"),
  amharic("Amharic", "am"),
  arabic("Arabic", "ar"),
  armenian("Armenian", "hy"),
  assamese("Assamese", "as"),
  aymara("Aymara", "ay"),
  azerbaijani("Azerbaijani", "az"),
  bambara("Bambara", "bm"),
  basque("Basque", "eu"),
  belarusian("Belarusian", "be"),
  bengali("Bengali", "bn"),
  bhojpuri("Bhojpuri", "bho"),
  bosnian("Bosnian", "bs"),
  bulgarian("Bulgarian", "bg"),
  catalan("Catalan", "ca"),
  cebuano("Cebuano", "ceb"),
  chineseSimplified("Chinese (Simplified)", "zh-cn"),
  chineseTraditional("Chinese (Traditional)", "zh-tw"),
  corsican("Corsican", "co"),
  croatian("Croatian", "hr"),
  czech("Czech", "cs"),
  danish("Danish", "da"),
  dhivehi("Dhivehi", "dv"),
  dogri("Dogri", "doi"),
  dutch("Dutch", "nl"),
  english("English", "en"),
  esperanto("Esperanto", "eo"),
  estonian("Estonian", "et"),
  ewe("Ewe", "ee"),
  filipino("Filipino (Tagalog)", "fil"),
  finnish("Finnish", "fi"),
  french("French", "fr"),
  frisian("Frisian", "fy"),
  galician("Galician", "gl"),
  georgian("Georgian", "ka"),
  german("German", "de"),
  greek("Greek", "el"),
  guarani("Guarani", "gn"),
  gujarati("Gujarati", "gu"),
  haitianCreole("Haitian Creole", "ht"),
  hausa("Hausa", "ha"),
  hawaiian("Hawaiian", "haw"),
  hebrew("Hebrew", "he"),
  hindi("Hindi", "hi"),
  hmong("Hmong", "hmn"),
  hungarian("Hungarian", "hu"),
  icelandic("Icelandic", "is"),
  igbo("Igbo", "ig"),
  ilocano("Ilocano", "ilo"),
  indonesian("Indonesian", "id"),
  irish("Irish", "ga"),
  italian("Italian", "it"),
  japanese("Japanese", "ja"),
  javanese("Javanese", "jv"),
  kannada("Kannada", "kn"),
  kazakh("Kazakh", "kk"),
  khmer("Khmer", "km"),
  kinyarwanda("Kinyarwanda", "rw"),
  konkani("Konkani", "gom"),
  korean("Korean", "ko"),
  krio("Krio", "kri"),
  kurdishKurmanji("Kurdish (Kurmanji)", "ku"),
  kurdishSorani("Kurdish (Sorani)", "ckb"),
  kyrgyz("Kyrgyz", "ky"),
  lao("Lao", "lo"),
  latin("Latin", "la"),
  latvian("Latvian", "lv"),
  lingala("Lingala", "ln"),
  lithuanian("Lithuanian", "lt"),
  luganda("Luganda", "lg"),
  luxembourgish("Luxembourgish", "lb"),
  macedonian("Macedonian", "mk"),
  maithili("Maithili", "mai"),
  malagasy("Malagasy", "mg"),
  malay("Malay", "ms"),
  malayalam("Malayalam", "ml"),
  maltese("Maltese", "mt"),
  maori("Maori", "mi"),
  marathi("Marathi", "mr"),
  meiteilon("Meiteilon (Manipuri)", "mni-mtei"),
  mizo("Mizo", "lus"),
  mongolian("Mongolian", "mn"),
  myanmarBurmese("Myanmar (Burmese)", "my"),
  nepali("Nepali", "ne"),
  norwegian("Norwegian", "no"),
  nyanja("Nyanja (Chichewa)", "ny"),
  odia("Odia (Oriya)", "or"),
  oromo("Oromo", "om"),
  pashto("Pashto", "ps"),
  persian("Persian", "fa"),
  polish("Polish", "pl"),
  portuguese("Portuguese", "pt"),
  punjabi("Punjabi", "pa"),
  quechua("Quechua", "qu"),
  romanian("Romanian", "ro"),
  russian("Russian", "ru"),
  samoan("Samoan", "sm"),
  sanskrit("Sanskrit", "sa"),
  scotsGaelic("Scots Gaelic", "gd"),
  sepedi("Sepedi", "nso"),
  serbian("Serbian", "sr"),
  sesotho("Sesotho", "st"),
  shona("Shona", "sn"),
  sindhi("Sindhi", "sd"),
  sinhala("Sinhala", "si"),
  slovak("Slovak", "sk"),
  slovenian("Slovenian", "sl"),
  somali("Somali", "so"),
  spanish("Spanish", "es"),
  sundanese("Sundanese", "su"),
  swahili("Swahili", "sw"),
  swedish("Swedish", "sv"),
  tagalog("Tagalog (Filipino)", "tl"),
  tajik("Tajik", "tg"),
  tamil("Tamil", "ta"),
  tatar("Tatar", "tt"),
  telugu("Telugu", "te"),
  thai("Thai", "th"),
  tigrinya("Tigrinya", "ti"),
  tsonga("Tsonga", "ts"),
  turkish("Turkish", "tr"),
  turkmen("Turkmen", "tk"),
  twi("Twi (Akan)", "ak"),
  ukrainian("Ukrainian", "uk"),
  urdu("Urdu", "ur"),
  uyghur("Uyghur", "ug"),
  uzbek("Uzbek", "uz"),
  vietnamese("Vietnamese", "vi"),
  welsh("Welsh", "cy"),
  xhosa("Xhosa", "xh"),
  yiddish("Yiddish", "yi"),
  yoruba("Yoruba", "yo"),
  zulu("Zulu", "zu");

  // Các thuộc tính của enum
  final String name;
  final String code;

  // Constructor cho enum
  const LanguageTranslate(this.name, this.code);

  // Phương thức để lấy tên ngôn ngữ
  String getName() => name;

  // Phương thức để lấy mã ngôn ngữ
  String getCode() => code;

  static List<LanguageTranslate> search(String name) {
    List<LanguageTranslate> list = [];
    for (var element in LanguageTranslate.values.sublist(1)) {
      if (element.name.toLowerCase().contains(name.toLowerCase())) {
        list.add(element);
      }
    }
    return list;
  }

  static LanguageTranslate fromCode(String code) {
    if (code == "zh") {
      code = "zh-cn";
    }
    for (var language in LanguageTranslate.values) {
      if (language.code == code) {
        return language;
      }
    }
    return LanguageTranslate
        .auto; // Trả về null nếu không tìm thấy mã ngôn ngữ tương ứng
  }
}
