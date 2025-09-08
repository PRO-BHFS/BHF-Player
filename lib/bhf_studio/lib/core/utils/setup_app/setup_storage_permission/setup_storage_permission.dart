import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

Future<void> setupStoragePermission() async {
  if (!Platform.isAndroid) return;

  final sdkInt = int.parse((await _getSdkInt()).toString());

  await Permission.manageExternalStorage.request();

  if (sdkInt < 33) {
    await Permission.storage.request();
    return;
  }

  await Permission.photos.request();
  await Permission.videos.request();
  await Permission.audio.request();
}

// دالة تجيب رقم API الحالي للجهاز
Future<int?> _getSdkInt() async {
  try {
    var result = await Process.run('getprop', ['ro.build.version.sdk']);
    return int.tryParse(result.stdout.toString().trim());
  } catch (e) {
    return null;
  }
}
