import 'dart:io';
import 'package:bhf_player/core/utils/helpers_functions/date_utils.dart';
import 'package:bhf_player/core/utils/helpers_functions/file_utils.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:bhf_player/features/video_info/domain/entities/video_meta_data_entity.dart';

class VideoInfoDataSource {
  final FlutterVideoInfo _videoInfo;

  VideoInfoDataSource(this._videoInfo);

  Future<VideoMetadata> getVideoInfo(String videoPath) async {
    try {
      final file = File(videoPath);
      if (!await file.exists()) {
        throw Exception('ملف الفيديو غير موجود: $videoPath');
      }

      final metadata = await _videoInfo.getVideoInfo(videoPath);

      if (metadata == null) return const VideoMetadata();

      final aspectRatio = calculateAspectRatio(
        width: metadata.width,
        height: metadata.height,
      );
      return VideoMetadata(
        title: metadata.title,
        aspectRatio: aspectRatio,
        author: metadata.author,
        date: todayFormatedDate(),
        duration: Duration(milliseconds: metadata.duration?.toInt() ?? 0),
        fileSize: metadata.filesize,
        frameRate: metadata.framerate,
        height: metadata.height,
        width: metadata.width,
        path: metadata.path,
      );
    } catch (e) {
      return const VideoMetadata();
    }
  }
}
