import 'package:safe_device/safe_device.dart';

class DeviceSecuritySource {
  Future<DeviceSecuritySourceResult> getStatus() async {
    final isRooted = await SafeDevice.isJailBroken;
    final isRealDevice = await SafeDevice.isRealDevice;
    final isOnExternalStorage = await SafeDevice.isOnExternalStorage;
    final isUsbDebuggingEnabled = await SafeDevice.isUsbDebuggingEnabled;
    final isJailBrokenCustom = await SafeDevice.isJailBrokenCustom;
    final isMockLocation = await SafeDevice.isMockLocation;

    return DeviceSecuritySourceResult(
      isRooted: isRooted,
      isJailBroken: isRooted,
      isJailBrokenCustom: isJailBrokenCustom,
      isEmulator: !isRealDevice,
      isOnExternalStorage: isOnExternalStorage,
      isUsbDebuggingEnabled: isUsbDebuggingEnabled,
      isMockLocation: isMockLocation,
    );
  }
}

class DeviceSecuritySourceResult {
  final bool isRooted;
  final bool isJailBroken;
  final bool isJailBrokenCustom;
  final bool isEmulator;
  final bool isOnExternalStorage;
  final bool isUsbDebuggingEnabled;
  final bool isMockLocation;

  const DeviceSecuritySourceResult({
    required this.isRooted,
    required this.isEmulator,
    required this.isJailBroken,
    required this.isOnExternalStorage,
    required this.isUsbDebuggingEnabled,
    required this.isJailBrokenCustom,
    required this.isMockLocation,
  });
}
