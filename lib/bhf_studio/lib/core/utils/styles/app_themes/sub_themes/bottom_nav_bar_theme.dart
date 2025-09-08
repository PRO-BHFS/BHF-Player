import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/light_colors.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class BottomNavBarTheme {
  BottomNavBarTheme._();

  static BottomNavigationBarThemeData get dark => const BottomNavigationBarThemeData(
    backgroundColor: DarkColors.appBar,
    selectedIconTheme: IconThemeData(
      color: DarkColors.icon,
      size: AppSizes.icon,
    ),
    unselectedIconTheme: IconThemeData(
      color: DarkColors.unSelectedItem,
      size: AppSizes.icon - 2,
    ),
    selectedItemColor: DarkColors.fontMain,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
    unselectedItemColor: DarkColors.unSelectedItem,
    elevation: 12,
  );

  static BottomNavigationBarThemeData get light => const BottomNavigationBarThemeData(
    backgroundColor: LightColors.appBar,
    selectedIconTheme: IconThemeData(
      size: AppSizes.icon,
      color: LightColors.icon,
    ),

    unselectedIconTheme: IconThemeData(
      color: LightColors.unSelectedItem,
      size: AppSizes.icon - 2,
    ),
    selectedItemColor: LightColors.main,
    unselectedItemColor: LightColors.unSelectedItem,
  );
}
