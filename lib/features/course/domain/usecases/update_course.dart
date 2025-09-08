import 'package:bhf_player/features/course/domain/repository/course_repository.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';

class UpdateCourseUseCase {
  final CourseRepository _repository;

  UpdateCourseUseCase(this._repository);

  Future<int> call(CourseEntity course) => _repository.updateCourse(course);
}
