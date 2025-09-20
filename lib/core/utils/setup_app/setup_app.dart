import 'package:bhf_player/core/utils/helpers_functions/cache/cache_utils.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'setup_app_window/setup_app_window.dart';
import 'service_locator/service_locator.dart';
import 'setup_database/setup_database.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> setupApp() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await setupScreenWindow();
  MediaKit.ensureInitialized();
  await setupDatabases();
  await setupUserServicesLocator();

  await clearCacheIfNeeded();
  FlutterNativeSplash.remove();
}
