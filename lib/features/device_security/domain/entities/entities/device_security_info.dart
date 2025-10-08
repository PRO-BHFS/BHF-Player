class DeviceSecurityInfo {
  final bool isRooted;
  final bool isJailBroken;
  final bool isJailBrokenCustom;
  final bool isEmulator;
  final bool isOnExternalStorage;
  final bool isUsbDebuggingEnabled;
  final bool isMockLocation;

  bool get hasRootOrJailbreak => isRooted || isJailBroken || isJailBrokenCustom;

  const DeviceSecurityInfo({
    required this.isRooted,
    required this.isEmulator,
    required this.isJailBroken,
    required this.isOnExternalStorage,
    required this.isUsbDebuggingEnabled,
    required this.isJailBrokenCustom,
    required this.isMockLocation,
  });
}
