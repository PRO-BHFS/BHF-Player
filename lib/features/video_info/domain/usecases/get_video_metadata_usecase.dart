import 'package:bhf_player/features/video_info/domain/entities/video_meta_data_entity.dart';
import 'package:bhf_player/features/video_info/domain/repository/video_info_repository.dart';

class GetVideoMetadataUseCase {
  final VideoInfoRepository _repository;

  const GetVideoMetadataUseCase(this._repository);

  Future<VideoMetadata> call(String? videoPath) async {
    if (videoPath == null) return const VideoMetadata();

    return await _repository.getVideoMetadata(videoPath);
  }
}
