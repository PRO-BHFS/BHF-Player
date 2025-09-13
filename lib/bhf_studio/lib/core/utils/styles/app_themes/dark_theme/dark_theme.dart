import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/assests/fonts.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_themes/sub_themes/app_bar_theme.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_themes/sub_themes/bottom_nav_bar_theme.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_themes/sub_themes/button_theme.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_themes/sub_themes/card_theme.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_themes/sub_themes/color_scheme.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_themes/sub_themes/input_decoration_theme.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_themes/sub_themes/progress_indicator_theme.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_themes/sub_themes/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData darkThemeData() => ThemeData(
  fontFamily: Fonts.spaceGrotesk,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: DarkColors.baseColor,
  hintColor: const Color(0xB5B8B8B8),
  disabledColor: const Color(0xFF465570),
  colorScheme: AppColorScheme.dark,

  appBarTheme: AppAppBarTheme.dark,

  inputDecorationTheme: AppInputDecorationTheme.dark,

  textTheme: AppTextTheme.dark,

  elevatedButtonTheme: AppButtonTheme.elevatedDark,

  cardTheme: AppCardTheme.dark,

  progressIndicatorTheme: AppProgressIndicatorTheme.dark,

  iconTheme: const IconThemeData(color: DarkColors.icon, size: AppSizes.icon),

  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: Color(0xFF051E78),
  ),

  dividerTheme: const DividerThemeData(
    color: DarkColors.border,
    thickness: 0.3,
  ),

  bottomNavigationBarTheme: BottomNavBarTheme.dark,
);
