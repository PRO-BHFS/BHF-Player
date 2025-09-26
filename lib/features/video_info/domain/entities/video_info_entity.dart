import 'package:bhf_player/core/utils/helpers_functions/file_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_video_info/flutter_video_info.dart';

/// كيان معلومات الفيديو الذي يحتوي على جميع البيانات المهمة للفيديو
class VideoInfoEntity extends Equatable {
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

  const VideoInfoEntity({
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

  factory VideoInfoEntity.fromSource(VideoData data) {
    /// millisecond
    Duration duration = Duration(milliseconds: data.duration?.toInt() ?? 0);
    return VideoInfoEntity(
      path: data.path,
      title: data.title,
      author: data.author,
      date: data.date,
      frameRate: data.framerate,
      width: data.width,
      height: data.height,
      fileSize: data.filesize,
      duration: duration,
      aspectRatio: calculateAspectRatio(data.width, data.height),
    );
  }

  factory VideoInfoEntity.empty() {
    return const VideoInfoEntity();
  }

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
}
