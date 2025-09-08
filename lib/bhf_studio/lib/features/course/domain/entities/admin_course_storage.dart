

import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/keys/keys_names.dart';

import 'course.dart';

class AdminCourseStorage {
  final List<CourseEntity> courses;
  final int? recentSelectedCourse;

  AdminCourseStorage({required this.courses, this.recentSelectedCourse});


  Map<String, dynamic> toJson() {
    return {
      Keys.coursesList: courses.map((c) => c.toJson()).toList(),
      Keys.recentSelectedCourse: recentSelectedCourse,
    };
  }

  factory AdminCourseStorage.fromJson(Map<String, dynamic> map) {
    final coursesList = (map[Keys.coursesList] as List? ?? [])
        .map((e) => CourseEntity.fromJson(e))
        .toList();
    return AdminCourseStorage(
      courses: coursesList,
      recentSelectedCourse: map[Keys.recentSelectedCourse] as int?,
    );
  }
}
