import 'package:flutter/material.dart';
import 'package:mukki/l10n/string_en.dart';
import 'package:mukki/l10n/string_ko.dart';
import './string_en.dart';
import './string_ko.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // 현재 로케일에 맞는 번역을 반환하는 메소드
  Map<String, String> get translations {
    if (locale.languageCode == 'ko') {
      return koreanTranslations;
    } else {
      return englishTranslations;
    }
  }

  String? get(String key) {
    return translations[key];
  }
}
