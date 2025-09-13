import 'dart:math';

import 'device_info_strategy.dart';


class DeviceInfoOther extends AdminDeviceInfoStrategy {
  const DeviceInfoOther(super.deviceInfo);

  @override
  Future<String> getRawDeviceInfo() async {
    final randomNumber = Random.secure().nextDouble() * 99999999;
    return "$randomNumber";
  }
}
