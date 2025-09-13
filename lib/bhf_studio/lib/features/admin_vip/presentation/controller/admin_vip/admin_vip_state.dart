import 'package:bhf_player/bhf_studio/lib/features/admin_vip/presentation/domain/entities/admin_vip_storage.dart';

sealed class AdminVipState {
  final AdminVipStorage adminInfo;

  AdminVipState(this.adminInfo);
}

class AdminVipInitialState extends AdminVipState {
  AdminVipInitialState(super.adminInfo);
}

class AdminVipLoadedState extends AdminVipState {
  AdminVipLoadedState(super.adminInfo);
}

class AdminVipUpdatedState extends AdminVipState {
  AdminVipUpdatedState(super.adminInfo);
}

class AdminVipErrorState extends AdminVipState {
  final String message;
  AdminVipErrorState(this.message, super.adminInfo);
}
