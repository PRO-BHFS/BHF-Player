import 'dart:io';

import 'package:bhf_player/core/exceptions/app_exceptions/app_exceptions.dart';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/mixins/single_runner/single_runner.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/process_progress.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';
import 'package:bhf_player/features/decrypt_video/domain/services/logic/video_decryptor.dart';
import 'package:bhf_player/features/decrypt_video/domain/services/video_decryption_service.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/controller/decrypted_videos/decrypted_video_controller.dart';
import 'package:bhf_player/features/video_info/domain/usecases/get_video_metadata_usecase.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;

import 'video_decryption_state.dart';

class VideoDecryptionCubit extends Cubit<VideoDecryptionState>
    with SingleRunner {
  VideoDecryptionCubit(this._decrtptedVideoCubit, this._courseCubit)
    : super(const VideoDecryptionInitial());
  final DecryptedVideoCubit _decrtptedVideoCubit;
  final CourseCubit _courseCubit;
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

  Future<void> selectSharedFile(String path) async {
    final file = File(path);
    try {
      if (_courseCubit.currentSelectedCourseId == null) throw Exception();

      if (await file.exists() == false) {
        throw PathNotFoundException(path, const OSError());
      }

      _selectedVideo = VideoEntity.encrypted(
        filename: p.basename(path),
        courseId: _courseCubit.currentSelectedCourseId!,
        encryptedPath: path,
        bytesSize: await file.length(),
      );

      emit(VideoDecryptionImported(_selectedVideo!));
    } catch (e, stack) {
      e.logError(stack: stack);
    }
  }

  Future<void> _pickVideo() async {
    try {
      _processProgress.emit = emit;
      final currentCourseId = _courseCubit.currentSelectedCourseId;
      if (currentCourseId == null) return;
      final video = await _service.pickEncryptedVideo(currentCourseId);
      if (video == null) return;

      _selectedVideo = video;
      emit(VideoDecryptionImported(_selectedVideo!));
    } on InvalidFileExtensionException catch (_) {
      _handleError(
        S.current.file_extension_required(AppConsts.encryptedfileExtension),
      );
    } catch (_) {
      _handleError(S.current.file_read_error);
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
        _handleError(S.current.password_incorrect);
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

      final videoInfo = await GetIt.I<GetVideoMetadataUseCase>().call(
        resultVideo.decryptedPath ?? "",
      );

      if (videoInfo.duration == null) throw Exception();
      _selectedVideo = resultVideo.copyWith(metadata: videoInfo);

      emit(VideoDecryptionCompleted(_selectedVideo!));

      await _decrtptedVideoCubit.addVideo(_selectedVideo!);
    } catch (_) {
      _handleError(S.current.cannot_play_video);
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
    emit(const VideoDecryptionInitial());
  }
}
