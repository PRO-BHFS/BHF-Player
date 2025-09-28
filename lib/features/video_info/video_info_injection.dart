import 'package:bhf_player/core/utils/setup_app/service_locator/service_locator.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:bhf_player/features/video_info/data/datasources/video_info_datasource.dart';
import 'package:bhf_player/features/video_info/data/repository/video_info_repository_impl.dart';
import 'package:bhf_player/features/video_info/domain/repository/video_info_repository.dart';
import 'package:bhf_player/features/video_info/domain/usecases/get_video_metadata_usecase.dart';

/// حقن التبعيات لميزة معلومات الفيديو
void setupVideoInfo() {
  // Data Source
  s1.registerLazySingleton<VideoInfoDataSource>(
    () => VideoInfoDataSource(FlutterVideoInfo()),
  );

  // Repository
  s1.registerLazySingleton<VideoInfoRepository>(
    () => VideoInfoRepositoryImpl(s1<VideoInfoDataSource>()),
  );

  // Use Cases
  s1.registerLazySingleton<GetVideoMetadataUseCase>(
    () => GetVideoMetadataUseCase(s1<VideoInfoRepository>()),
  );
}
