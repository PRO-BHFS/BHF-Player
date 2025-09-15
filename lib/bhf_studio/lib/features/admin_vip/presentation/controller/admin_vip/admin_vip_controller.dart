import 'package:bhf_player/bhf_studio/lib/features/admin_vip/presentation/domain/entities/admin_vip_storage.dart';
import 'package:bhf_player/bhf_studio/lib/features/admin_vip/presentation/domain/entities/feature_vip.dart';
import 'package:bhf_player/bhf_studio/lib/features/admin_vip/presentation/domain/entities/subscription_code.dart';
import 'package:bhf_player/bhf_studio/lib/features/device_id/presentation/controller/device_id/device_id.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'admin_vip_state.dart';

class AdminVipCubit extends HydratedCubit<AdminVipState> {
  AdminVipCubit(this._adminIdCubit)
    : super(AdminVipInitialState(AdminVipStorage.empty()));

  final AdminDeviceIdCubit _adminIdCubit;

  AdminVipStorage get _adminInfo => state.adminInfo;
  int get _currentBalance => state.adminInfo.balance;

  bool _isCodeExpired(String code) {
    if (!_adminInfo.expiredCodes.contains(code)) return false;

    emit(AdminVipErrorState("لا يمكنك استخدام كود منتهي الصلاحية", _adminInfo));

    return true;
  }

  void redeemSubscriptionCode(String fullCode) {
    if (_isCodeExpired(fullCode)) return;

    final subscriptionCode = SubscriptionCode(
      fullCode: fullCode,
      adminId: _adminIdCubit.adminId,
    );

    if (!subscriptionCode.isCodeValid()) {
      emit(
        AdminVipErrorState(
          "هذا الكود غير صحيح او غير صالح للاستخدام",
          _adminInfo,
        ),
      );
      return;
    }

    final newCoins = subscriptionCode.coins;
    final message = "تم اضافة $newCoins نقاط الى رصيدك بنجاح";
    emit(
      AdminVipCoinsAddedState(
        message,
        _adminInfo.copyWith(balance: _currentBalance + newCoins),
      ),
    );
  }

  bool _canUseFeature(FeatureVip feature) {
    if (_adminInfo.canAffordFeature(feature.price)) return true;

    emit(
      AdminVipErrorState(
        "غير مسموح بتشغيل هذه الميزة, الرجاء الاشتراك وتجديد باقتك",
        _adminInfo,
      ),
    );
    return false;
  }

  void useFeature(FeatureVip feature) {
    if (!_canUseFeature(feature)) return;

    final newBalance = _currentBalance - feature.price;

    emit(AdminVipUpdatedState(_adminInfo.copyWith(balance: newBalance)));

    feature.run();
  }

  @override
  AdminVipState? fromJson(Map<String, dynamic> json) {
    return AdminVipLoadedState(AdminVipStorage.fromJson(json));
  }

  @override
  Map<String, dynamic>? toJson(AdminVipState state) => _adminInfo.toJson();
}
