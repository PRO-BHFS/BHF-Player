import 'dart:isolate';
import 'dart:typed_data';

import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/chunk_response_data.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/encrypt_chunk_message.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

  // (تشغيل isolate لتشفير chunk)
Future<ChunkResponseData> encryptChunkUsingIsolate(
    EncryptChunkMessage message,
  ) async {
    final responsePort = ReceivePort();

    final updatedMessage = message.copyWith(
      responsePort: responsePort.sendPort,
    );

    await Isolate.spawn(encryptChunkIsolate, updatedMessage);

    final result = await responsePort.first as ChunkResponseData;
    responsePort.close();

    return result;
  }

  // isolate: لتشفير chunk واحد
void encryptChunkIsolate(EncryptChunkMessage message) {
    final chunkIndex = message.chunkIndex;
    final key = encrypt.Key.fromBase64(message.keyBase64);
    final ivBytes = encrypt.IV.fromBase64(message.ivBase64).bytes;

    ivBytes.last = (ivBytes.last + chunkIndex) % 256;
    final updatedIV = encrypt.IV(ivBytes);

    try {
      final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.ctr, padding: null),
      );

      final encryptedBytes = Uint8List.fromList(
        encrypter.encryptBytes(message.videoBytesChunk, iv: updatedIV).bytes,
      );

      final result = ChunkResponseData(
        chunkIndex: chunkIndex,
        encryptedBytes: encryptedBytes,
      );

      message.responsePort?.send(result);
    } catch (e) {
      final ressult = ChunkResponseData(
        chunkIndex: chunkIndex,
        error: e.toString(),
      );

      message.responsePort?.send(ressult);
    }
  }
