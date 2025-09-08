// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String filename;
  final String? encryptedPath;
  final String? decryptedPath;
  final int bytesSize;

  const VideoEntity({
    required this.filename,
    required this.encryptedPath,
    required this.bytesSize,
    this.decryptedPath,
  });

  VideoEntity copyWith({
    String? filename,
    String? encryptedPath,
    String? decryptedPath,
    int? bytesSize,
  }) => VideoEntity(
    filename: filename ?? this.filename,
    encryptedPath: encryptedPath ?? this.encryptedPath,
    decryptedPath: decryptedPath ?? this.decryptedPath,
    bytesSize: bytesSize ?? this.bytesSize,
  );

  double get sizeInBytes => bytesSize.toDouble();


  @override
  List<Object?> get props => [filename, encryptedPath, decryptedPath];
}
