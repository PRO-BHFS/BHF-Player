import 'package:bhf_player/core/utils/extensions/error_extensions.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:bhf_player/features/course/domain/entities/user_course_storage.dart';
import 'package:bhf_player/features/course/domain/usecases/add_course.dart';
import 'package:bhf_player/features/course/domain/usecases/delete_course.dart';
import 'package:bhf_player/features/course/domain/usecases/get_all_courses.dart';
import 'package:bhf_player/features/course/domain/usecases/reset_courses_id.dart';
import 'package:bhf_player/features/course/domain/usecases/update_course.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_state.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CourseCubit extends HydratedCubit<CourseState> {
  CourseCubit() : super(CourseInitial(UserCourseStorage.empty()));

  CourseEntity? _currentCourse;

  int? get currentSelectedCourseId => state.courseStorage.recentSelectedCourse;
  CourseEntity? get currentCourse => _currentCourse;
  Set<CourseEntity> get courses => state.courseStorage.courses;

  bool get isSelectedCourse => state.courseStorage.recentSelectedCourse != null;
  bool get isNotSelectedCourse => !isSelectedCourse;

  Future<void> loadBackupCourses() async {
    final backupCourses = await GetIt.I<GetAllCoursesUseCase>().call();

    final newCourses = {...backupCourses, ...courses};

    emit(CourseLoaded(state.courseStorage.copyWith(courses: newCourses)));
  }

  Future<int> addCourse(CourseEntity course) async {
    final courseId = await GetIt.I<AddCourseUseCase>().call(course);

    _currentCourse = course.copyWith(id: courseId);
    final newCourses = {...state.courseStorage.courses, _currentCourse!};

    emit(
      CourseAdded(course, state.courseStorage.copyWith(courses: newCourses)),
    );

    selectCourse(courseId);
    return courseId;
  }

  Future<void> updateCourse(CourseEntity newCourse) async {
    final updatedCourses = {...state.courseStorage.courses};
    updatedCourses.remove(newCourse);
    updatedCourses.add(newCourse);
    _currentCourse = newCourse;

    await GetIt.I<UpdateCourseUseCase>().call(newCourse);
    emit(CourseUpdated(state.courseStorage.copyWith(courses: updatedCourses)));

    selectCourse(newCourse.id);
  }

  Future<void> removeCourse(CourseEntity? course) async {
    if (course == null || course.id == null) return;

    await GetIt.I<DeleteCourseUseCase>().call(course.id);

    final updatedCourses = {...state.courseStorage.courses};
    updatedCourses.remove(course);

    emit(
      CourseRemoved(
        course,
        state.courseStorage.copyWith(courses: updatedCourses),
      ),
    );

    selectCourse(updatedCourses.firstOrNull?.id);
    await _resetCoursesId();
  }

  void selectCourse(int? courseId) {
    try {
      if (courseId == null) return;

      _currentCourse = state.courseStorage.courses.firstWhere(
        (c) => c.id == courseId,
        orElse: () => throw Exception(),
      );

      emit(
        CourseSelected(
          state.courseStorage.copyWith(recentSelectedCourse: courseId),
        ),
      );
    } catch (e, stack) {
      e.logError(stack: stack);
    }
  }

  // إذا لم توجد دورات، يعيد عداد الـ ID إلى الصفر
  Future<void> _resetCoursesId() async {
    if (state.courseStorage.courses.isEmpty) {
      await GetIt.I<ResetCoursesIdUseCase>().call();
    }
  }

  @override
  CourseState? fromJson(Map<String, dynamic> json) {
    final storage = UserCourseStorage.fromJson(json);

    emit(CourseLoaded(storage));
    selectCourse(storage.recentSelectedCourse);

    return null;
  }

  @override
  Map<String, dynamic>? toJson(CourseState state) {
    return state.courseStorage.toJson();
  }
}
