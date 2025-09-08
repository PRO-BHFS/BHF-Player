import 'dart:io';

class PreparedTempFile {
  final File resultFile;
  final String ivBase64;
  final String keyBase64;

  String get resultFilePath => resultFile.path;

  PreparedTempFile({
    required this.resultFile,
    required this.ivBase64,
    required this.keyBase64,
  });
}
