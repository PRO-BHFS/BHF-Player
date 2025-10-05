import 'package:bhf_player/core/utils/app_constants/keys.dart';
import 'package:bhf_player/core/utils/mixins/file_size_helper/file_size_helper.dart';
import 'package:bhf_player/features/video_info/domain/entities/video_meta_data_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:path/path.dart' as p;

class VideoEntity extends Equatable with FileSizeHelper {
  final String filename;
  final int courseId;
  final String? encryptedPath;
  final String? decryptedPath;
  final String? thumbnailPath;
  final VideoMetadata metadata;
  final int bytesSize;
  final String? videoHash;

  const VideoEntity({
    required this.filename,
    required this.courseId,
    required this.encryptedPath,
    required this.bytesSize,
    required this.metadata,
    this.decryptedPath,
    this.thumbnailPath,
    this.videoHash
  });

  factory VideoEntity.encrypted({
    required String filename,
    required int courseId,
    required String encryptedPath,
    required int bytesSize,
  }) => VideoEntity(
    filename: filename,
    courseId: courseId,
    encryptedPath: encryptedPath,
    bytesSize: bytesSize,
    metadata: const VideoMetadata(),
  );

  VideoEntity copyWith({
    String? filename,
    int? courseId,
    String? encryptedPath,
    String? decryptedPath,
    int? bytesSize,
    String? thumbnailPath,
    String? videoHash,
    VideoMetadata? metadata,
  }) => VideoEntity(
    filename: filename ?? this.filename,
    courseId: courseId ?? this.courseId,
    encryptedPath: encryptedPath ?? this.encryptedPath,
    decryptedPath: decryptedPath ?? this.decryptedPath,
    bytesSize: bytesSize ?? this.bytesSize,
    thumbnailPath: thumbnailPath ?? this.thumbnailPath,
    metadata: metadata ?? this.metadata,
    videoHash: videoHash?? this.videoHash
  );

  String get videoTitle => p.basename(decryptedPath ?? filename);
  double get sizeInBytes => bytesSize.toDouble();
  String get sizeInMegaBytes => (bytesSize / (1024 * 1024)).toStringAsFixed(2);

  Map<String, dynamic> toMap() {
    return {
      Keys.courseId: courseId,
      Keys.title: filename,
      Keys.localPath: encryptedPath,
      Keys.decryptedBytes: decryptedPath,
      Keys.thumbnailPath: thumbnailPath,
      Keys.size: bytesSize,
      Keys.videoMetadata: metadata.toMap(),
    };
  }

  factory VideoEntity.fromMap(Map<String, dynamic> map) {
    return VideoEntity(
      filename: map[Keys.title] as String,
      courseId: map[Keys.courseId] as int,
      encryptedPath: map[Keys.localPath] as String?,
      decryptedPath: map[Keys.decryptedBytes] as String?,
      thumbnailPath: map[Keys.thumbnailPath] as String?,
      bytesSize: map[Keys.size] as int,
      metadata: VideoMetadata.fromMap(map[Keys.videoMetadata] ?? {}),
    );
  }

  @override
  List<Object?> get props => [courseId, videoHash];
}
