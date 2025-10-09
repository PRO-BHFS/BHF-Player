import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme get dark => TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24.sp,
      color: DarkColors.fontMain,
      overflow: TextOverflow.ellipsis,
      
    ),

    headlineMedium: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 18.sp,
      color: Colors.white,
      overflow: TextOverflow.ellipsis,
    ),

    titleMedium: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    titleSmall: const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 15,
      height: 1.8,
      color: Colors.white,
      overflow: TextOverflow.fade,
    ),

    labelLarge: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13,
      color: Colors.white,
    ),

    labelMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17.sp,
      color: DarkColors.fontMain,
      overflow: TextOverflow.ellipsis,
    ),

    labelSmall: const TextStyle(color: DarkColors.fontMain, fontSize: 13),

    bodySmall: TextStyle(
      fontSize: 15.sp,
      color: DarkColors.fontMain,
      overflow: TextOverflow.visible,
      height: 1.7.sp,
    ),

    headlineSmall: TextStyle(
      fontSize: 8.sp,
      color: DarkColors.fontMain,
      fontWeight: FontWeight.bold,
    ),

    displaySmall: const TextStyle(
      fontSize: 12,
      color: DarkColors.fontMain,
      letterSpacing: 1.5,
    ),
  );

  static TextTheme get light => TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24.sp,
      overflow: TextOverflow.ellipsis,
    ),

    headlineMedium: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
    ),

    titleMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),

    titleSmall: const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 13,
      height: 1.8,
      overflow: TextOverflow.fade,
    ),

    labelLarge: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),

    labelMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17.sp,
      overflow: TextOverflow.ellipsis,
    ),

    labelSmall: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),

    bodySmall: TextStyle(
      fontSize: 15.sp,
      overflow: TextOverflow.visible,
      height: 1.7.sp,
    ),

    headlineSmall: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),

    displaySmall: const TextStyle(fontSize: 12, letterSpacing: 1.5),
  );
}
