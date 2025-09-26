import 'dart:io';
import 'dart:ui';

enum OperationSystem {
  android,
  ios,
  windows,
  other;

  static OperationSystem currentOS() {
    switch (Platform.operatingSystem) {
      case "android":
        return android;
      case "windows":
        return windows;
      case "ios":
        return ios;
      default:
        return other;
    }
  }
}

enum GestureArea { left, center, right }

enum Language {
  en("en"),
  ar("ar");

  final String code;
  const Language(this.code);

  static Language get defaultLang => ar;
  TextDirection get textDirection =>
      this == ar ? TextDirection.rtl : TextDirection.ltr;
}

enum AspectRatioPlayer {
  fit(16 / 9),
  original(4 / 3),
  fill(-1);

  final double value;

  const AspectRatioPlayer(this.value);

  bool get isOriginal => this == original;
  bool get isFill => this == fill;

  AspectRatioPlayer switchAspect() {
    const ratios = AspectRatioPlayer.values;
    final nextIndex = ratios.indexOf(this) + 1;

    return ratios.elementAtOrNull(nextIndex) ?? ratios.first;
  }
}
