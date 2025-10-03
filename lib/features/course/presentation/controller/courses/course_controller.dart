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
  CourseCubit() : super(const CourseInitial({}));

  int? _currentSelectedCourseId;
  CourseEntity? _currentCourse;

  int? get currentSelectedCourseId => _currentSelectedCourseId;
  CourseEntity? get currentCourse => _currentCourse;

  bool get isSelectedCourse => _currentSelectedCourseId != null;
  bool get isNotSelectedCourse => !isSelectedCourse;

  Future<void> loadCourses() async {
    emit(CourseLoading(state.courses));
    final courses = await GetIt.I<GetAllCoursesUseCase>().call();
    final newCourses = {...state.courses, ...courses};
    emit(CourseLoaded(state.copyWith(courses: newCourses)));
    await _getRecentSelectedCourse();
  }

  Future<int> addCourse(CourseEntity course) async {
    final courseId = await GetIt.I<AddCourseUseCase>().call(course);

    _currentCourse = course.copyWith(id: courseId);
    final newCourses = {...state.courses, _currentCourse!};

    emit(CourseAdded(state.copyWith(courses: newCourses), course));
    emit(CourseLoaded(state.courses));

    await selectCourse(courseId);
    return courseId;
  }

  Future<void> updateCourse(CourseEntity newCourse) async {
    final updatedCourses = {...state.courses};
    updatedCourses.remove(newCourse);
    updatedCourses.add(newCourse);
    _currentCourse = newCourse;

    await GetIt.I<UpdateCourseUseCase>().call(newCourse);
    emit(CourseUpdated(state.copyWith(courses: updatedCourses)));

    await selectCourse(newCourse.id);
  }

  Future<void> removeCourse(CourseEntity? course) async {
    if (course == null || course.id == null) return;

    await GetIt.I<DeleteCourseUseCase>().call(course.id);

    final updatedCourses = {...state.courses};
    updatedCourses.remove(course);

    emit(CourseRemoved(state.copyWith(courses: updatedCourses), course));

    await selectCourse(updatedCourses.firstOrNull?.id);
    await _resetCoursesId();
  }

  Future<void> selectCourse(int? courseId) async {
    if (courseId == null) return;
    _currentSelectedCourseId = courseId;

    _currentCourse = state.courses.firstWhere((c) => c.id == courseId);

    if (_currentCourse == null) return;

    emit(CourseSelected(state.courses, courseId: _currentSelectedCourseId));
  }

  Future<void> _getRecentSelectedCourse() async {
    if (_currentSelectedCourseId == null ||
        state.courses.any((c) => c.id == _currentSelectedCourseId)) {
      return;
    }

    
    await selectCourse(_currentSelectedCourseId);
  }

  // إذا لم توجد دورات، يعيد عداد الـ ID إلى الصفر

  Future<void> _resetCoursesId() async {
    if (state.courses.isEmpty) {
      await GetIt.I<ResetCoursesIdUseCase>().call();
    }
  }

  @override
  CourseState? fromJson(Map<String, dynamic> json) {
    try {
      emit(CourseLoading(state.courses));
      final courseStorage = UserCourseStorage.fromJson(json);
      final updatedCourse = {...state.courses, ...courseStorage.courses};

      final newState = CourseLoaded(state.copyWith(courses: updatedCourse));

      emit(newState);

      Future.microtask(() {
        _currentSelectedCourseId = courseStorage.recentSelectedCourse;
        _getRecentSelectedCourse();
      });

      return newState;
    } catch (_) {
      return const CourseInitial({});
    }
  }

  @override
  Map<String, dynamic>? toJson(CourseState state) {
    final courseStorage = UserCourseStorage(
      courses: state.courses,
      recentSelectedCourse: _currentSelectedCourseId,
    );
    return courseStorage.toJson();
  }
}
