import 'package:flutter/material.dart';
import 'package:mukki/l10n/string_en.dart';
import 'package:mukki/l10n/string_ko.dart';
import 'package:mukki/l10n/string_ru.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> get translations {
    if (locale.languageCode == 'ko') {
      return koreanTranslations;
    } else if (locale.languageCode == 'en') {
      return englishTranslations;
    } else {
      return russianTranslations;
    }
  }

  String? get(String key) {
    return translations[key];
  }
}
