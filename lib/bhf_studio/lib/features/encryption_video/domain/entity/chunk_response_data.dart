import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class ChunkResponseData extends Equatable {
  const ChunkResponseData({
    required this.chunkIndex,
    this.encryptedBytes,
    this.error,
  });

  final int chunkIndex;
  final Uint8List? encryptedBytes;
  final String? error;

  bool get hasError => encryptedBytes == null || error != null;

  @override
  List<Object?> get props => [chunkIndex, encryptedBytes, error];
}
