import 'package:bhf_player/bhf_studio/lib/features/course/domain/entities/course.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/domain/repository/course_repository.dart';

class UpdateCourseUseCase {
  final CourseRepository _repository;

  UpdateCourseUseCase(this._repository);

  Future<int> call(CourseEntity course)  =>
       _repository.updateCourse(course);
}
