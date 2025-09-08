import 'package:bhf_player/features/device_id/data/strategy/device_info_strategy.dart';

class DeviceInfoIos extends DeviceInfoStrategy {
  const DeviceInfoIos(super.deviceInfo);

  @override
  Future<String> getRawDeviceInfo() async {
    final iosInfo = await deviceInfo.iosInfo;
    final identifierForVendor = iosInfo.identifierForVendor;
    final model = iosInfo.model;
    final systemName = iosInfo.systemName;
    return "$identifierForVendor$model$systemName";
  }
}
