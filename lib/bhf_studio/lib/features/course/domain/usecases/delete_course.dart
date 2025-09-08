import 'package:bhf_player/bhf_studio/lib/features/course/domain/repository/course_repository.dart';

class DeleteCourseUseCase {
  final CourseRepository _repository;

  DeleteCourseUseCase(this._repository);

  Future<int> call(int? courseId) => _repository.deleteCourse(courseId);
}
