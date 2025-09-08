import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/video.dart';

abstract class VideoRepository {
  Future<List<Video>> prepareVideoListFromPaths(List<String?> paths);

  Future<Video?> createVideoFromPath(String? path);
}
