import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/light_colors.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppAppBarTheme {
  AppAppBarTheme._();
  static AppBarTheme get dark => AppBarTheme(
    backgroundColor: DarkColors.appBar,
    centerTitle: true,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Color(0x99000000),
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      color: DarkColors.onPrimary,
      fontWeight: FontWeight.bold,
    ),
    shape: const Border(
      bottom: BorderSide(color: DarkColors.border, width: .3),
    ),
    scrolledUnderElevation: 0,
    iconTheme: const IconThemeData(color: DarkColors.icon, size: AppSizes.icon),
    actionsPadding: const EdgeInsets.symmetric(horizontal: 12),
    elevation: 12,
  );

  static AppBarTheme get light => AppBarTheme(
    backgroundColor: LightColors.appBar,
    centerTitle: true,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Color(0x99000000),
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      color: DarkColors.onPrimary,
      fontWeight: FontWeight.bold,
    ),
    shape: const Border(
      bottom: BorderSide(color: LightColors.borderAppBar, width: .3),
    ),
    scrolledUnderElevation: 0,
    iconTheme: const IconThemeData(
      color: LightColors.icon,
      size: AppSizes.icon,
    ),
    actionsPadding: const EdgeInsets.symmetric(horizontal: 12),
  );
}
