

import 'package:bhf_player/core/utils/app_constants/keys.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);

  ThemeMode get themeMode => state;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void selectTheme(bool isDark) {
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeName = json[Keys.lastTheme] as String?;
    return themeName?.toThemeMode() ?? ThemeMode.dark;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) => {Keys.lastTheme: state.name};
}
