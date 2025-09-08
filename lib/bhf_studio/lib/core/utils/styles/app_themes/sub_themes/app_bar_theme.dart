import 'package:flutter/material.dart';
import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/core/utils/styles/app_colors/light_colors.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';

class AppAppBarTheme {
  AppAppBarTheme._();
  static AppBarTheme get dark => AppBarTheme(
    backgroundColor: DarkColors.appBar,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      fontSize: 11,
      color: DarkColors.onPrimary,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
    ),
    shape: const Border(
      bottom: BorderSide(color: DarkColors.border, width: .3),
    ),
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: DarkColors.icon, size: AppSizes.icon),
    actionsPadding: const EdgeInsets.symmetric(horizontal: 12),
    elevation: 12,
  );

  static AppBarTheme get light => AppBarTheme(
    backgroundColor: LightColors.appBar,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      fontSize: 15,
      color: LightColors.onPrimary,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
    ),
    shape: const Border(
      bottom: BorderSide(color: LightColors.borderAppBar, width: .3),
    ),
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: LightColors.icon, size: AppSizes.icon),
    actionsPadding: const EdgeInsets.symmetric(horizontal: 12),
  );
}
