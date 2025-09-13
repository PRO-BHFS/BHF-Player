
import 'package:bhf_player/bhf_studio/lib/features/device_id/domain/repository/device_info_repository.dart';

class GetAdminDeviceIdUsecase {
  final AdminDeviceInfoRepository _deviceInfoRepository;

  GetAdminDeviceIdUsecase(this._deviceInfoRepository);

  Future<String> call() async {
    return await _deviceInfoRepository.getDeviceId();
  }
}