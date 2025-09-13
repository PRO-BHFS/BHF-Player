import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/keys/keys_names.dart';

class AdminVipStorage {
  final int balance;
  final Set<String> expiredCodes;

  AdminVipStorage({required this.balance, required this.expiredCodes});

  AdminVipStorage.empty() : balance = 0, expiredCodes = {};

  AdminVipStorage copyWith({int? balance, Set<String>? expiredCodes}) =>
      AdminVipStorage(
        balance: balance ?? this.balance,
        expiredCodes: expiredCodes ?? this.expiredCodes,
      );

  bool isAuthurizated(int featurePrice) =>
      balance > 0 || featurePrice <= balance;


  factory AdminVipStorage.fromJson(Map<String, dynamic> json) {
    final savedBalance = (json[Keys.balance] as int?) ?? 0;
    final savedExpiredCodes = (json[Keys.expiredCodes] as List<String>?) ?? [];
    return AdminVipStorage(
      balance: savedBalance,
      expiredCodes: savedExpiredCodes.toSet(),
    );
  }


  Map<String, dynamic> toJson() {
    return {Keys.balance: balance, Keys.expiredCodes: expiredCodes.toList()};
  }
}
