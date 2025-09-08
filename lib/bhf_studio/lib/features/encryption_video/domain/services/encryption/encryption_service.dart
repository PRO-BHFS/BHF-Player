import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bhf_player/bhf_studio/lib/core/errors/app_exceptions/app_exceptions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/encrypt_chunk_message.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/video.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants_exports.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/video_progress_tracker.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/services/chunk_encryption/chunk_encryption_isolate.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/services/file_reader/file_reader_isolate.dart';
import 'package:flutter/foundation.dart';
import 'package:pool/pool.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:path/path.dart' as p;

Future<void> encryptVideo({
  required Video video,
  required String encryptionCode,
  required String outputPath,
  required VideoProgressTracker progressTracker,
}) async {
  IOSink? fileOut;
  final pool = Pool(countIsolates());
  final totalChunks = calculateTotalChunks(fileSizeInBytes: video.bytesSize);
  final chunksBytesResponses = List<Uint8List?>.filled(totalChunks, null);
    progressTracker.currentVideoName = video.nameWithoutExtension;
    progressTracker.partsPerVideo = totalChunks;

  try {
    final key = encrypt.Key.fromUtf8(
      encryptionCode.padRight(32, '0').substring(0, 32),
    );
    final keyBase64 = key.base64;
    final iv = encrypt.IV.fromSecureRandom(16);
    final ivBase64 = base64Encode(iv.bytes);
    final pathOut = p.join(
      outputPath,
      '${video.nameWithoutExtension}.${AppConsts.fileExtension}',
    );

    fileOut = File(pathOut).openWrite();
    fileOut.add(iv.bytes);

    int currentIndex = 0;
    await progressTracker.incrementCompletedParts();

    await for (final response in readFileStreamedInIsolate(video: video)) {
      if (response.chunkData == null) {
        throw EncryptionException("حدث خطا اثناء التشفير");
      }
      final message = EncryptChunkMessage(
        chunkIndex: currentIndex++,
        videoBytesChunk: response.chunkData!,
        keyBase64: keyBase64,
        ivBase64: ivBase64,
      );

      await pool.withResource(() async {
        final encryptedResponse = await encryptChunkUsingIsolate(message);
        await progressTracker.incrementCompletedParts();

        if (encryptedResponse.hasError) {
          throw EncryptionException('Timeout عند تشفير chunk $currentIndex');
        }
        final index = encryptedResponse.chunkIndex;
        final encryptedBytes = encryptedResponse.encryptedBytes;
        chunksBytesResponses[index] = encryptedBytes;
      });
    }

    for (int i = 0; i < chunksBytesResponses.length; i++) {
      final chunkBytes = chunksBytesResponses[i];
      if (chunkBytes == null) {
        throw EncryptionException(
          'فشل في chunk رقم $i من الفيديو ${video.nameWithoutExtension}',
        );
      }
      fileOut.add(chunkBytes);
    }
  } catch (e) {
  if(kDebugMode)  print(e);
    rethrow;
  } finally {
    await pool.close();
    await fileOut?.flush();
    await fileOut?.close();
  }
}
