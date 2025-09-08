import 'package:flutter/material.dart';

import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/core/utils/styles/app_colors/light_colors.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';

class AppInputDecorationTheme {
  AppInputDecorationTheme._();
  static InputDecorationTheme get dark => InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),

      borderSide: const BorderSide(color: DarkColors.borderField, width: 0.4),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),

      borderSide: const BorderSide(color: DarkColors.borderField, width: 0.4),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,

    hintStyle: const TextStyle(color: DarkColors.fontInputField, fontSize: 13),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),

      borderSide: const BorderSide(color: DarkColors.fontError, width: 1),
    ),

    errorStyle: const TextStyle(
      color: DarkColors.fontError,
      fontWeight: FontWeight.bold,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSizes.secondPadding,
    ),
    counterStyle: const TextStyle(fontSize: 8),
    
  );

  static InputDecorationTheme get light => InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),

      borderSide: const BorderSide(color: LightColors.borderField, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),

      borderSide: const BorderSide(color: LightColors.borderField, width: 1),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,

    hintStyle: const TextStyle(color: LightColors.fontInputField, fontSize: 13),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),

      borderSide: const BorderSide(
        color: LightColors.borderFieldError,
        width: 1,
      ),
    ),
    counterStyle: const TextStyle(fontSize: 8),
    errorStyle: const TextStyle(
      color: LightColors.fontError,
      fontWeight: FontWeight.bold,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSizes.secondPadding,
    ),
    iconColor: LightColors.icon,
  );
}
