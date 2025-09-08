import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme get dark => const TextTheme(
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 17,
      color: Colors.white,
    ),

    titleSmall: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 13,
      height: 1.5,
      color: Colors.white,
    ),

    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    labelSmall: TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: 1,
    ),

    labelMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 13,
      color: Colors.white,
    ),

    labelLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13,
      color: Colors.white,
    ),

    bodySmall: TextStyle(
      fontSize: 13,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
  );

  static TextTheme get light => const TextTheme(
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
