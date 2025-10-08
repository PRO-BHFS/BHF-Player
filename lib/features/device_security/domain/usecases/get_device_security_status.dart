import 'package:bhf_player/features/device_security/domain/entities/entities/device_security_info.dart';
import 'package:bhf_player/features/device_security/domain/repository/device_security_repository.dart';

class GetDeviceSecurityStatusUseCase {
  final DeviceSecurityRepository _repository;

  GetDeviceSecurityStatusUseCase(this._repository);

  Future<DeviceSecurityInfo> call() {
    return _repository.getDeviceSecurityStatus();
  }
}
