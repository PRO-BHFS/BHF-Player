import 'dart:typed_data';
import 'package:bhf_player/features/decrypt_video/domain/entities/decrypt_chunk_message.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/decrypt_chunk_result.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

encrypt.IV generateChunkIV(int index, String ivBase64) {
  final originalBytes = encrypt.IV.fromBase64(ivBase64).bytes;
  final copiedBytes = Uint8List.fromList(originalBytes);

  copiedBytes.last = (copiedBytes.last + index) % 256;
  return encrypt.IV(copiedBytes);
}

void decryptChunkInIsolate(DecryptChunkMessage message) {
  final encryptedChunk = message.encryptedChunk;
  final responsePort = message.responsePort;
  final chunkIndex = message.chunkIndex;
  final key = encrypt.Key.fromBase64(message.keyBase64);
  final iv = generateChunkIV(chunkIndex, message.ivBase64);

  final encrypter = encrypt.Encrypter(
    encrypt.AES(key, mode: encrypt.AESMode.ctr, padding: null),
  );

  try {
    final decryptedBytes = Uint8List.fromList(
      encrypter.decryptBytes(encrypt.Encrypted(encryptedChunk), iv: iv),
    );

    final resultMessage = DecryptChunkResult(
      chunkIndex: chunkIndex,
      decryptedBytes: decryptedBytes,
    );

    responsePort.send(resultMessage);
  } catch (e) {
    final errorResultMessage = DecryptChunkResult(
      chunkIndex: chunkIndex,
      error: e.toString(),
    );
    responsePort.send(errorResultMessage);
  }
}
