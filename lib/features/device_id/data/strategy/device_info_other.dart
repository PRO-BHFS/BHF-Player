import 'dart:math';

import 'package:bhf_player/features/device_id/data/strategy/device_info_strategy.dart';

class DeviceInfoOther extends DeviceInfoStrategy {
  const DeviceInfoOther(super.deviceInfo);

  @override
  Future<String> getRawDeviceInfo() async {
    final randomNumber = Random.secure().nextDouble() * 99999999;
    return "$randomNumber";
  }
}
