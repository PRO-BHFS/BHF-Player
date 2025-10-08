import 'package:bhf_player/features/course/courses_injection.dart';
import 'package:bhf_player/features/device_id/id_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:bhf_player/core/database/local/local_exports.dart';

final s1 = GetIt.instance;
Future<void> injectUserServicesLocator() async {
  await s1.reset();

  s1.registerSingletonAsync<DatabaseService>(() async {
    final dbService = DatabaseService();
    await dbService.init();
    return dbService;
  });

  setupUserCourseLocators();
  setupUserIdLocators();
}
