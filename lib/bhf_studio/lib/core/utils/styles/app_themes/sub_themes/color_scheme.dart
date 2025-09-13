import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/light_colors.dart';
import 'package:flutter/material.dart';

class AppColorScheme {
  AppColorScheme._();
  static ColorScheme get dark => const ColorScheme(
    brightness: Brightness.dark,
    primary: DarkColors.primary,
    onPrimary: DarkColors.fontMain,
    secondary: DarkColors.secondary,
    onSecondary: DarkColors.fontHeader,
    error: DarkColors.fontError,
    onError: DarkColors.fontHeader,
    surface: DarkColors.surface,
    onSurface: Color(0xFF52B7FF),
  );

  static ColorScheme get light => const ColorScheme(
    brightness: Brightness.light,
    primary: LightColors.primary,
    onPrimary: LightColors.onPrimary,
    secondary: LightColors.secondary,
    onSecondary: LightColors.fontMain,
    error: LightColors.fontError,
    onError: LightColors.fontError,
    surface: LightColors.surface,
    onSurface: LightColors.fontMain,
  );
}
