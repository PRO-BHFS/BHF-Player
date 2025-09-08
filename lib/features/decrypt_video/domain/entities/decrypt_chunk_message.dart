import 'dart:isolate';
import 'dart:typed_data';
import 'package:equatable/equatable.dart';

class DecryptChunkMessage extends Equatable {
  final SendPort responsePort;
  final Uint8List encryptedChunk;
  final String keyBase64;
  final String ivBase64;
  final int chunkIndex;

  const DecryptChunkMessage({
    required this.encryptedChunk,
    required this.keyBase64,
    required this.ivBase64,
    required this.responsePort,
    required this.chunkIndex,
  });
  
  @override
  List<Object?> get props =>[responsePort,encryptedChunk,keyBase64,ivBase64,chunkIndex];
}
