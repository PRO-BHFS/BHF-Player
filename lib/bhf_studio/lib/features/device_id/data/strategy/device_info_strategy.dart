import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/amin_device_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';

abstract class AdminDeviceInfoStrategy extends Equatable {
  final DeviceInfoPlugin deviceInfo;

  const AdminDeviceInfoStrategy(this.deviceInfo);

  Future<String> getRawDeviceInfo();

  Future<String> getUserDeviceId() async {
    final combinedInfo = await getRawDeviceInfo();
    final hash = calculateSlizedHash(combinedInfo);
    return formatId(hash);
  }

  @override
  List<Object?> get props =>[deviceInfo];
}
