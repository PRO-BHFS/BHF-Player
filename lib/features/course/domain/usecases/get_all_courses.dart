import 'package:bhf_player/features/course/domain/repository/course_repository.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';

class GetAllCoursesUseCase {
  final CourseRepository _repository;

  GetAllCoursesUseCase(this._repository);

  Future<Iterable<CourseEntity>> call() => _repository.getAllCourses();
}
