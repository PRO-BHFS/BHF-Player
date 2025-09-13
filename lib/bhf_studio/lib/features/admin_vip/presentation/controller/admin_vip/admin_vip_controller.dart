import 'package:bhf_player/bhf_studio/lib/features/admin_vip/presentation/domain/entities/admin_vip_storage.dart';
import 'package:bhf_player/bhf_studio/lib/features/admin_vip/presentation/domain/entities/feature_vip.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'admin_vip_state.dart';

class AdminVipCubit extends HydratedCubit<AdminVipState> {
  AdminVipCubit() : super(AdminVipInitialState(AdminVipStorage.empty()));

  bool _isCodeExpired(String code) {
    if (!state.adminInfo.expiredCodes.contains(code)) return false;

    emit(
      AdminVipErrorState(
        "لا يمكنك استخدام كود منتهي الصلاحية",
        state.adminInfo,
      ),
    );

    return true;
  }

  void redeemCode(String code) {
    if (_isCodeExpired(code)) return;

    // Decryption Code To Extract Admin ID & Coins
  }

  bool _hasAuthurized(FeatureVip feature) {
    if (state.adminInfo.isAuthurizated(feature.price)) return true;
    emit(
      AdminVipErrorState(
        "غير مسموح بتشغيل هذه الميزة, الرجاء الاشتراك وتجديد باقتك",
        state.adminInfo,
      ),
    );
    return false;
  }

  void useFeatureVIP(FeatureVip feature) {
    if (!_hasAuthurized(feature)) return;

    final currentBalance = state.adminInfo.balance;
    final newBalance = currentBalance - feature.price;

    emit(AdminVipUpdatedState(state.adminInfo.copyWith(balance: newBalance)));

    feature.run();
  }

  @override
  AdminVipState? fromJson(Map<String, dynamic> json) {
    return AdminVipLoadedState(AdminVipStorage.fromJson(json));
  }

  @override
  Map<String, dynamic>? toJson(AdminVipState state) => state.adminInfo.toJson();
}
