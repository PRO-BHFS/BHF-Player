import 'package:equatable/equatable.dart';
import 'package:path/path.dart' as p;

class VideoEntity extends Equatable {
  final String filename;
  final int courseId;
  final String? encryptedPath;
  final String? decryptedPath;
  final String? thumbnailPath;
  final double? aspectRatio;
  final int bytesSize;

  const VideoEntity({
    required this.filename,
    required this.courseId,
    required this.encryptedPath,
    required this.bytesSize,
     this.aspectRatio,
    this.decryptedPath,
    this.thumbnailPath,
  });

  VideoEntity copyWith({
    String? filename,
    int? courseId,
    String? encryptedPath,
    String? decryptedPath,
    int? bytesSize,
    double? aspectRatio
  }) => VideoEntity(
    filename: filename ?? this.filename,
    courseId: courseId ?? this.courseId,
    encryptedPath: encryptedPath ?? this.encryptedPath,
    decryptedPath: decryptedPath ?? this.decryptedPath,
    bytesSize: bytesSize ?? this.bytesSize,
    aspectRatio: aspectRatio??this.aspectRatio
  );

  String get videoTitle => p.basename(decryptedPath ?? filename);
  double get sizeInBytes => bytesSize.toDouble();
  String get sizeInMegaBytes => (bytesSize / (1024 * 1024)).toStringAsFixed(2);

  @override
  List<Object?> get props => [filename, encryptedPath, decryptedPath, courseId];
}
