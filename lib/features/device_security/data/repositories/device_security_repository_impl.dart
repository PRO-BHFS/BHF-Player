import 'package:bhf_player/features/device_security/data/sources/device_security_source.dart';
import 'package:bhf_player/features/device_security/domain/entities/entities/device_security_info.dart';
import 'package:bhf_player/features/device_security/domain/repository/device_security_repository.dart';

class DeviceSecurityRepositoryImpl implements DeviceSecurityRepository {
  final DeviceSecuritySource _securitySource;

  DeviceSecurityRepositoryImpl(this._securitySource);

  @override
  Future<DeviceSecurityInfo> getDeviceSecurityStatus() async {
    final source = await _securitySource.getStatus();

    return DeviceSecurityInfo(
      isRooted: source.isRooted,
      isEmulator: source.isEmulator,
      isJailBroken: source.isJailBroken,
      isOnExternalStorage: source.isOnExternalStorage,
      isUsbDebuggingEnabled: source.isUsbDebuggingEnabled,
      isJailBrokenCustom: source.isJailBrokenCustom,
      isMockLocation: source.isMockLocation,
    );
  }
}
