import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:flutter/services.dart';

class ScreenshotProtector {
  static const _platform = MethodChannel('screenshot_listener');

  static Future<void> disableScreenshot() async {
    try {
      await _platform.invokeMethod('disableScreenshot');
    } catch (e,s) {
      e.logError(stack: s);
    }
  }

  static Future<void> enableScreenshot() async {
    try {
      await _platform.invokeMethod('enableScreenshot');
    } catch (e,s) {
      e.logError(stack: s);
    }
  }
}
