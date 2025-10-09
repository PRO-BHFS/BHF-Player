import 'package:flutter/material.dart';

class AppProgressIndicatorTheme {
  AppProgressIndicatorTheme._();
  static ProgressIndicatorThemeData get dark => ProgressIndicatorThemeData(
    color: const Color(0XFF198BFB),
    strokeAlign: 8,
    strokeCap: StrokeCap.round,
    linearTrackColor: const Color(0XFF3B4754),
    circularTrackColor: const Color(0XFF3B4754),
    borderRadius: BorderRadius.circular(15),
  );

  static ProgressIndicatorThemeData get light => ProgressIndicatorThemeData(
    color: const Color(0XFF198BFB),
    strokeAlign: 8,
    strokeCap: StrokeCap.round,
    linearTrackColor: Colors.white,
    circularTrackColor: Colors.white,
    borderRadius: BorderRadius.circular(15),
    
  );
}
