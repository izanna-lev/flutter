import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'language/en_us.dart';

class LocalizationService extends Translations {
  // Default locale
  static var locale;
  static var langsIndex = 0;
  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');
  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
  ];
  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
  ];
  LocalizationService(BuildContext context) {
    if (locale == null) {
      locale = ui.window.locale;
      Locale? temp = _getLocale(locale.languageCode);
      locale = temp ?? fallbackLocale;
      print(
          "CURRNT LOCALE $langsIndex ${locale.countryCode} ${locale.languageCode}");
    }
  }
  // Keys and their translati ons
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_us.dart
      };
  // Gets locale from language, and updates the locale
  static void changeLocale(String lang) {
    final tempLocale = _getLocaleFromLanguage(lang);
    print("changeLocale $tempLocale");
    if (tempLocale != null) {
      locale = tempLocale;
      Get.updateLocale(tempLocale);
    }
  }

  // Finds language in `langs` list and returns it as Locale
  static Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) {
        langsIndex = i;
        return locales[i];
      }
    }
    return Get.locale;
  }

  static Locale? _getLocale(String lang) {
    for (int i = 0; i < locales.length; i++) {
      if (lang == locales[i].languageCode) {
        langsIndex = i;
        return locales[i];
      }
    }
    return Get.locale;
  }
}
