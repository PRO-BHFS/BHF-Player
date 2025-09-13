import 'package:bhf_player/bhf_studio/lib/core/utils/mixins/single_runner/single_runner.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/process_progress.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';
import 'package:bhf_player/features/decrypt_video/domain/services/logic/video_decryptor.dart';
import 'package:bhf_player/features/decrypt_video/domain/services/video_decryption_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'video_decryption_state.dart';

class VideoDecryptionCubit extends Cubit<VideoDecryptionState>
    with SingleRunner {
  VideoDecryptionCubit() : super(VideoDecryptionInitial());

  final states = <VideoDecryptionState>[];

  final _service = VideoDecryptionService();

  VideoEntity? _selectedVideo;

  final _processProgress = ProcessProgress();
  ProcessProgress get progressProcess => _processProgress;
  double get progressValue => _processProgress.progress;

  bool get isVideoSelected => _selectedVideo != null;
  bool get isVideoNotSelected => !isVideoSelected;

  String? get selectedVideoPath => _selectedVideo?.encryptedPath;
  String get selectedVideoName => _selectedVideo?.filename ?? "";

  Future<void> _pickVideo() async {
    try {
      _processProgress.emit = emit;

      final video = await _service.pickEncryptedVideo();
      if (video == null) return;

      _selectedVideo = video;
      emit(VideoDecryptionImported(_selectedVideo!));
    } catch (_) {
      _handleError("حدث خطأ اثناء اختيار ملف");
    }
  }

  Future<void> pickVideo() async {
    await runIfNotBusy(_pickVideo);
  }

  Future<void> playVideo({
    required String userId,
    required CourseEntity? selectedCourse,
  }) async {
    try {
      if (states.any((s) => s is VideoDecryptionCompleted)) return;

      if (!_service.isUserAuthorized(selectedCourse!, userId)) {
        _handleError("الباسورد غير صحيح");
        return;
      }

      if (_selectedVideo?.decryptedPath != null) {
        emit(VideoDecryptionCompleted(_selectedVideo!));
        return;
      }

      final decryptor = VideoDecryptor(
        video: _selectedVideo!,
        course: selectedCourse,
        processProgress: _processProgress,
      );

      final resultVideo = await _service.decrypt(decryptor);
      _selectedVideo = resultVideo;
      emit(VideoDecryptionCompleted(_selectedVideo!));
    } catch (_) {
      _handleError("لايمكنك تشغيل هذا الفيديو");
    }
  }

  void _handleError(String errorMessage) {
    emit(VideoDecryptionFailure(errorMessage));
  }

  void addState(VideoDecryptionState state) {
    states.add(state);
  }

  void resetState() {
    states.clear();
    emit(VideoDecryptionInitial());
  }
}
