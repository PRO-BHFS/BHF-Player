import 'dart:isolate';
import 'dart:typed_data';

class EncryptChunkMessage {
  final Uint8List videoBytesChunk;
  final String keyBase64;
  final String ivBase64;
  final SendPort? responsePort;
  final int chunkIndex;

  EncryptChunkMessage({
    required this.videoBytesChunk,
    required this.keyBase64,
    required this.ivBase64,
    this.responsePort,
    required this.chunkIndex,
  });

  EncryptChunkMessage copyWith({
    Uint8List? videoBytesChunk,
    String? keyBase64,
    String? ivBase64,
    SendPort? responsePort,
    int? chunkIndex,
  }) => EncryptChunkMessage(
    videoBytesChunk: videoBytesChunk ?? this.videoBytesChunk,
    keyBase64: keyBase64 ?? this.keyBase64,
    ivBase64: ivBase64 ?? this.ivBase64,
    chunkIndex: chunkIndex ?? this.chunkIndex,
    responsePort: responsePort?? responsePort
  );
}
