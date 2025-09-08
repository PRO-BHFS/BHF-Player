import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class FileReadResponse extends Equatable {
  final Uint8List? chunkData;
  final bool isDone;
  final String? error;

  const FileReadResponse({
    this.chunkData,
     this.isDone=false,
    this.error,
  });

  bool get isRecievedChunk => chunkData != null;
  bool get hasError => error != null;

  @override
  List<Object?> get props => [chunkData, isDone, error];
}
