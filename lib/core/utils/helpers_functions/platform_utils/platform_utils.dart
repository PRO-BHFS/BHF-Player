import 'dart:io';

import 'package:flutter/services.dart';

int countIsolates() =>
    (Platform.numberOfProcessors - 1) == 0 ? 1 : Platform.numberOfProcessors;

Future<void> closeApp() async {
  Platform.isAndroid ? await SystemNavigator.pop() : exit(0);
}
