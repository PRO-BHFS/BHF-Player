import 'dart:io';

import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

Future<void> enableFullScreenEdgeToEdgeMode() async {
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations(DeviceOrientation.values);

  if (!Platform.isWindows) return;
  await windowManager.setFullScreen(false); 

}

Future<void> enableLandscapeImmersiveMode() async {
  // immersive => اخفاء الادوات الساعة والبطارية من اعلى الشاشة وازرار الرجوع من الاسفل
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  if (!Platform.isWindows) return;
  await windowManager.setFullScreen(true); 
}
