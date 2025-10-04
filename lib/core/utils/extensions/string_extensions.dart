import 'package:flutter/material.dart';
import 'package:bhf_player/core/utils/enums/enums.dart';

extension ThemeModeString on String? {
  ThemeMode toThemeMode() {
    final modes = {
      ThemeMode.dark.name: ThemeMode.dark,
      ThemeMode.light.name: ThemeMode.light,
      ThemeMode.system.name: ThemeMode.system,
    };
    return modes[this] ?? ThemeMode.system;
  }
}

extension LanguageChange on String? {
  Language toLanguage() {
    final langs = {
      Language.ar.name: Language.ar,
      Language.en.name: Language.en,
    };
    return langs[this] ?? Language.defaultLang;
  }
}

extension Numbers on String {
  double get toDouble => double.tryParse(this) ?? 0;
  int get toInt => int.tryParse(this) ?? 0;
}
