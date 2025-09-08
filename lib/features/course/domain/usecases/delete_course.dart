import 'package:bhf_player/features/course/domain/repository/course_repository.dart';

class DeleteCourseUseCase {
  final CourseRepository _repository;

  DeleteCourseUseCase(this._repository);

  Future<int> call(int? courseId) => _repository.deleteCourse(courseId);
}
