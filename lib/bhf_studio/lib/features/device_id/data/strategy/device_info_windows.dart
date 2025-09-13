
import 'device_info_strategy.dart';

class DeviceInfoWindows extends AdminDeviceInfoStrategy {
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
