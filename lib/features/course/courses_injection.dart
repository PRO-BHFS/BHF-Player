import 'package:get_it/get_it.dart';

import 'data/repository/course_repository_impl.dart';
import 'domain/repository/course_repository.dart';
import 'domain/usecases/add_course.dart';
import 'domain/usecases/delete_course.dart';
import 'domain/usecases/reset_courses_id.dart';
import 'domain/usecases/update_course.dart';
import 'domain/usecases/get_all_courses.dart';

void setupUserCourseLocators(GetIt s1) {
  s1.registerLazySingleton<CourseRepository>(() => CourseRepositoryImpl(s1()));
  s1.registerLazySingleton(() => AddCourseUseCase(s1()));
  s1.registerLazySingleton(() => UpdateCourseUseCase(s1()));
  s1.registerLazySingleton(() => DeleteCourseUseCase(s1()));
  s1.registerLazySingleton(() => GetAllCoursesUseCase(s1()));
  s1.registerLazySingleton(() => ResetCoursesIdUseCase(s1()));
}
