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
  CourseCubit() : super(const CourseInitial([]));

  int? _currentSelectedCourseId;
  CourseEntity? _currentCourse;

  int? get currentSelectedCourseId => _currentSelectedCourseId;
  CourseEntity? get currentCourse => _currentCourse;

  bool get isSelectedCourse => _currentSelectedCourseId != null;
  bool get isNotSelectedCourse => !isSelectedCourse;

  int _getCourseIndex(int? courseId) =>
      courseId == null ? -1 : state.courses.indexWhere((c) => c.id == courseId);

  Future<void> loadCourses() async {
    emit(CourseLoading(state.courses));
    final courses = await GetIt.I<GetAllCoursesUseCase>().call();
    final newCourses = [...state.courses, ...courses];
    emit(CourseLoaded(state.copyWith(courses: newCourses)));
    await _getRecentSelectedCourse();
  }

  Future<void> addCourse(CourseEntity course) async {
    final courseId = await GetIt.I<AddCourseUseCase>().call(course);

    _currentCourse = course.copyWith(id: courseId);
    final newCourses = [...state.courses, _currentCourse!];

    emit(CourseAdded(state.copyWith(courses: newCourses), course));
    emit(CourseLoaded(state.courses));

    await selectCourse(courseId);
  }

  Future<void> updateCourse(CourseEntity newCourse) async {
    final index = _getCourseIndex(newCourse.id);
    if (index == -1) return;

    final updatedCourses = [...state.courses];
    updatedCourses[index] = newCourse;
    _currentCourse = newCourse;

    await GetIt.I<UpdateCourseUseCase>().call(newCourse);
    emit(CourseUpdated(state.copyWith(courses: updatedCourses)));

    await selectCourse(newCourse.id);
  }

  Future<void> removeCourse(int? courseId) async {
    final index = _getCourseIndex(courseId);
    if (index == -1) return;

    await GetIt.I<DeleteCourseUseCase>().call(courseId);

    final updatedCourses = [...state.courses];
    final removedCourse = updatedCourses.removeAt(index);

    emit(CourseRemoved(state.copyWith(courses: updatedCourses), removedCourse));

    await selectCourse(updatedCourses.firstOrNull?.id);
    await _resetCoursesId();
  }

  Future<void> selectCourse(int? courseId) async {
    _currentSelectedCourseId = courseId;
    final index = _getCourseIndex(_currentSelectedCourseId);
    if (index != -1) _currentCourse = state.courses[index];

    emit(CourseSelected(state.courses, courseId: _currentSelectedCourseId));
  }

  Future<void> _getRecentSelectedCourse() async {
    if (_currentSelectedCourseId != null) {
      await selectCourse(_currentSelectedCourseId);
    }
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
      final updatedCourse = [...state.courses, ...courseStorage.courses];

      _currentSelectedCourseId = courseStorage.recentSelectedCourse;
      _getRecentSelectedCourse();

      return CourseLoaded(state.copyWith(courses: updatedCourse));
    } catch (_) {
      return const CourseInitial([]);
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
