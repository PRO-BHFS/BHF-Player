import 'package:bhf_player/features/device_id/domain/repository/device_info_repository.dart';

class GetDeviceIdUsecase {
  final DeviceInfoRepository _deviceInfoRepository;

  GetDeviceIdUsecase(this._deviceInfoRepository);

  Future<String> call() async {
    return await _deviceInfoRepository.getDeviceId();
  }
}