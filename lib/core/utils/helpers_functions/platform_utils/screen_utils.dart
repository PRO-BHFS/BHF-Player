import 'dart:io';

import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

// تفعيل الوضع العادي للشاشة (خروج من ملء الشاشة)
// - في Android: عرض الأشرطة العلوية والسفلية.
// - في Windows: الخروج من وضع ملء الشاشة.
Future<void> setNormalScreenMode() async {
  await setSystemUIVisibility(true);
  await SystemChrome.setPreferredOrientations(DeviceOrientation.values);

  if (!Platform.isWindows) return;
  await windowManager.setFullScreen(false);
}

// تفعيل وضع ملء الشاشة.
// - في Android: إخفاء الساعة والأزرار، وتدوير الشاشة أفقيًا.
// - في Windows: تكبير النافذة لتملأ الشاشة.
Future<void> setFullScreenMode() async {
  // immersive => اخفاء الادوات الساعة والبطارية من اعلى الشاشة وازرار الرجوع من الاسفل
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  if (!Platform.isWindows) return;
  await windowManager.setFullScreen(true);
}

Future<void> setSystemUIVisibility(bool isVisible) async {
  await SystemChrome.setEnabledSystemUIMode(
    isVisible ? SystemUiMode.edgeToEdge : SystemUiMode.immersiveSticky,
    
  );
}
