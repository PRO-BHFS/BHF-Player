import 'package:bhf_player/core/utils/app_constants/keys.dart';

import 'course.dart';

class UserCourseStorage {
  final List<CourseEntity> courses;
  final int? recentSelectedCourse;

  UserCourseStorage({required this.courses, this.recentSelectedCourse});


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
      courses: coursesList,
      recentSelectedCourse: map[Keys.recentSelectedCourse] as int?,
    );
  }
}
