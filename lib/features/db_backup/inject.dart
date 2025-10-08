import 'package:bhf_player/core/database/local/local_exports.dart';
import 'package:bhf_player/core/utils/setup_app/service_locator/service_locator.dart';
import 'package:bhf_player/features/db_backup/data/repositories/backup_repository_impl.dart';
import 'package:bhf_player/features/db_backup/domain/repositories/backup_repository.dart';
import 'data/datasources/backup_local_datasource.dart';
import 'domain/usecases/backup_db.dart';
import 'domain/usecases/restore_db.dart';

void injectBackupDb() {
  s1.registerLazySingleton(() => BackupLocalDataSource(s1<DatabaseService>()));
  s1.registerLazySingleton<BackupRepository>(() => BackupRepositoryImpl(s1()));
  s1.registerLazySingleton(() => BackupDbUseCase(s1<BackupRepository>()));
  s1.registerLazySingleton(() => RestoreDbUseCase(s1<BackupRepository>()));
}
