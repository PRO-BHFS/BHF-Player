import 'dart:convert';
import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants_exports.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'generate_smart_password_state.dart';

class GenerateSmartPasswordCubit extends Cubit<GenerateSmartPasswordState> {
  GenerateSmartPasswordCubit() : super(GenerateSmartPasswordInitial());

  String _encryptSmartPassword({
    required String encryptionCode,
    required String id,
  }) {
    try {
      final key = encrypt.Key.fromUtf8(AppConsts.derivenKey);
      final iv = encrypt.IV.fromLength(16);
      final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.gcm),
      );
      final dataToEncrypt = '$encryptionCode|$id';
      final encrypted = encrypter.encrypt(dataToEncrypt, iv: iv);

      final raw = '${encrypted.base64}:${base64.encode(iv.bytes)}';
      return base64UrlEncode(utf8.encode(raw));
    } catch (e) {
      rethrow;
    }
  }

  void generateSmartPassword({
    required String encryptionCode,
    required String deviceUserId,
  }) {
    try {
      final smartPassword = _encryptSmartPassword(
        encryptionCode: encryptionCode,
        id: deviceUserId,
      );
      emit(
        GenerateSmartPasswordSuccessfully(
          message: "تم توليد الباسورد بنجاح",
          smartPassword: smartPassword,
        ),
      );
    } catch (e) {
      emit(GenerateSmartPasswordError("حدث خطأ اثناء توليد الباسورد"));
      if (kDebugMode) print(e);
    }
  }
}
