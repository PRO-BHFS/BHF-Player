import 'package:flutter/material.dart';
import 'package:bhf_player/core/utils/styles/app_colors/light_colors.dart';

class AppCardTheme {
  AppCardTheme._();

  static CardThemeData get dark => CardThemeData(
    shape: RoundedRectangleBorder(
      side: const BorderSide(width: .5, color: LightColors.borderAppBar),
      borderRadius: BorderRadius.circular(1),
    ),
    elevation: 10,
    color: const Color.fromARGB(255, 18, 54, 255),
    shadowColor: const Color.fromARGB(74, 4, 22, 86),
  );

  static CardThemeData get light => CardThemeData(
    shape: RoundedRectangleBorder(
      side: const BorderSide(width: .5, color: LightColors.borderAppBar),
      borderRadius: BorderRadius.circular(2),
    ),
    elevation: 2,
    color: const Color.fromARGB(192, 77, 175, 255),

    shadowColor: const Color.fromARGB(103, 108, 108, 108),
  );
}
