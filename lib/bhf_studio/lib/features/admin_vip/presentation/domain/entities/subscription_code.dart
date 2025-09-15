import 'dart:convert';

import 'package:bhf_player/bhf_studio/lib/features/admin_vip/presentation/domain/helpers/encryption_utils.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class SubscriptionCode {
  final String fullCode;
  final String adminId;
  String? _codeId;
  int? _coins;

  SubscriptionCode({
    required this.fullCode,
    required this.adminId,
    String? codeId,
    int? coins,
  }) : _coins = coins,
       _codeId = codeId;

  SubscriptionCode copyWith({
    String? fullCode,
    String? adminId,
    String? codeId,
    int? coins,
  }) {
    return SubscriptionCode(
      fullCode: fullCode ?? this.fullCode,
      adminId: adminId ?? this.adminId,
      codeId: codeId ?? _codeId,
      coins: coins ?? _coins,
    );
  }

  String? get codeId {
    if (_codeId != null) return _codeId!;

    decryptFullCode();
    return _codeId;
  }

  int get coins {
    if (_coins != null) return _coins!;

    decryptFullCode();
    return _coins!;
  }

  bool _isIdsEquals() => adminId == codeId;

  bool _hasCoins() => coins < 0;

  bool isCodeValid() => _isIdsEquals() && _hasCoins();

  void decryptFullCode() {
    try {
      final decoded = utf8.decode(base64Url.decode(fullCode));
      final ivAndEncryptedParts = decoded.split("::");
      if (ivAndEncryptedParts.length != 2) throw const FormatException();

      final iv = encrypt.IV.fromBase64(ivAndEncryptedParts[0]);
      final encrypted = ivAndEncryptedParts[1];
      final decrypted = getEncrypter(adminId).decrypt64(encrypted, iv: iv);
      final idAndCoinsParts = decrypted.split('|');
      if (idAndCoinsParts.length != 2) throw const FormatException();

      final codeInId = idAndCoinsParts[0];
      final coins = idAndCoinsParts[1].toInt;

      _codeId = codeInId;
      _coins = coins;
    } catch (e, stack) {
      e.logError(stack: stack, methodName: "decryptFullCode");
    }
  }
}
