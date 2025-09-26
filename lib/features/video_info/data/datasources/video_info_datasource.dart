import 'dart:io';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:bhf_player/features/video_info/domain/entities/video_info_entity.dart';

class VideoInfoDataSource {
  final FlutterVideoInfo _videoInfo;

  VideoInfoDataSource(this._videoInfo);

  Future<VideoInfoEntity> getVideoInfo(String videoPath) async {
    try {
      final file = File(videoPath);
      if (!await file.exists()) {
        throw Exception('ملف الفيديو غير موجود: $videoPath');
      }

      final videoInfo = await _videoInfo.getVideoInfo(videoPath);

      if (videoInfo == null) {
        throw Exception('فشل في جلب معلومات الفيديو');
      }

      return VideoInfoEntity.fromSource(videoInfo);
    } catch (e) {
      return VideoInfoEntity.empty();
    }
  }




 
}
