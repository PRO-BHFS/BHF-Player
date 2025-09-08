import 'package:bhf_player/features/device_id/data/strategy/device_info_strategy.dart';

class DeviceInfoAndroid extends DeviceInfoStrategy {
  const DeviceInfoAndroid(super.deviceInfo);

  @override
  Future<String> getRawDeviceInfo() async {
    final androidInfo = await deviceInfo.androidInfo;
    String board = androidInfo.board;
    String hardware = androidInfo.hardware;
    String device = androidInfo.device;
    return "$board$hardware$device";
  }
}
