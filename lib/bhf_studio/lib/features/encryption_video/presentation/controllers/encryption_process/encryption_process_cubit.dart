import 'dart:async';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/mixins/single_runner/single_runner.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/video.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/video_progress_tracker.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/usecases/prepare_videoes_use_case.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/controllers/encryption_process/encryption_process_state.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/services/encryption/encryption_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class EncryptionProcessCubit extends Cubit<EncryptionProcessState>
    with SingleRunner {
  EncryptionProcessCubit() : super(InitialState()) {
    Video.totalVideosBytes = 0;
  }

  final List<Video> _videos = [];
  VideoProgressTracker? _progressTracker;

  final _outputDirectory = ValueNotifier<String?>(null);

  List<Video> get videos => _videos;

  ValueNotifier<String?> get outputDirectory => _outputDirectory;

  double get totalVideosSizes =>
      fromBytesToMegaFormatted(Video.totalVideosBytes).toDouble;

  int get totalVideosCount => _videos.length;

  bool get hasSelectedVideos => videos.isNotEmpty;

  bool get hasOutputDirectory => (outputDirectory.value?.isNotEmpty ?? false);

  bool get isReadyVideo => hasOutputDirectory && hasSelectedVideos;

  VideoProgressTracker get progressTracker =>
      _progressTracker ?? VideoProgressTracker(totalVideos: 0);

  Future<void> _pickVideos() async {
    try {
      final result = await pickVideoFiles();
      if (result == null || result.isEmpty) {
        return;
      }

      await _prepareVideoList(result);

      emit(
        PathsVideosSelected(
          "تم اختيار ${_videos.length} بنجاح",
          _videos.length,
        ),
      );
    } catch (_) {
      _handleError("حدث خطأ اثناء عملية اختيار الملفات");
    }
  }

  Future<void> pickVideos() async {
    await runIfNotBusy(_pickVideos);
  }

  Future<void> selectOutputDirectory() async {
    await runIfNotBusy(_selectOutputDirectory);
  }

  Future<void> _selectOutputDirectory() async {
    try {
      final directoryPath = await chooseOutputDirectory();

      _outputDirectory.value = directoryPath ?? _outputDirectory.value;
      final folderName = _outputDirectory.value?.split('/').last ?? 'المجلد';
      emit(PathsOutputSelected('تم اختيار $folderName بنجاح'));
    } catch (_) {
      _handleError("حدث خطأ أثناء اختيار المجلد");
    }
  }

  Future<void> _prepareVideoList(List<String?> paths) async {
    _videos.clear();
    final videos = await GetIt.I<PrepareVideoesUseCase>().call(paths);
    _videos.addAll(videos);

    Video.totalVideosBytes = 0;

    for (var v in _videos) {
      Video.totalVideosBytes += v.bytesSize;
    }
  }

  Future<void> encryptSelectedVideos(String? encryptionCode) async {
    await runIfNotBusy(
      () async => await _encryptSelectedVideos(encryptionCode),
    );
  }

  Future<void> _encryptSelectedVideos(String? encryptionCode) async {
    if (!isReadyVideo || encryptionCode == null) return;

    _progressTracker = VideoProgressTracker(totalVideos: _videos.length);
    _progressTracker?.startEncryptionProgress();
    emit(EncryptionProcessing());

    try {
      for (final video in _videos) {
        try {
          await encryptVideo(
            encryptionCode: encryptionCode,
            video: video,
            outputPath: outputDirectory.value!,
            progressTracker: _progressTracker!,
          );
        } catch (e) {
          _handleError('حدث خطأ أثناء تشفير ${video.nameWithoutExtension}');
        }
      }

      emit(
        EncryptionCompleted(
          'تم الانتهاء من تشفير جميع الفيديوهات وحفظها في ${_outputDirectory.value}',
        ),
      );
    } catch (e) {
      if (kDebugMode) print(e);
      _handleError('حدث خطأ أثناء تشفير بعض الفيديوهات.');
    }
  }

  void removeVideo(Video video) {
    _videos.remove(video);
    Video.totalVideosBytes -= video.bytesSize;
    emit(VideoListUpdated(_videos.length));
  }

  void _handleError(String error) {
    emit(ErrorsHandler(error));
  }
}
