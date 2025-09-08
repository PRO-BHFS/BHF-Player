import 'dart:io';

import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

Future<void> setupScreenWindow() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  if (!Platform.isWindows) return;
  await windowManager.ensureInitialized();

  const windowOptions = WindowOptions(
    title: "BHF Player ${AppConsts.appVersion}",
    titleBarStyle: TitleBarStyle.normal,
    size: Size(500, 900),
    minimumSize: Size(400, 300),
    center: true,
    backgroundColor: Color(0x78000000),
    skipTaskbar: false,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}
