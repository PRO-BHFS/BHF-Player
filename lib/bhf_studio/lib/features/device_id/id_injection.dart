
import 'package:get_it/get_it.dart';

import 'data/repository/device_info_repository_impl.dart';
import 'domain/repository/device_info_repository.dart';
import 'domain/usecases/get_device_id_usecase.dart';


void setupAdminIdLocators(GetIt s1) {
//   s1.registerLazySingleton(() => DeviceInfoPlugin());
  s1.registerLazySingleton<AdminDeviceInfoRepository>(
    () => AdminDeviceInfoRepositoryImpl(s1()),
  );
  s1.registerLazySingleton(() => GetAdminDeviceIdUsecase(s1()));
}
