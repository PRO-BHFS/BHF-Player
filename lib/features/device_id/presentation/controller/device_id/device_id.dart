import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/features/device_id/domain/usecases/get_device_id_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class DeviceIdCubit extends HydratedCubit<String> {
  DeviceIdCubit() : super('');

  String get userId => state;

  Future<void> initDeviceId() async {
    if (state.isNotEmpty) return;
    await createNewId();
  }

  Future<void> createNewId() async {
    final userId = await GetIt.I<GetDeviceIdUsecase>().call();
    emit(userId);
  }

  @override
  String? fromJson(Map<String, dynamic> json) {
    return json[Keys.id] as String?;
  }

  @override
  Map<String, dynamic>? toJson(String state) {
    return {Keys.id: state};
  }
}
