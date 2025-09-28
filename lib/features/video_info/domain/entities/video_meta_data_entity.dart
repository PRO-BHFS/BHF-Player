import 'dart:convert';

import 'package:bhf_player/core/utils/app_constants/keys.dart';
import 'package:bhf_player/core/utils/mixins/file_size_helper/file_size_helper.dart';
import 'package:equatable/equatable.dart';

class VideoMetadata extends Equatable with FileSizeHelper {
  final String? path;
  final String? title;
  final String? author;
  final String? date;
  final double? frameRate;
  final int? width;
  final int? height;
  final int? fileSize;
  final Duration? duration;
  final double? aspectRatio;

  const VideoMetadata({
    this.path,
    this.title,
    this.author,
    this.date,
    this.frameRate,
    this.width,
    this.height,
    this.fileSize,
    this.duration,
    this.aspectRatio,
  });

  /// التحقق من وجود معلومات أساسية
  bool get hasBasicInfo =>
      title != null ||
      duration != null ||
      width != null ||
      date != null ||
      height != null;

  @override
  List<Object?> get props => [
    path,
    title,
    author,
    duration,
    fileSize,
    date,
    frameRate,
    width,
    height,
  ];

  Map<String, dynamic> toMap() {
    return {
      Keys.localPath: path,
      Keys.title: title,
      Keys.author: author,
      Keys.date: date,
      Keys.frameRate: frameRate,
      Keys.width: width,
      Keys.height: height,
      Keys.size: fileSize,
      Keys.duration: duration?.inMilliseconds,
      Keys.aspectRatio: aspectRatio,
    };
  }

  factory VideoMetadata.fromMap(Map<String, dynamic> map) {
    return VideoMetadata(
      path: map[Keys.localPath] as String?,
      title: map[Keys.title] as String?,
      author: map[Keys.author] as String?,
      date: map[Keys.date] as String?,
      frameRate: map[Keys.frameRate] as double?,
      width: map[Keys.width] as int?,
      height: map[Keys.height] as int?,
      fileSize: map[Keys.size] as int?,
      duration: Duration(milliseconds: map[Keys.duration] as int? ?? 0),
      aspectRatio: map[Keys.aspectRatio] as double?,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoMetadata.fromJson(String source) =>
      VideoMetadata.fromMap(json.decode(source) as Map<String, dynamic>);
}
