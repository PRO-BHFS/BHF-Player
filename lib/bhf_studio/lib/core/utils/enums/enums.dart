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


