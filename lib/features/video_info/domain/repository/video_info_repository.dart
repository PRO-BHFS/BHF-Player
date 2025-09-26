import 'package:bhf_player/features/video_info/domain/entities/video_info_entity.dart';

abstract class VideoInfoRepository {
  Future<VideoInfoEntity> getVideoInfo(String videoPath);

}
