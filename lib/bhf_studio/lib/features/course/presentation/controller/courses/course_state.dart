import 'package:bhf_player/bhf_studio/lib/features/course/domain/entities/course.dart';
import 'package:equatable/equatable.dart';

abstract class AdminCourseState extends Equatable {
  const AdminCourseState();

  @override
  List<Object?> get props =>[];
}

class CourseInitial extends AdminCourseState {}

class CourseLoading extends AdminCourseState {}

class CourseAdded extends AdminCourseState {
  final CourseEntity course;

  const CourseAdded({required this.course});

  
  @override
  List<Object?> get props => [course];
}

class CourseLoaded extends AdminCourseState {
  final List<CourseEntity> courses;

  const CourseLoaded({required this.courses});

  
  @override
  List<Object?> get props => [courses];

}

class CourseUpdated extends AdminCourseState {
  final CourseEntity course;

  const CourseUpdated({required this.course});

    
  @override
  List<Object?> get props => [course];

}

class CourseRemoved extends AdminCourseState {
  final CourseEntity course;

  const CourseRemoved({required this.course});

    
  @override
  List<Object?> get props => [course];

}

class CourseSelected extends AdminCourseState {
  final int? courseId;

  const CourseSelected({required this.courseId});

    
  @override
  List<Object?> get props => [courseId];

}
