import 'package:flutter/material.dart';

enum Environment { dev, prod }

enum AppLocale { en, hindi, es, pt, vi, id, ru, fr, japan, korea, arab }

extension AppLocaleExt on AppLocale {
  Locale get value {
    switch (this) {
      case AppLocale.vi:
        return const Locale('vi');
      case AppLocale.id:
        return const Locale('id');
      case AppLocale.en:
        return const Locale('en', 'us');
      case AppLocale.hindi:
        return const Locale('hi');
      case AppLocale.es:
        return const Locale('es');
      case AppLocale.pt:
        return const Locale('pt');
      case AppLocale.ru:
        return const Locale('ru');
      case AppLocale.fr:
        return const Locale('fr');
      case AppLocale.japan:
        return const Locale('ja');
      case AppLocale.korea:
        return const Locale('ko');
      case AppLocale.arab:
        return const Locale('ar');
      default:
        return const Locale('en', 'us');
    }
  }

  Locale fromLocaleString(String str) {
    switch (str) {
      case 'vi':
        return const Locale('vi');
      case 'id':
        return const Locale('id');
      case 'en_us':
        return const Locale('en', 'us');
      case 'hi':
        return const Locale('hi');
      case 'pt':
        return const Locale('pt');
      case 'ru':
        return const Locale('ru');
      case 'ja':
        return const Locale('ja');
      case 'fr':
        return const Locale('fr');
      case 'ko':
        return const Locale('ko');
      case 'ar':
        return const Locale('ar');
      default:
        return const Locale('en', 'us');
    }
  }

  String toSavedLocalString() {
    switch (this) {
      case AppLocale.vi:
        return 'vi';
      case AppLocale.id:
        return 'id';
      case AppLocale.en:
        return 'en_us';
      case AppLocale.hindi:
        return 'hi';
      case AppLocale.pt:
        return 'pt';
      case AppLocale.ru:
        return 'ru';
      case AppLocale.fr:
        return 'fr';
      case AppLocale.japan:
        return 'ja';
      case AppLocale.korea:
        return 'ko';
      case AppLocale.arab:
        return 'ar';
      default:
        return 'en_us';
    }
  }

  String toLocaleString() {
    switch (this) {
      case AppLocale.vi:
        return 'Vietnamese';
      case AppLocale.id:
        return 'Indonesian';
      case AppLocale.en:
        return 'English';
      case AppLocale.hindi:
        return 'Hindi';
      case AppLocale.es:
        return 'Spanish';
      case AppLocale.pt:
        return 'Portuguese';
      case AppLocale.ru:
        return 'Russian';
      case AppLocale.fr:
        return 'French';
      case AppLocale.japan:
        return 'Japanese';
      case AppLocale.korea:
        return 'Korean';
      case AppLocale.arab:
        return 'Arabic';
      default:
        return 'English';
    }
  }
}
