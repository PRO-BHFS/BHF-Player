import 'dart:io';
import 'dart:isolate';
import 'package:bhf_player/core/errors/app_exceptions/app_exceptions.dart';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/file_read_request.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/file_read_response.dart';
import 'package:bhf_player/generated/l10n.dart';

Stream<FileReadResponse> readFileStreamedInIsolate(String filePath) {
  return Stream<FileReadResponse>.multi((controller) async {
    final receivePort = ReceivePort();

    final fileReadRequest = FileReadRequest(
      path: filePath,
      sendPort: receivePort.sendPort,
    );

    await Isolate.spawn(readFileChunkStream, fileReadRequest);

    try {
      await for (final FileReadResponse message in receivePort) {
        if (message.isRecievedChunk) {
          controller.add(message);
        } else if (message.isDone) {
          break;
        } else if (message.hasError) {
          controller.addError(FileReadException(S.current.file_read_error));
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

Future<void> readFileChunkStream(FileReadRequest requestMessage) async {
  final sendPort = requestMessage.sendPort;
  const chunkSize = AppConsts.sizeBytesOfChunk;
  RandomAccessFile? randomAccessFile;
  try {
    final file = File(requestMessage.path);
    randomAccessFile = await file.open();
    await randomAccessFile.setPosition(AppConsts.encryptedDataStart);

    while (true) {
      final chunkBytes = await randomAccessFile.read(chunkSize);
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
