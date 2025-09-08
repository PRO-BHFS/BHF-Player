import 'package:bhf_player/bhf_studio/lib/features/course/domain/entities/course.dart';

abstract class CourseRepository {
  Future<int> addCourse(CourseEntity course);
  Future<int> updateCourse(CourseEntity course);
  Future<int> deleteCourse(int? courseId);
  Future<Iterable<CourseEntity>> getAllCourses();
  Future<void> resetCoursesId();
}
