import 'dart:io';

import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/notifications/notifications.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension FilesPaths on Directory {
  String joinPath({required String filename, required String fileExtension}) =>
      "$path/$filename.$fileExtension";
}

extension PageRoute on BuildContext {
  Future<void> pushRoute(Widget page) async {
    await Navigator.push(this, MaterialPageRoute(builder: (_) => page));
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

extension ThemeModeString on String {
  ThemeMode toThemeMode() {
    final modes = {
      ThemeMode.dark.name: ThemeMode.dark,
      ThemeMode.light.name: ThemeMode.light,
      ThemeMode.system.name: ThemeMode.system,
    };
    return modes[this] ?? ThemeMode.system;
  }
}

extension Layout on BuildContext {
  MediaQueryData get _mq => MediaQuery.of(this);

  double get screenWidth => _mq.size.width;
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
  Future<void>  pasteFromClipboard() async {
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
  double get toDouble => double.tryParse(this)??0;
  int get toInt => int.tryParse(this)??0;
  
}
