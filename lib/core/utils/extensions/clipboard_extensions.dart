import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bhf_player/core/utils/helpers_functions/notifications/notifications.dart';

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
