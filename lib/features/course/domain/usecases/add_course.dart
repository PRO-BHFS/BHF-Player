import 'package:bhf_player/features/course/domain/repository/course_repository.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';

class AddCourseUseCase {
  final CourseRepository _repository;

  AddCourseUseCase(this._repository);

  Future<int> call(CourseEntity course) => _repository.addCourse(course);
}
