import 'dart:io';

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

  static Language get defaultLang => Language.ar;
}
