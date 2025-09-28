import 'package:bhf_player/core/utils/app_constants/app_assests/app_fonts_assests.dart';
import 'package:bhf_player/core/utils/styles/app_themes/sub_themes/bottom_nav_bar_theme.dart';
import 'package:bhf_player/core/utils/styles/app_themes/sub_themes/progress_indicator_theme.dart';
import 'package:bhf_player/core/utils/styles/app_themes/sub_themes/slider_theme.dart';
import 'package:flutter/material.dart';
import 'package:bhf_player/core/utils/styles/app_colors/light_colors.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/core/utils/styles/app_themes/sub_themes/app_bar_theme.dart';
import 'package:bhf_player/core/utils/styles/app_themes/sub_themes/button_theme.dart';
import 'package:bhf_player/core/utils/styles/app_themes/sub_themes/card_theme.dart';
import 'package:bhf_player/core/utils/styles/app_themes/sub_themes/color_scheme.dart';
import 'package:bhf_player/core/utils/styles/app_themes/sub_themes/input_decoration_theme.dart';
import 'package:bhf_player/core/utils/styles/app_themes/sub_themes/text_theme.dart';

ThemeData lightThemeData() => ThemeData(
  fontFamily: AppFontsAssests.spaceGrotesk,
  scaffoldBackgroundColor: const Color(0xF1FCFCFC),
  hintColor: const Color(0xB5B8B8B8),

  brightness: Brightness.light,

  colorScheme: AppColorScheme.light,

  appBarTheme: AppAppBarTheme.light,

  inputDecorationTheme: AppInputDecorationTheme.light,

  textTheme: AppTextTheme.light,

  elevatedButtonTheme: AppButtonTheme.elevatedLight,

  cardTheme: AppCardTheme.light,

  progressIndicatorTheme: AppProgressIndicatorTheme.light,

  sliderTheme: AppSliderTheme.light,

  bottomNavigationBarTheme: BottomNavBarTheme.light,

  iconTheme: const IconThemeData(color: LightColors.icon, size: AppSizes.icon),

  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: Color.fromARGB(255, 199, 254, 255),
  ),

  dividerTheme: const DividerThemeData(
    color: LightColors.borderAppBar,
    thickness: 1,
  ),
);
