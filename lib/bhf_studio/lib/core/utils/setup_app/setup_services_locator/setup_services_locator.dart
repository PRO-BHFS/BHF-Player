import 'package:bhf_player/bhf_studio/lib/core/database/local/local_exports.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/courses_injection.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/injection.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;
Future<void> setupServicesLocator() async {


  s1.registerSingletonAsync<DatabaseService>(() async {
    final dbService = DatabaseService();
    await dbService.init();
    return dbService;
  });

  setupCourseLocators(s1);
  setupEncryptionVideo(s1);
}
