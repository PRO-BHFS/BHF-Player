import 'package:flutter/material.dart';

class AppSliderTheme {
  AppSliderTheme._();
  static SliderThemeData get dark => const SliderThemeData(
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
    trackHeight: 1,

    thumbColor: Color.fromARGB(255, 7, 73, 255),
    
    overlayShape: RoundSliderThumbShape(enabledThumbRadius: 10, elevation: 10),
    activeTrackColor: Color.fromARGB(255, 7, 147, 255),
    inactiveTrackColor: Color(0x8DD4D4D4),
  );

  static SliderThemeData get light => const SliderThemeData(
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
    trackHeight: 1,
    thumbColor: Color.fromARGB(255, 7, 36, 255),
    overlayShape: RoundSliderThumbShape(enabledThumbRadius: 10, elevation: 10),
    activeTrackColor: Color.fromARGB(255, 7, 176, 255),
    inactiveTrackColor: Color.fromARGB(151, 226, 226, 226),
  );
}
