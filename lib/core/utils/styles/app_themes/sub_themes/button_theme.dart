import 'package:flutter/material.dart';
import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonTheme {
  AppButtonTheme._();
  static ElevatedButtonThemeData get elevatedDark => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: DarkColors.fontButton,
      backgroundColor: DarkColors.primary,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusMiddle),
      ),
      shadowColor: const Color(0x402A79C2),
      disabledBackgroundColor: const Color(0xFF21364A),
      minimumSize: Size(0, 55.h),
    ),
  );

  static ElevatedButtonThemeData get elevatedLight => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: DarkColors.fontButton,
      backgroundColor: DarkColors.primary,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusMiddle),
      ),
      shadowColor: const Color(0x803B3B3B),
      minimumSize: const Size(0, 55),
    ),
  );
}
