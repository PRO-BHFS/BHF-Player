import 'package:bhf_player/features/video_info/domain/entities/video_info_entity.dart';
import 'package:bhf_player/features/video_info/domain/repository/video_info_repository.dart';
import 'package:bhf_player/features/video_info/data/datasources/video_info_datasource.dart';

/// تنفيذ مستودع معلومات الفيديو
class VideoInfoRepositoryImpl implements VideoInfoRepository {
  final VideoInfoDataSource _dataSource;

  VideoInfoRepositoryImpl(this._dataSource);

  @override
  Future<VideoInfoEntity> getVideoInfo(String videoPath) async {
    return await _dataSource.getVideoInfo(videoPath);
  }

}
