import 'package:bhf_player/bhf_studio/lib/features/encryption_video/data/repositories/video_repository_impl.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/repositories/video_repository.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/usecases/prepare_videoes_use_case.dart';
import 'package:get_it/get_it.dart';

void setupEncryptionVideo(GetIt s1) {
  s1.registerLazySingleton<VideoRepository>(() => VideoRepositoryImpl());
  s1.registerLazySingleton(() => PrepareVideoesUseCase(s1()));

}
