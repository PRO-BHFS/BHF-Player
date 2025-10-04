import 'dart:io';

extension FilesPaths on Directory {
  String joinPath({
    required String filename,
    required String fileExtension,
    required String separator,
  }) {
    return "$path$separator$filename.$fileExtension";
  }
}
