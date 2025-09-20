import 'dart:convert';
import 'dart:typed_data';

import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:equatable/equatable.dart';

class DecryptedVideo extends Equatable {
  final String title;
  final String courseId;
  final String localPath;
  final int size;
  final Duration duration;
  final Uint8List thumbnailBytes;

  const DecryptedVideo({
    required this.title,
    required this.courseId,
    required this.localPath,
    required this.size,
    required this.duration,
    required this.thumbnailBytes,
  });

  Map<String, dynamic> toMap() {
    return {
      Keys.title: title,
      Keys.courseId: courseId,
      Keys.localPath: localPath,
      Keys.size: size,
      Keys.duration: duration.inMilliseconds,
      Keys.thumbnailBytes: base64Encode(thumbnailBytes),
    };
  }

  factory DecryptedVideo.fromMap(Map<String, dynamic> map) {
    return DecryptedVideo(
      title: map[Keys.title] as String,
      courseId: map[Keys.courseId] as String,
      localPath: map[Keys.localPath] as String,
      size: map[Keys.size] as int,
      duration: Duration(milliseconds: map[Keys.duration] as int),
      thumbnailBytes: base64Decode(map[Keys.thumbnailBytes] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory DecryptedVideo.fromJson(String source) =>
      DecryptedVideo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [courseId, localPath];
}
