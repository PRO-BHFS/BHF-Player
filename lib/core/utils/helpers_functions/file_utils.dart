import 'dart:io';
import 'dart:typed_data';

import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

Future<String?> pickFile() async {
  final result = await FilePicker.platform.pickFiles();

  return result?.files.single.path;
}

void deleteFile(String path) async {
  try {
    final file = File(path);
    if (await file.exists()) await file.delete();
  } catch (e, stack) {
    e.logError(stack: stack);
  }
}

Future<String?> saveFile({required Uint8List bytes}) async {
  try {
    final result = await FilePicker.platform.saveFile(
      fileName: "backup.bhf",
      bytes: bytes,
      dialogTitle: "Save Backup File As",
    );

    if (result == null) throw Exception("لم يتم الحفظ");
    return result;
  } catch (e, stack) {
    e.logError(stack: stack);
    return null;
  }
}

int calculateTotalChunks({
  required num fileSizeInBytes,
  num chunkSize = AppConsts.sizeBytesOfChunk,
}) {
  return (fileSizeInBytes / chunkSize).ceil();
}

Future<String?> extractVideoThumbnail(VideoEntity video) async {
  try {
    if (video.decryptedPath == null) throw const FileSystemException();
    final file = File(video.decryptedPath!);
    if (await file.exists() == false) throw const FileSystemException();

    final dir = await getApplicationDocumentsDirectory();
    final imagesDir = Directory(join(dir.path, AppConsts.imagesFolder));

    if (await imagesDir.exists() == false) {
      await imagesDir.create(recursive: true);
    }

    final imageSavePath = join(imagesDir.path, "${video.videoTitle}.png");

    final thumbnailPath = await VideoThumbnail.thumbnailFile(
      video: video.decryptedPath!,
      imageFormat: ImageFormat.PNG,
      maxWidth: 200,
      timeMs: 3000,
      thumbnailPath: imageSavePath,
    );


    return thumbnailPath;
  } catch (e, stack) {
    e.logError(stack: stack);
    return null;
  }
}

double? calculateAspectRatio({int? width, int? height}) {
  if (width == null || height == null || height == 0) return null;

  final ratio = width / height;

  // نسب شائعة
  if ((ratio - 16 / 9).abs() < 0.01) return 16 / 9;
  if ((ratio - 4 / 3).abs() < 0.01) return 4 / 3;
  if ((ratio - 21 / 9).abs() < 0.01) return 21 / 9;
  if ((ratio - 1).abs() < 0.01) return 1 / 1;

  return width / height;
}
