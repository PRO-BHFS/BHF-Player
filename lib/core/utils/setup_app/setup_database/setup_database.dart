import 'dart:io';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:path_provider/path_provider.dart';

Future<void> setupDatabases() async {
  await initHydratedStorage();
  setupSqflite();
}

Future<void> initHydratedStorage() async {
  final storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationDocumentsDirectory()).path,
    ),
  );

  HydratedBloc.storage = storage;
}

void setupSqflite() {
  if (Platform.isAndroid) return;
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi; // تحديد قاعدة البيانات المستخدمة
}
