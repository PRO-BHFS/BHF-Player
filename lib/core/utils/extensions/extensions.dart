import 'dart:io';
import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:bhf_player/core/utils/helpers_functions/notifications/notifications.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension FilesPaths on Directory {
  String joinPath({
    required String filename,
    required String fileExtension,
    required String separator,
  }) {
    return "$path$separator$filename.$fileExtension";
  }
}

extension PageRoute on BuildContext {
  Future<void> pushRoute(Widget page) async {
    await Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<void> pushReplacementRoute(Widget page) async {
    await Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  Future<void> pushAndRemoveAll(Widget page) async {
    await Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (_) => page),
      (route) => false, // تمسح كل الصفحات القديمة
    );
  }

  void popRoute() {
    Navigator.pop(this);
  }
}

extension Themes on BuildContext {
  bool isDark() => Theme.of(this).brightness == Brightness.dark;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
}

extension Layout on BuildContext {
  MediaQueryData get _mq => MediaQuery.of(this);

  double get screenWidth => _mq.size.width;
  double get devicePixelRatio => _mq.devicePixelRatio;
  double get screenHeight => _mq.size.height;
  double get widthExceptPadding => screenWidth - AppSizes.mainPadding;
  EdgeInsets get mediaViewInsets => _mq.viewInsets;
}

extension SeparatedWidgetList on List<Widget> {
  List<Widget> separatedBy(Widget seperator) {
    final result = <Widget>[];
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i != length - 1) result.add(seperator);
    }
    return result;
  }
}

extension ThemeModeString on String? {
  ThemeMode toThemeMode() {
    final modes = {
      ThemeMode.dark.name: ThemeMode.dark,
      ThemeMode.light.name: ThemeMode.light,
      ThemeMode.system.name: ThemeMode.system,
    };
    return modes[this] ?? ThemeMode.system;
  }
}

extension LanguageChange on String? {
  Language toLanguage() {
    final langs = {
      Language.ar.name: Language.ar,
      Language.en.name: Language.en,
    };
    return langs[this] ?? Language.defaultLang;
  }
}

extension VideoDurationFormatting on Duration {
  String _padTwoDigits(int n) => n.toString().padLeft(2, '0');

  String get formattedVideoDuration {
    if ( this == Duration.zero ) return '--:--';
    final hours = _padTwoDigits(inHours);
    final minutes = _padTwoDigits(inMinutes.remainder(60));
    final seconds = _padTwoDigits(inSeconds.remainder(60));
    return inHours > 0 ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
  }
}

extension ClipboardExtensions on String {
  Future<void> copyToClipboard() async {
    try {
      await Clipboard.setData(ClipboardData(text: this));
      Notifications.showFlushbar(
        message: 'تم النسخ إلى الحافظة',
        iconType: IconType.done,
      );
    } catch (e) {
      Notifications.showFlushbar(
        message: 'فشل النسخ إلى الحافظة',
        iconType: IconType.error,
      );
    }
  }
}

extension ClipboardPasteExtensions on TextEditingController {
  Future<void> pasteFromClipboard() async {
    try {
      final data = await Clipboard.getData(Clipboard.kTextPlain);
      if (data != null) text = data.text ?? text;
    } catch (e) {
      Notifications.showFlushbar(
        message: 'فشل اللصق من الحافظة',
        iconType: IconType.error,
      );
    }
  }
}

extension Numbers on String {
  double get toDouble => double.tryParse(this) ?? 0;
  int get toInt => int.tryParse(this) ?? 0;
}

extension LogError on Object {
  void logError({StackTrace? stack, String? methodName}) {
    if (methodName != null) if (kDebugMode) print("Method name: $methodName");
    if (kDebugMode) print("Error: $this");
    if (stack != null) if (kDebugMode) print("Stack trace: $stack");
  }
}

extension Numberes on num {
  String range(num min, num max) {
    final newValue = this / 6;
    final rangeValue = newValue.clamp(min, max);
    return rangeValue.toStringAsFixed(0);
  }
}
