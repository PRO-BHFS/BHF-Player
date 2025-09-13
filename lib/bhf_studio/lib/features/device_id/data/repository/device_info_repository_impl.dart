import 'package:bhf_player/bhf_studio/lib/core/utils/enums/enums.dart';
import 'package:bhf_player/bhf_studio/lib/features/device_id/data/strategy/device_info_android.dart';
import 'package:bhf_player/bhf_studio/lib/features/device_id/data/strategy/device_info_ios.dart';
import 'package:bhf_player/bhf_studio/lib/features/device_id/data/strategy/device_info_other.dart';
import 'package:bhf_player/bhf_studio/lib/features/device_id/data/strategy/device_info_strategy.dart';
import 'package:bhf_player/bhf_studio/lib/features/device_id/data/strategy/device_info_windows.dart';
import 'package:bhf_player/bhf_studio/lib/features/device_id/domain/repository/device_info_repository.dart';
import 'package:device_info_plus/device_info_plus.dart';

class AdminDeviceInfoRepositoryImpl implements AdminDeviceInfoRepository {
  final DeviceInfoPlugin deviceInfo;

  AdminDeviceInfoRepositoryImpl(this.deviceInfo);

  @override
  Future<String> getDeviceId() async {
    final AdminDeviceInfoStrategy deviceInfoStrategy;

    deviceInfoStrategy = switch (OperationSystem.currentOS()) {
      OperationSystem.android => DeviceInfoAndroid(deviceInfo),
      OperationSystem.windows => DeviceInfoWindows(deviceInfo),
      OperationSystem.ios => DeviceInfoIos(deviceInfo),
      OperationSystem.other => DeviceInfoOther(deviceInfo),
    };
    return await deviceInfoStrategy.getUserDeviceId();
  }
}
