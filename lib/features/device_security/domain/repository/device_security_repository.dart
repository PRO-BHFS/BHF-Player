import 'package:bhf_player/features/device_security/domain/entities/entities/device_security_info.dart';

abstract class DeviceSecurityRepository {
  Future<DeviceSecurityInfo> getDeviceSecurityStatus();
}
