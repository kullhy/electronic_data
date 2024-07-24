enum MLLanguageTranslate {
  auto("Automatic", "auto"),
  afrikaans("Afrikaans", "af"),
  albanian("Albanian", "sq"),
  arabic("Arabic", "ar"),
  belarusian("Belarusian", "be"),
  bengali("Bengali", "bn"),
  bulgarian("Bulgarian", "bg"),
  catalan("Catalan", "ca"),
  chinese("Chinese", "zh"),
  croatian("Croatian", "hr"),
  czech("Czech", "cs"),
  danish("Danish", "da"),
  dutch("Dutch", "nl"),
  english("English", "en"),
  esperanto("Esperanto", "eo"),
  estonian("Estonian", "et"),
  finnish("Finnish", "fi"),
  french("French", "fr"),
  galician("Galician", "gl"),
  georgian("Georgian", "ka"),
  german("German", "de"),
  greek("Greek", "el"),
  gujarati("Gujarati", "gu"),
  haitian("Haitian", "ht"),
  hebrew("Hebrew", "he"),
  hindi("Hindi", "hi"),
  hungarian("Hungarian", "hu"),
  icelandic("Icelandic", "is"),
  indonesian("Indonesian", "id"),
  irish("Irish", "ga"),
  italian("Italian", "it"),
  japanese("Japanese", "ja"),
  kannada("Kannada", "kn"),
  korean("Korean", "ko"),
  latvian("Latvian", "lv"),
  lithuanian("Lithuanian", "lt"),
  macedonian("Macedonian", "mk"),
  malay("Malay", "ms"),
  maltese("Maltese", "mt"),
  marathi("Marathi", "mr"),
  norwegian("Norwegian", "no"),
  persian("Persian", "fa"),
  polish("Polish", "pl"),
  portuguese("Portuguese", "pt"),
  romanian("Romanian", "ro"),
  russian("Russian", "ru"),
  slovak("Slovak", "sk"),
  slovenian("Slovenian", "sl"),
  spanish("Spanish", "es"),
  swahili("Swahili", "sw"),
  swedish("Swedish", "sv"),
  tagalog("Tagalog", "tl"),
  tamil("Tamil", "ta"),
  telugu("Telugu", "te"),
  thai("Thai", "th"),
  turkish("Turkish", "tr"),
  ukrainian("Ukrainian", "uk"),
  urdu("Urdu", "ur"),
  vietnamese("Vietnamese", "vi"),
  welsh("Welsh", "cy");

  // Các thuộc tính của enum
  final String name;
  final String code;

  // Constructor cho enum
  const MLLanguageTranslate(this.name, this.code);

  // Phương thức để lấy tên ngôn ngữ
  String getName() => name;

  // Phương thức để lấy mã ngôn ngữ
  String getCode() => code;

  // Phương thức tìm kiếm ngôn ngữ theo tên
  static List<MLLanguageTranslate> search(String name) {
    List<MLLanguageTranslate> list = [];
    for (var element in MLLanguageTranslate.values) {
      if (element.name.toLowerCase().contains(name.toLowerCase())) {
        list.add(element);
      }
    }
    return list;
  }

  static MLLanguageTranslate fromCode(String code) {
    for (var language in MLLanguageTranslate.values) {
      if (language.code == code) {
        return language;
      }
    }
    return MLLanguageTranslate.auto; // Trả về null nếu không tìm thấy mã ngôn ngữ tương ứng
  }
}
