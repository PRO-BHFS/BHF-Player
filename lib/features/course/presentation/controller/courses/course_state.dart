import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:equatable/equatable.dart';

abstract class UserCourseState extends Equatable {
  const UserCourseState();
  @override
  List<Object?> get props => [];
}

class CourseInitial extends UserCourseState {}

class CourseLoading extends UserCourseState {}

class CourseAdded extends UserCourseState {
  final CourseEntity course;

  const CourseAdded({required this.course});

  @override
  List<Object?> get props => [course];
}

class CourseLoaded extends UserCourseState {
  final List<CourseEntity> courses;

  const CourseLoaded({required this.courses});

  @override
  List<Object?> get props => [courses];

}

class CourseUpdated extends UserCourseState {
  final CourseEntity course;

  const CourseUpdated({required this.course});

  @override
  List<Object?> get props => [course];

}

class CourseRemoved extends UserCourseState {
  final CourseEntity course;

  const CourseRemoved({required this.course});

@override
  List<Object?> get props => [course];

}

class CourseSelected extends UserCourseState {
  final int? courseId;

  const CourseSelected({required this.courseId});

  @override
  List<Object?> get props => [courseId];

}
