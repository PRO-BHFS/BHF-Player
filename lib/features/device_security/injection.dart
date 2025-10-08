import 'package:bhf_player/core/utils/setup_app/service_locator/service_locator.dart';

import 'data/repositories/device_security_repository_impl.dart';
import 'data/sources/device_security_source.dart';
import 'domain/repository/device_security_repository.dart';
import 'domain/usecases/get_device_security_status.dart';

void injectDeviceSecurity(){
  s1.registerLazySingleton(() => DeviceSecuritySource());
  s1.registerLazySingleton<DeviceSecurityRepository>(
    () => DeviceSecurityRepositoryImpl(s1()),
  );
  s1.registerLazySingleton(() => GetDeviceSecurityStatusUseCase(s1()));

}