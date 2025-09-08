import 'dart:io';
import 'dart:isolate';

import 'package:bhf_player/bhf_studio/lib/core/errors/app_exceptions/app_exceptions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants_exports.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/file_read_request.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/file_read_response.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/video.dart';

// قراءة الملف على شكل Stream داخل isolate (بدون استهلاك الذاكرة)
Stream<FileReadResponse> readFileStreamedInIsolate({
    required Video video,
  }) {
    return Stream<FileReadResponse>.multi((controller) async {
      final receivePort = ReceivePort();

      final fileReadRequest = FileReadRequest(
        path: video.filePath,
        sendPort: receivePort.sendPort,
      );

      await Isolate.spawn(_readFileChunksIsolateStream, fileReadRequest);

      try {
        await for (final FileReadResponse message in receivePort) {
          if (message.isRecievedChunk) {
            controller.add(message);
          } else if (message.isDone) {
            break;
          } else if (message.hasError) {
            controller.addError(EncryptionException('حدث خطأ اثناء التشفير'));
            break;
          }
        }
      } catch (e) {
        controller.addError(e);
      } finally {
        receivePort.close();
        await controller.close();
      }
    });
  }


  // isolate: يقرأ الملف chunk-by-chunk ويرسله للـ Stream
 Future<void> _readFileChunksIsolateStream(
    FileReadRequest message,
  ) async {
    final filePath = message.path;
    final sendPort = message.sendPort;
    RandomAccessFile? randomAccessFile;

    try {
      final file = File(filePath);
      randomAccessFile = await file.open();

      while (true) {
        final chunkBytes = await randomAccessFile.read(
          AppConsts.sizeBytesOfChunk,
        );
        if (chunkBytes.isEmpty) break;

        final resultMessage = FileReadResponse(chunkData: chunkBytes);

        sendPort.send(resultMessage);
      }
    } catch (e) {
      final errorResultMessage = FileReadResponse(error: e.toString());

      sendPort.send(errorResultMessage);
    } finally {
      const resultMessage = FileReadResponse(isDone: true);

      sendPort.send(resultMessage);
      await randomAccessFile?.close();
    }
  }
