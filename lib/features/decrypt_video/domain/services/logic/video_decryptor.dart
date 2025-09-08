import 'dart:async';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:bhf_player/core/errors/app_exceptions/app_exceptions.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/decrypt_chunk_result.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/prepared_temp_file.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/process_progress.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';
import 'package:bhf_player/features/decrypt_video/domain/helpers/decryption_pipeline.dart';
import 'package:bhf_player/features/decrypt_video/domain/helpers/decryptor_initializer.dart';

class VideoDecryptor {
  VideoDecryptor({
    required this.video,
    required this.course,
    required this.processProgress,
  });

  final VideoEntity video;
  final CourseEntity course;
  final ProcessProgress processProgress;

  final _receivePort = ReceivePort();
  final _decryptionCompleter = Completer<void>();
  final List<Isolate> _chunksIsolates = [];

  late PreparedTempFile _preparedVideoInfo;
  late int _numChunks;
  late List<Uint8List?> _decryptedChunks;

  String get resultVideoPath => _preparedVideoInfo.resultFilePath;

  Future<bool> startDecryption() async {
    try {
      _numChunks = calculateTotalChunks(
        fileSizeInBytes: video.sizeInBytes - 16,
      );
      processProgress.startLoading(_numChunks);

      _preparedVideoInfo = await prepareTempFile(
        encryptedPath: video.encryptedPath,
        encryptionCode: course.password.encryptionCode,
      );

      _decryptedChunks = List<Uint8List?>.filled(_numChunks, null);

      _listenToDecryptionResults();

      processProgress.incrementCompleted();

      await runDecryptionPipeline(
        encryptedPath: video.encryptedPath!,
        isolates: _chunksIsolates,
        numChunks: _numChunks,
        preparedFileInfo: _preparedVideoInfo,
        sendPort: _receivePort.sendPort,
        completer: _decryptionCompleter,
        decryptedChunks: _decryptedChunks,
      );

      if (!course.password.isPasswordValid) return false;

      return true;
    } catch (e, trace) {
      e.logError(stack: trace, methodName: "startDecryption");
      return false;
    } finally {
      processProgress.finishProcess();
      _dispose();
    }
  }

  void _listenToDecryptionResults() {
    try {
      _receivePort.listen((message) {
        if (message is! DecryptChunkResult) {
          _decryptionCompleter.completeError(
            DecryptionException("رسالة غير صالحة"),
          );
          return;
        } else if (message.hasError) {
          _decryptionCompleter.completeError(
            DecryptionException(
              "فشل فك التشفير للشريحة رقم ${message.chunkIndex}: ${message.error}",
            ),
          );
          return;
        }

        _decryptedChunks[message.chunkIndex] = message.decryptedBytes;

        processProgress.incrementCompleted();

        if (processProgress.isFinished) _decryptionCompleter.complete();
      });
    } catch (e, trace) {
      e.logError(stack: trace, methodName: "_listenToDecryptionResults");
      _decryptionCompleter.completeError(
        DecryptionException("حدث خطأ أثناء تشغيل الفيديو"),
      );
    }
  }

  void _dispose() {
    for (var isolate in _chunksIsolates) {
      isolate.kill(priority: Isolate.immediate);
    }
    _chunksIsolates.clear();

    _receivePort.close();
  }
}
