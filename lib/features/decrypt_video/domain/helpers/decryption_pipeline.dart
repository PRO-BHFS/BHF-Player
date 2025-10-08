import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:bhf_player/core/exceptions/app_exceptions/app_exceptions.dart';
import 'package:bhf_player/core/utils/helpers_functions/platform_utils/platform_utils.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/decrypt_chunk_message.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/prepared_temp_file.dart';
import 'package:bhf_player/features/decrypt_video/domain/services/workers/decrypt_chunk_isolate.dart';
import 'package:bhf_player/features/decrypt_video/domain/services/workers/file_reader_isolate.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:pool/pool.dart';

Future<void> runDecryptionPipeline({
  required String encryptedPath,
  required int numChunks,
  required SendPort sendPort,
  required PreparedTempFile preparedFileInfo,
  required List<Isolate> isolates,
  required List<Uint8List?> decryptedChunks,
  required Completer<void> completer,
}) async {
  RandomAccessFile? raf;
  IOSink? output;
  try {
    raf = await File(encryptedPath).open();
    output = preparedFileInfo.resultFile.openWrite();

    await processChunks(
      encryptedPath: encryptedPath,
      preparedFileInfo: preparedFileInfo,
      sendPort: sendPort,
      isolates: isolates,
    );

    await completer.future;
    for (final chunk in decryptedChunks) {
      if (chunk == null) {
        throw DecryptionException(S.current.final_file_write_failed);
      }
      output.add(chunk);
    }
  } catch (e) {
    rethrow;
  } finally {
    await output?.flush();
    await output?.close();
    await raf?.close();
  }
}

Future<void> processChunks({
  required String encryptedPath,
  required SendPort sendPort,
  required PreparedTempFile preparedFileInfo,
  required List<Isolate> isolates,
}) async {
  try {
    final pool = Pool(countIsolates());
    final stream = readFileStreamedInIsolate(encryptedPath);
    int currentIndex = 0;
    await for (final response in stream) {
      await pool.withResource(() async {
        final chunkIndex = currentIndex++;
        final chunk = response.chunkData;

        if (chunk == null) return;

        final message = DecryptChunkMessage(
          encryptedChunk: chunk,
          keyBase64: preparedFileInfo.keyBase64,
          ivBase64: preparedFileInfo.ivBase64,
          responsePort: sendPort,
          chunkIndex: chunkIndex,
        );

        final isolate = await Isolate.spawn(decryptChunkInIsolate, message);
        isolates.add(isolate);
      });
    }
  } catch (e) {
    rethrow;
  }
}
