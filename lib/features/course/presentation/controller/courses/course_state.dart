import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:bhf_player/features/course/domain/entities/user_course_storage.dart';
import 'package:equatable/equatable.dart';

abstract class CourseState extends Equatable {
  const CourseState(this.courseStorage);
  final UserCourseStorage courseStorage;

  @override
  List<Object?> get props => [courseStorage];
}

class CourseInitial extends CourseState {
  const CourseInitial(super.courseStorage);
}

class CourseLoading extends CourseState {
  const CourseLoading(super.courseStorage);
}

class CourseAdded extends CourseState {
  final CourseEntity course;
  const CourseAdded(this.course, super.courseStorage);
}

class CourseLoaded extends CourseState {
  const CourseLoaded(super.courseStorage);
}

class CourseUpdated extends CourseState {
  const CourseUpdated(super.courseStorage);
}

class CourseRemoved extends CourseState {
  final CourseEntity course;

  const CourseRemoved(this.course, super.courseStorage);
}

class CourseSelected extends CourseState {
  const CourseSelected(super.courseStorage);
}
