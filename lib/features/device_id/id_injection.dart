

import 'package:bhf_player/core/utils/setup_app/service_locator/service_locator.dart';
import 'package:device_info_plus/device_info_plus.dart';


import 'data/repository/device_info_repository_impl.dart';
import 'domain/repository/device_info_repository.dart';
import 'domain/usecases/get_device_id_usecase.dart';

void setupUserIdLocators() {

  s1.registerLazySingleton(() => DeviceInfoPlugin());
  s1.registerLazySingleton<DeviceInfoRepository>(
    () => DeviceInfoRepositoryImpl(s1()),
  );
  s1.registerLazySingleton(() => GetDeviceIdUsecase(s1()));

}
