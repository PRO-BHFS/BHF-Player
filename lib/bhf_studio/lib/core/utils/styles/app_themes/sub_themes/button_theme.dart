import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/light_colors.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class AppButtonTheme {
  AppButtonTheme._();
  static ElevatedButtonThemeData get elevatedDark => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: DarkColors.fontButton,
      backgroundColor: DarkColors.primary,
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.bigBorderRadius),
      ),
      padding: const EdgeInsets.all(AppSizes.secondPadding),
      shadowColor: DarkColors.shadowButton,
      fixedSize: const Size(double.infinity, 55),
    ),
  );

  static ElevatedButtonThemeData get elevatedLight => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: LightColors.fontButton,
      backgroundColor: LightColors.primary,
      textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.all(AppSizes.secondPadding),
      shadowColor: LightColors.shadowButton,
      fixedSize: const Size(double.infinity, 55),
    ),
  );
}
