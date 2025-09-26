import 'package:bhf_player/features/video_info/domain/entities/video_info_entity.dart';
import 'package:bhf_player/features/video_info/domain/repository/video_info_repository.dart';

class GetVideoInfoUseCase {
  final VideoInfoRepository _repository;

  const GetVideoInfoUseCase(this._repository);

  Future<VideoInfoEntity> call(String? videoPath) async {
    if (videoPath == null) return VideoInfoEntity.empty();

    return await _repository.getVideoInfo(videoPath);
  }
}
