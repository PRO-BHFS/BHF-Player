import 'package:bhf_player/features/device_id/data/strategy/device_info_strategy.dart';

class DeviceInfoWindows extends DeviceInfoStrategy {
  const DeviceInfoWindows(super.deviceInfo);

  @override
  Future<String> getRawDeviceInfo() async {
    final windowsInfo = await deviceInfo.windowsInfo;
    final buildLab = windowsInfo.buildLab;
    final buildNumber = windowsInfo.buildNumber.toString();
    final deviceId = windowsInfo.deviceId;
    return "$buildLab$buildNumber$deviceId";
  }
}
