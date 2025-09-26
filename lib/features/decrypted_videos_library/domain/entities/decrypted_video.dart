import 'dart:convert';

import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';

class DecryptedVideo extends VideoEntity {
  final Duration duration;

  const DecryptedVideo({
    required this.duration,
    required super.aspectRatio,
    required super.thumbnailPath,
    required super.filename,
    required super.courseId,
    required super.bytesSize,
     super.decryptedPath,
     super.encryptedPath,
  });

  factory DecryptedVideo.fromVideo(
    VideoEntity video, {
    required Duration duration,
    required double? aspectRatio,
    required String? thumbnailPath,
  }) {
    return DecryptedVideo(
      duration: duration,
      thumbnailPath: thumbnailPath,
      courseId: video.courseId,
      filename: video.filename,
      encryptedPath: video.encryptedPath,
      decryptedPath: video.decryptedPath,
      bytesSize: video.bytesSize,
      aspectRatio: aspectRatio
    );
  }

  Map<String, dynamic> toMap() {
    return {
      Keys.title: filename,
      Keys.courseId: courseId,
      Keys.localPath: decryptedPath,
      Keys.size: bytesSize,
      Keys.duration: duration.inMilliseconds,
      Keys.thumbnailPath: thumbnailPath,
      Keys.aspectRatio: aspectRatio
    };
  }

  factory DecryptedVideo.fromMap(Map<String, dynamic> map) {
    return DecryptedVideo(
      filename: map[Keys.title] as String,
      courseId: map[Keys.courseId] as int,
      encryptedPath: map[Keys.localPath] as String,
      bytesSize: map[Keys.size] as int,
      duration: Duration(milliseconds: map[Keys.duration] as int),
      thumbnailPath: map[Keys.thumbnailPath] as String,
      aspectRatio: map[Keys.aspectRatio] as double?
    );
  }

  String toJson() => json.encode(toMap());

  factory DecryptedVideo.fromJson(String source) =>
      DecryptedVideo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [courseId, decryptedPath];
}
