import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/video.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/repositories/video_repository.dart';

class PrepareVideoesUseCase {
  final VideoRepository videoRepository;

  PrepareVideoesUseCase( this.videoRepository);

  Future<List<Video>> call(List<String?> paths) async {
   return await videoRepository.prepareVideoListFromPaths(paths);
  }

}