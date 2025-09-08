import 'dart:io';

import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:file_picker/file_picker.dart';

Future<String?> pickFile() async {
  final result = await FilePicker.platform.pickFiles();

  return result?.files.single.path;
}

void deleteFile(String path) async {
  try {
    final file = File(path);
    if (await file.exists()) await file.delete();
  } catch (e) {
    //  print(e);
  }
}

int calculateTotalChunks({
  required num fileSizeInBytes,
   num chunkSize = AppConsts.sizeBytesOfChunk,
}) {
  return (fileSizeInBytes / chunkSize).ceil();
}
