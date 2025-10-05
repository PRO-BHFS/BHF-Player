// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:bhf_player/core/utils/app_constants/keys.dart';

import 'course.dart';

class UserCourseStorage extends Equatable {
  final Set<CourseEntity> courses;
  final int? recentSelectedCourse;

  const UserCourseStorage({required this.courses, this.recentSelectedCourse});

  factory UserCourseStorage.empty() => const UserCourseStorage(courses: {});

  Map<String, dynamic> toJson() {
    return {
      Keys.coursesList: courses.map((c) => c.toJson()).toList(),
      Keys.recentSelectedCourse: recentSelectedCourse,
    };
  }

  factory UserCourseStorage.fromJson(Map<String, dynamic> map) {
    final coursesList = (map[Keys.coursesList] as List? ?? [])
        .map((e) => CourseEntity.fromJson(e))
        .toList();
    return UserCourseStorage(
      courses: coursesList.toSet(),
      recentSelectedCourse: map[Keys.recentSelectedCourse] as int?,
    );
  }
  
  UserCourseStorage copyWith({
    Set<CourseEntity>? courses,
    int? recentSelectedCourse,
  }) {
    return UserCourseStorage(
      courses: courses ?? this.courses,
      recentSelectedCourse: recentSelectedCourse ?? this.recentSelectedCourse,
    );
  }

  @override
  List<Object?> get props => [recentSelectedCourse, courses.lastOrNull?.id];

}
