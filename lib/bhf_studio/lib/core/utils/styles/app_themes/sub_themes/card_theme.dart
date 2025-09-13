import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class AppCardTheme {
  AppCardTheme._();

  static CardThemeData get dark => const CardThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(AppSizes.borderRadiusBig),
        topEnd: Radius.circular(AppSizes.borderRadiusSmall),
        bottomStart: Radius.circular(AppSizes.borderRadiusSmall),
        bottomEnd: Radius.circular(AppSizes.borderRadiusBig),
      ),
    ),
    margin: EdgeInsets.symmetric(vertical: 2),
    color: Color.fromARGB(255, 18, 54, 255),
  );

  static CardThemeData get light => const CardThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(AppSizes.borderRadiusBig),
        topEnd: Radius.circular(AppSizes.borderRadiusSmall),
        bottomStart: Radius.circular(AppSizes.borderRadiusSmall),
        bottomEnd: Radius.circular(AppSizes.borderRadiusBig),
      ),
    ),
    elevation: 2,
    margin: EdgeInsets.symmetric(vertical: 2),

    color: Color.fromARGB(192, 77, 175, 255),

    shadowColor: Color.fromARGB(103, 108, 108, 108),
  );
}
