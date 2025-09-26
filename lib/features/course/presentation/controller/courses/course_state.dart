import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:equatable/equatable.dart';

abstract class CourseState extends Equatable {
  const CourseState(this.courses);
  final Set<CourseEntity> courses;

  Set<CourseEntity> copyWith({Set<CourseEntity>? courses}) {
    return courses ?? this.courses;
  }

  @override
  List<Object?> get props => [courses];
}

class CourseInitial extends CourseState {
  const CourseInitial(super.courses);
}

class CourseLoading extends CourseState {
  const CourseLoading(super.courses);
}

class CourseAdded extends CourseState {
  final CourseEntity course;
  const CourseAdded(super.courses, this.course);
}

class CourseLoaded extends CourseState {
  const CourseLoaded(super.courses);
}

class CourseUpdated extends CourseState {
  const CourseUpdated(super.courses);
}

class CourseRemoved extends CourseState {
  final CourseEntity course;

  const CourseRemoved(super.courses, this.course);
}

class CourseSelected extends CourseState {
  final int? courseId;

  const CourseSelected(super.courses, {required this.courseId});

  @override
  List<Object?> get props => [courseId];
}
