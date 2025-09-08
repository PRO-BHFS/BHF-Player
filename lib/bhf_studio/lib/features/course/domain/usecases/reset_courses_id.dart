import 'package:bhf_player/bhf_studio/lib/features/course/domain/repository/course_repository.dart';

class ResetCoursesIdUseCase {
  final CourseRepository _repository;

  ResetCoursesIdUseCase(this._repository);

  Future<void> call() => _repository.resetCoursesId();
}
