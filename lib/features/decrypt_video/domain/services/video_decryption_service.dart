import 'dart:io';

import 'package:bhf_player/core/errors/app_exceptions/app_exceptions.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';
import 'package:path/path.dart' as p;

import 'logic/video_decryptor.dart';

class VideoDecryptionService {
  VideoDecryptionService._();
  static final instance = VideoDecryptionService._();

  factory VideoDecryptionService() => instance;

  Future<VideoEntity?> pickEncryptedVideo() async {
    final path = await pickFile();
    if (path == null) return null;

    final fileSize = await File(path).length();

    return VideoEntity(
      filename: p.basename(path),
      encryptedPath: path,
      bytesSize: fileSize,
    );
  }

  bool isUserAuthorized(CourseEntity? course, String userId) {
    return (course == null) ? false : course.password.isUserAuthorized(userId);
  }

  Future<VideoEntity> decrypt(VideoDecryptor decryptor) async {
    try {
      final isDecrypted = await decryptor.startDecryption();

      if (!isDecrypted) throw DecryptionException("فشل في عملية فك التشفير");

      if (decryptor.resultVideoPath.isEmpty) {
        throw DecryptionException("مسار الفيديو المفكوك غير صالح");
      }

      return decryptor.video.copyWith(decryptedPath: decryptor.resultVideoPath);
    } catch (e, trace) {
      e.logError(stack: trace, methodName: "decrypt");
      rethrow;
    }
  }
}
