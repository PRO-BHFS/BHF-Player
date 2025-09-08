import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:bhf_player/features/course/domain/entities/user_course_storage.dart';
import 'package:bhf_player/features/course/domain/usecases/add_course.dart';
import 'package:bhf_player/features/course/domain/usecases/delete_course.dart';
import 'package:bhf_player/features/course/domain/usecases/reset_courses_id.dart';
import 'package:bhf_player/features/course/domain/usecases/update_course.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_state.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class UserCourseCubit extends HydratedCubit<UserCourseState> {
  UserCourseCubit() : super(CourseInitial());

  final List<CourseEntity> _courses = [];
  int? _currentSelectedCourseId;
  CourseEntity? _currentCourse;

  int? get currentSelectedCourseId => _currentSelectedCourseId;
  CourseEntity? get currentCourse => _currentCourse;

  List<CourseEntity> get courses => _courses;
  bool get isCoursesEmpty => _courses.isEmpty;
  bool get isNotEmpty => !isCoursesEmpty;
  bool get isSelectedCourse => _currentSelectedCourseId != null;
  bool get isNotSelectedCourse => !isSelectedCourse;

  int _getCourseIndex(int? courseId) =>
      courseId == null ? -1 : _courses.indexWhere((c) => c.id == courseId);

  Future<void> addCourse(CourseEntity course) async {
    final courseId = await GetIt.I<AddCourseUseCase>().call(course);

    _currentCourse = course.copyWith(id: courseId);
    _courses.add(_currentCourse!);

    emit(CourseAdded(course: _currentCourse!));
    emit(CourseLoaded(courses: _courses));

    await selectCourse(courseId);
  }

  Future<void> updateCourse(CourseEntity newCourse) async {
    final index = _getCourseIndex(newCourse.id);
    if (index == -1) return;

    _courses[index] = newCourse;
    _currentCourse = newCourse;

    await GetIt.I<UpdateCourseUseCase>().call(newCourse);
    emit(CourseUpdated(course: newCourse));

    await selectCourse(newCourse.id);
  }

  Future<void> removeCourse(int? courseId) async {
    final index = _getCourseIndex(courseId);
    if (index == -1) return;

    final removedCourse = _courses.removeAt(index);
    await GetIt.I<DeleteCourseUseCase>().call(courseId);

    emit(CourseRemoved(course: removedCourse));

    await selectCourse(_courses.firstOrNull?.id);
    await _resetCoursesId();
  }

  Future<void> selectCourse(int? courseId) async {
    _currentSelectedCourseId = courseId;
    final index = _getCourseIndex(_currentSelectedCourseId);
    if (index != -1) _currentCourse = _courses[index];

    emit(CourseSelected(courseId: courseId));
  }

  Future<void> _getRecentSelectedCourse() async {
    if (_currentSelectedCourseId != null) {
      await selectCourse(_currentSelectedCourseId);
    }
  }

  // إذا لم توجد دورات، يعيد عداد الـ ID إلى الصفر

  Future<void> _resetCoursesId() async {
    if (isCoursesEmpty) {
      await GetIt.I<ResetCoursesIdUseCase>().call();
    }
  }

  @override
  UserCourseState? fromJson(Map<String, dynamic> json) {
    try {
      emit(CourseLoading());
      final courseStorage = UserCourseStorage.fromJson(json);
      _courses.addAll(courseStorage.courses);

      _currentSelectedCourseId = courseStorage.recentSelectedCourse;
      _getRecentSelectedCourse();

      return CourseLoaded(courses: _courses);
    } catch (_) {
      return CourseInitial();
    }
  }

  @override
  Map<String, dynamic>? toJson(UserCourseState state) {
    final courseStorage = UserCourseStorage(
      courses: _courses,
      recentSelectedCourse: _currentSelectedCourseId,
    );
    return courseStorage.toJson();
  }
}
