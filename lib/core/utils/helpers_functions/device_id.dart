import 'dart:convert';

import 'package:crypto/crypto.dart';

String calculateSlizedHash(String combinedInfo) {
  final bytes = utf8.encode(combinedInfo);
  final sha256Digest = sha256.convert(bytes);
  final hexString = sha256Digest.toString();
  final sliced = hexString;
  return sliced;
}

String formatId(String hash) {
  final buffer = StringBuffer();
  const partSize = 4;
  const partsCount = 4;
  const totalLength = partSize * partsCount;
  
  for (int i = 0; i < totalLength; i++) {
    buffer.write(hash[i]);

    if ((i + 1) % partSize == 0 && i != (totalLength - 1)) {
      buffer.write("-");
    }
  }

  return buffer.toString().toUpperCase();
}
