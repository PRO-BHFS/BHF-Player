import 'dart:convert';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/foundation.dart';

class CoursePassword {
  String _fullPassword;
  _DecryptedPassword? _cachedDecryptedPassword;

  CoursePassword(this._fullPassword);

  CoursePassword copyWith(String? passwordText) {
    if (passwordText != null) _cachedDecryptedPassword = null;
    return CoursePassword(passwordText ?? _fullPassword);
  }

  bool isUserAuthorized(String userId) => passwordInId == userId;

  String get fullPassword => _fullPassword;

  String? get encryptionCode => _decryptSmartPassword().encryptionCode;

  String? get passwordInId => _decryptSmartPassword().passwordInId;

  bool get isEncrptionCodeEmpty =>
      encryptionCode == null || encryptionCode!.isEmpty;

  bool get isIdEmpty => passwordInId == null || passwordInId!.isEmpty;

  bool get isPasswordValid => !isIdEmpty || !isEncrptionCodeEmpty;

  _DecryptedPassword _decryptSmartPassword() {
    final rawPassword = utf8.decode(base64Url.decode(_fullPassword));
    if (_cachedDecryptedPassword != null) return _cachedDecryptedPassword!;

    if (rawPassword.isEmpty || !rawPassword.contains(':')) {
      return const _DecryptedPassword();
    }

    final parts = rawPassword.split(':');
    if (parts.length != 2) return const _DecryptedPassword();

    try {
      final encryptedText = parts[0];
      final ivBytes = base64.decode(parts[1]);

      final key = encrypt.Key.fromUtf8(AppConsts.derivenKey);
      final iv = encrypt.IV(ivBytes);
      final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.gcm),
      );

      final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
      final values = decrypted.split('|');

      if (values.length != 2) return const _DecryptedPassword();

      _cachedDecryptedPassword = _DecryptedPassword(
        encryptionCode: values[0],
        passwordInId: values[1],
      );

      return _cachedDecryptedPassword!;
    } catch (e) {
      if (kDebugMode) print(e);
      return const _DecryptedPassword();
    }
  }

  Map<String, dynamic> toJson() {
    return {DbColumns.fullPassword: _fullPassword};
  }

  factory CoursePassword.fromJson(Map<String, dynamic> json) {
    return CoursePassword(json[DbColumns.fullPassword] ?? "");
  }

  @override
  String toString() {
    return "Password: $_fullPassword";
  }
}

class _DecryptedPassword {
  final String? encryptionCode;
  final String? passwordInId;

  const _DecryptedPassword({this.encryptionCode, this.passwordInId});
}
