import 'package:flutter/foundation.dart';

extension LogError on Object {
  void logError({StackTrace? stack, String? methodName}) {
    if (methodName != null) if (kDebugMode) print("Method name: $methodName");
    if (kDebugMode) print("Error: $this");
    if (stack != null) if (kDebugMode) print("Stack trace: $stack");
  }
}
