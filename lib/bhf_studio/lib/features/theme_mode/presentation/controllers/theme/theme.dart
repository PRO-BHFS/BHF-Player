import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  ThemeMode get themeMode => state;

  Future<void> selectTheme(ThemeMode newTheme) async {
    if (newTheme == state) return;

    emit(newTheme);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeName = json[Keys.lastTheme] as String?;
    return themeName?.toThemeMode() ?? ThemeMode.system;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) => {Keys.lastTheme: state.name};
}
