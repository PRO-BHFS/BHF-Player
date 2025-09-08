import 'package:bhf_player/core/utils/app_constants/keys.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemePlayerCubit extends HydratedCubit<ThemeMode> {
  ThemePlayerCubit() : super(ThemeMode.system);

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
