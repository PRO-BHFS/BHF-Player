import 'package:bhf_player/core/utils/helpers_functions/file_utils.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';
import 'package:bhf_player/features/decrypted_videos_library/domain/entities/card_course.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/controller/decrypted_videos/decrypted_video_state.dart';
import 'package:bhf_player/features/video_info/domain/usecases/get_video_metadata_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class DecryptedVideoCubit extends HydratedCubit<DecryptedVideoState> {
  DecryptedVideoCubit(this._courseCubit)
    : super(const DecryptedVideoState.empty());

  final CourseCubit _courseCubit;

  Future<void> addCourse(CourseEntity course) async {
    final cardCourse = CardCourse.fromEntityCourse(course);

    emit(state.copyWith(courses: {...state.courses, cardCourse}));
  }

  Future<void> addVideo(VideoEntity video) async {
    final decryptedVideo = await _prepareVideoMetadata(video);
    if (decryptedVideo.metadata.duration == null) return;
    final copiedCourses = {...state.courses};

    final existingCourse = copiedCourses.firstWhere(
      (c) => c.courseId == video.courseId,
    );

    // Create a new videos set to avoid mutating a Set element referenced in another Set
    final updatedVideos = {...existingCourse.videos, decryptedVideo};
    final updatedCourse = existingCourse.copyWith(videos: updatedVideos);

    // Replace the course instance in the set
    copiedCourses
      ..remove(existingCourse)
      ..add(updatedCourse);

    emit(state.copyWith(courses: copiedCourses));
  }

  Future<void> removeCourse(CourseEntity? course) async {
    if (course == null) return;
    final updatedCourses = {...state.courses};

    updatedCourses.remove(CardCourse.fromEntityCourse(course));
    emit(state.copyWith(courses: updatedCourses));
  }

  Future<void> updateCourse(CourseEntity? course) async {
    if (course == null) return;
    final copiedCourses = {...state.courses};
    final cardCourse = copiedCourses.firstWhere((c) => c.courseId == course.id);

    copiedCourses.remove(cardCourse);

    final updatedCourse = cardCourse.copyWith(courseTitle: course.courseTitle);

    copiedCourses.add(updatedCourse);
    emit(state.copyWith(courses: copiedCourses));
  }

  Future<VideoEntity> _prepareVideoMetadata(VideoEntity video) async {
    final videoInfo = await GetIt.I<GetVideoMetadataUseCase>().call(
      video.decryptedPath,
    );

    final thumbnailPath = await extractVideoThumbnail(video);
    final videoHash = await hashingVideo(video);

    final resultVideo = video.copyWith(
      thumbnailPath: thumbnailPath,
      metadata: videoInfo,
      videoHash: videoHash,
    );

    return resultVideo;
  }

  @override
  Map<String, dynamic>? toJson(DecryptedVideoState state) {
    return state.toMap();
  }

  @override
  DecryptedVideoState? fromJson(Map<String, dynamic> json) {
    final state = DecryptedVideoState.fromMap(json);
    final coursesEntities = _courseCubit.courses;
    final coursesIds = coursesEntities
        .map((c) => c.id)
        .whereType<int>()
        .toSet();

    // If courses are not yet loaded, keep hydrated state as-is to avoid losing videos
    if (coursesIds.isEmpty) {
      return state;
    }

    final filteredCourses = state.courses
        .where((cardCourse) => coursesIds.contains(cardCourse.courseId))
        .toSet();

    return state.copyWith(courses: filteredCourses);
  }
}
