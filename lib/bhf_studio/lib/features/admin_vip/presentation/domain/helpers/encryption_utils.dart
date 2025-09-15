import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

String generateSalt(String id) {
  final hash = createHash(id);
  String salt = createHash(hash);
  salt = salt.replaceAll(salt[0].toLowerCase(), salt[salt.length-1].toLowerCase());

  return salt.substring(0, 32);
}

String createDeviceBasedKey(String id) {
  final salt = generateSalt(id);
  final secret = "$salt:$id";
  final hash = createHash(secret);
  return hash.substring(0, 32); // استخدم أول 32 حرف كمفتاح
}

encrypt.Encrypter getEncrypter(String id) {
  final key = encrypt.Key.fromUtf8(createDeviceBasedKey(id));
  return encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.gcm));
}

String createHash(String secret) {
  final bytes = utf8.encode(secret);
  final digest = sha256.convert(bytes);

  return digest.toString();
}

String createEndId(String hashText) {
  const patternSize = 3;
  final clippedText = hashText.substring(0, patternSize * 3);
  final length = clippedText.length;
  String endId = "";
  for (int i = 0; i < length; i++) {
    endId += clippedText[i];
    if ((i + 1) % patternSize == 0 && (i + 1) != length) endId += '-';
  }
  return endId.toUpperCase();
}



