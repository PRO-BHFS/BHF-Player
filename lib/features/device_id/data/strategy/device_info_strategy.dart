import 'package:device_info_plus/device_info_plus.dart';

import 'package:bhf_player/core/utils/helpers_functions/device_id.dart';
import 'package:equatable/equatable.dart';

abstract class DeviceInfoStrategy extends Equatable {
  final DeviceInfoPlugin deviceInfo;

  const DeviceInfoStrategy(this.deviceInfo);

  Future<String> getRawDeviceInfo();

  Future<String> getUserDeviceId() async {
    final combinedInfo = await getRawDeviceInfo();
    final hash = calculateSlizedHash(combinedInfo);
    return formatId(hash);
  }

  @override
  List<Object?> get props =>[deviceInfo];
}
