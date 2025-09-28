import 'package:bhf_player/features/video_info/domain/entities/video_meta_data_entity.dart';

abstract class VideoInfoRepository {
  Future<VideoMetadata> getVideoMetadata(String videoPath);
}
