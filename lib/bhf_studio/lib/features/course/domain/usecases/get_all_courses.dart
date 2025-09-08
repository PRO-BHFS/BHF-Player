import 'package:bhf_player/bhf_studio/lib/features/course/domain/entities/course.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/domain/repository/course_repository.dart';

class GetAllCoursesUseCase {
  final CourseRepository _repository;

  GetAllCoursesUseCase(this._repository);

  Future<Iterable<CourseEntity>> call() => _repository.getAllCourses();
}
