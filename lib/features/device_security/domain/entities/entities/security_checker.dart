import 'dart:io';

import 'package:bhf_player/core/exceptions/device_security/device_security_exception.dart';
import 'package:bhf_player/core/utils/extensions/error_extensions.dart';

import 'device_security_info.dart';

class SecurityChecker {
  final DeviceSecurityInfo _deviceInfo;

  static SecurityChecker? _instance;

  SecurityChecker._(this._deviceInfo);

  factory SecurityChecker(DeviceSecurityInfo deviceInfo) {
    _instance ??= SecurityChecker._(deviceInfo);
    return _instance!;
  }

  void _validateSecurity() {
    if (_deviceInfo.hasRootOrJailbreak) {
      if (Platform.isIOS) throw JailBrokenDeviceException();
      throw RootedDeviceException();
    } else if (_deviceInfo.isEmulator) {
      throw EmulatorDeviceException();
    } else if (_deviceInfo.isOnExternalStorage) {
      throw ExternalStorageException();
    }
  }

  Future<String?> checkDeviceSecure() async {
    try {
      _validateSecurity();
      return null;
    } catch (errorMessage, stack) {
      errorMessage.logError(stack: stack);
      return errorMessage.toString();
    }
  }
}
