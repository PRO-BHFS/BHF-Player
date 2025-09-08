import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class DecryptChunkResult extends Equatable {
  final int chunkIndex;
  final Uint8List? decryptedBytes;
  final String? error;

  const DecryptChunkResult({
    required this.chunkIndex,
     this.decryptedBytes,
    this.error,
  });

  bool get hasError => error != null || decryptedBytes == null;
@override
  List<Object?> get props => [chunkIndex, decryptedBytes, error];
}
