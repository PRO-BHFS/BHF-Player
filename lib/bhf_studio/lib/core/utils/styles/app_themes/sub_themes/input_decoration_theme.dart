import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/light_colors.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputDecorationTheme {
  AppInputDecorationTheme._();
  static InputDecorationTheme get dark => InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMiddle),

      borderSide: BorderSide(color: const Color(0x3AFFFFFF), width: 1.r),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMiddle),

      borderSide: BorderSide(color: DarkColors.borderField, width: 1.r),
    ),

    hintStyle: const TextStyle(color: DarkColors.fontInputField, fontSize: 13),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall),

      borderSide: BorderSide(color: DarkColors.fontError, width: 1.r),
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
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall),

      borderSide: BorderSide(color: LightColors.borderField, width: 1.r),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall),

      borderSide: BorderSide(color: LightColors.borderField, width: 1.r),
    ),

    hintStyle: const TextStyle(color: LightColors.fontInputField, fontSize: 13),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall),

      borderSide: BorderSide(color: LightColors.borderFieldError, width: 1.r),
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
