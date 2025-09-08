import 'dart:isolate';

import 'package:equatable/equatable.dart';

class FileReadRequest extends Equatable {
  final String path;
  final SendPort sendPort;

  const FileReadRequest({
    required this.path,
    required this.sendPort,
  });

  @override
  List<Object?> get props => [path, sendPort];
}
