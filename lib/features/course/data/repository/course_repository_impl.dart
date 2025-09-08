import 'package:bhf_player/core/database/local/local_exports.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';

import 'package:bhf_player/features/course/domain/repository/course_repository.dart';

class CourseRepositoryImpl extends CourseRepository {
  final DatabaseService _dbService;

  CourseRepositoryImpl(this._dbService);

  @override
  Future<int> addCourse(CourseEntity course) async =>
      await _dbService.insertRow(course.toJson());

  @override
  Future<int> updateCourse(CourseEntity course) async =>
      await _dbService.updateRow(course.id, course.toJson());

  @override
  Future<int> deleteCourse(int? courseId) async =>
      await _dbService.deleteRow(courseId);

  @override
  Future<Iterable<CourseEntity>> getAllCourses() async {
    final rawCourses = await _dbService.getAllData();
    final coursesEntities = rawCourses.map((c) => CourseEntity.fromJson(c));
    return coursesEntities;
  }

  
  @override
  Future<void> resetCoursesId() => _dbService.restTable();
}
