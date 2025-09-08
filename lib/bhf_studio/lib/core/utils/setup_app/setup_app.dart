// import 'package:bhf_player/core/utils/helpers_functions/cache/cache_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'package:bhf_player/bhf_studio/lib/core/presentation/controllers/bloc_observer/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'setup_storage_permission/setup_storage_permission.dart';
import 'setup_services_locator/setup_services_locator.dart';

Future<void> setupBhfStudioApp() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);  await setupScreenWindow();
  await setupServicesLocator();
  await setupStoragePermission();

  // await clearCacheIfNeeded();
  Bloc.observer = MyBlocObserver();
  await s1.allReady();
}
