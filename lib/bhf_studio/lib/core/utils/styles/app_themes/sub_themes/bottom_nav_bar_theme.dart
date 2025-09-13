import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class BottomNavBarTheme {
  BottomNavBarTheme._();

  static BottomNavigationBarThemeData get dark =>
      const BottomNavigationBarThemeData(
        backgroundColor: Color(0XFF172633),

        unselectedIconTheme: IconThemeData(color: DarkColors.unSelected),
        selectedIconTheme: IconThemeData(color: DarkColors.selected),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 14,
          color: DarkColors.selected,
        ),
        selectedItemColor: DarkColors.selected,
        unselectedItemColor: DarkColors.unSelected,
        elevation: 12,
      );

  static BottomNavigationBarThemeData get light =>
      const BottomNavigationBarThemeData(
        backgroundColor: DarkColors.appBar,
        selectedIconTheme: IconThemeData(
          color: DarkColors.selected,
          size: AppSizes.icon + 1,
        ),
        unselectedIconTheme: IconThemeData(
          color: DarkColors.unSelected,
          size: AppSizes.icon,
        ),
        selectedItemColor: DarkColors.selected,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: DarkColors.selected,
        ),
        unselectedItemColor: DarkColors.unSelected,
        elevation: 12,
      );
}
