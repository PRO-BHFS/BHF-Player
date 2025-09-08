import 'dart:io';

import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants.dart';
import 'package:file_picker/file_picker.dart';

Future<List<String>?> pickVideoFiles() async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.media,
  );
  if (result == null) return null;

  final paths = <String>[];
  for (final path in result.paths) {
    if (path != null) paths.add(path);
  }
  return paths;
}

Future<String?> pickFile() async {
  final result = await FilePicker.platform.pickFiles();

  return result?.files.single.path;
}

Future<bool> isFileExists(String path) async {
  final file = File(path);
  return await file.exists();
}

void deleteFile(String path) async {
  try {
    final file = File(path);
    if (await file.exists()) await file.delete();
  } catch (e) {
    //  print(e);
  }
}

Future<String?> chooseOutputDirectory() async {
  try {
    return await FilePicker.platform.getDirectoryPath();
  } catch (_) {
    rethrow;
  }
}

int calculateTotalChunks({
  required num fileSizeInBytes,
  num chunkSize = AppConsts.sizeBytesOfChunk,
}) {
  return (fileSizeInBytes / chunkSize).ceil();
}

String fromBytesToMegaFormatted(int bytesSize) {
  final sizeInMega = bytesSize / AppConsts.sizeMegaInBytes;

return  sizeInMega.toStringAsFixed(1);
}
