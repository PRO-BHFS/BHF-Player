import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bhf_player/core/exceptions/app_exceptions/app_exceptions.dart';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/prepared_temp_file.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:path_provider/path_provider.dart';

Future<PreparedTempFile> prepareTempFile({
  required VideoEntity video,
  required String? encryptionCode,
}) async {
  RandomAccessFile? raf;
  try {
    if (video.encryptedPath == null || encryptionCode == null) {
      throw DecryptionException(S.current.decryption_problem);
    }
    final videoDir = await getApplicationDocumentsDirectory();

    final resultVideoPath = videoDir.joinPath(
      separator: '/',
      filename: video.filename,
      fileExtension: AppConsts.originalVideoExtension,
    );

    final resultFile = File(resultVideoPath);

    final inputFile = File(video.encryptedPath!);
    if (!await inputFile.exists()) {
      throw DecryptionException(S.current.file_not_found);
    }

    raf = await inputFile.open();
    final ivBytes = await raf.read(16);

    if (!_isVideoIvCorrect(ivBytes.length)) {
      throw DecryptionException(S.current.iv_extraction_error);
    }

    final ivBase64 = _extractIvBase64(ivBytes);
    final keyBase64 = generateKeyBase64(encryptionCode);
    return PreparedTempFile(
      resultFile: resultFile,
      ivBase64: ivBase64,
      keyBase64: keyBase64,
    );
  } catch (e) {
    rethrow;
  } finally {
    await raf?.close();
  }
}

bool _isVideoIvCorrect(num ivLength) => (ivLength == 16);

String _extractIvBase64(Uint8List? ivBytes) {
  try {
    if (ivBytes == null) {
      throw DecryptionException(S.current.decryption_problem);
    }

    return base64Encode(ivBytes);
  } catch (e, trace) {
    e.logError(stack: trace, methodName: "_extractIvBase64");

    rethrow;
  }
}

String generateKeyBase64(String encryptionCode) {
  try {
    final key = encrypt.Key.fromUtf8(
      encryptionCode.padRight(32, '0').substring(0, 32),
    );

    return key.base64;
  } catch (e, trace) {
    e.logError(stack: trace, methodName: "generateKeyBase64");

    rethrow;
  }
}
