import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/core/utils/styles/app_colors/light_colors.dart';
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

    titleSmall: const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 13,
      height: 1.5,
      color: Colors.white,
    ),

    titleMedium: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    labelSmall: TextStyle(color: const Color(0xFFFFFFFF), fontSize: 14.sp),

    labelMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17.sp,
      color: DarkColors.fontMain,
      overflow: TextOverflow.ellipsis,
    ),

    labelLarge: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13,
      color: Colors.white,
    ),

    bodySmall: TextStyle(
      fontSize: 15.sp,
      color: DarkColors.fontMain,
      overflow: TextOverflow.visible,
      height: 1.7.sp
    ),
  );

  static TextTheme get light => const TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: LightColors.fontMain,
      overflow: TextOverflow.ellipsis,
    ),

    headlineMedium: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 17,
      color: Colors.white,
    ),
    titleSmall: TextStyle(fontWeight: FontWeight.w700, fontSize: 10),

    titleMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),

    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),

    labelMedium: TextStyle(fontWeight: FontWeight.bold),

    labelLarge: TextStyle(fontWeight: FontWeight.w600),

    bodySmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
  );
}
