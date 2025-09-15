import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/keys/keys_names.dart';
import 'package:bhf_player/bhf_studio/lib/features/device_id/domain/usecases/get_device_id_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AdminDeviceIdCubit extends HydratedCubit<String> {
  AdminDeviceIdCubit() : super('');
  String get adminId => state;

  Future<void> initDeviceId() async {
    if (state.isNotEmpty) return;
    await createNewId();
  }

  Future<void> createNewId() async {
    final userId = await GetIt.I<GetAdminDeviceIdUsecase>().call();
    emit(userId);
  }

  @override
  String? fromJson(Map<String, dynamic> json) {
    return json[Keys.adminId] as String?;
  }

  @override
  Map<String, dynamic>? toJson(String state) {
    return {Keys.adminId: state};
  }
}
