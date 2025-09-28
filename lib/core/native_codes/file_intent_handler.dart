import 'package:flutter/services.dart';

class FileIntentHandler {
  static const _channel = MethodChannel("file_intent_channel");

  /// ملف عند فتح التطبيق أول مرة من مشاركة/فتح
  static Future<String?> getInitialFile() async {
    return await _channel.invokeMethod("getInitialFile");
  }

  /// الاستماع لملفات جديدة أثناء عمل التطبيق
  static void listenNewFiles(Function(String path) onFile) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == "onNewFile") {
        String filePath = call.arguments as String;
        onFile(filePath);
      }
    });
  }
}
