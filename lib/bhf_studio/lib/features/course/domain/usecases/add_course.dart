import 'package:bhf_player/bhf_studio/lib/features/course/domain/entities/course.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/domain/repository/course_repository.dart';

class AddCourseUseCase {
  final CourseRepository _repository;

  AddCourseUseCase(this._repository);

  Future<int> call(CourseEntity course) => _repository.addCourse(course);
}
