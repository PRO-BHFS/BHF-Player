import 'package:flutter/foundation.dart';

extension OperationSystem on TargetPlatform {
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  static bool get isiOS => defaultTargetPlatform == TargetPlatform.iOS;
  static bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;
}
