import 'dart:io';
import 'dart:typed_data';

import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:file_picker/file_picker.dart';

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
