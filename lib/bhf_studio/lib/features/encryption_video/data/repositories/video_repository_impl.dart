import 'dart:io';

import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/video.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/repositories/video_repository.dart';

class VideoRepositoryImpl extends VideoRepository {
  @override
  Future<Video?> createVideoFromPath(String? path) async {
    if (path == null) return null;
    if (!await isFileExists(path)) return null;

    final file = File(path);
    final bytesSize = await file.length();

    return Video(filePath: path, bytesSize: bytesSize);
  }

  @override
  Future<List<Video>> prepareVideoListFromPaths(List<String?> paths) async {
    final videos = <Video>[];

    for (final path in paths) {
      final video = await createVideoFromPath(path);
      if (video == null) continue;
      videos.add(video);
    }
    return videos;
  }
}
