import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/features/db_backup/data/datasources/backup_local_datasource.dart';
import 'package:bhf_player/features/db_backup/domain/entities/backup_entity.dart';
import 'package:bhf_player/features/db_backup/domain/repositories/backup_repository.dart';

class BackupRepositoryImpl implements BackupRepository {
  final BackupLocalDataSource _localDataSource;

  BackupRepositoryImpl(this._localDataSource);

  @override
  Future<BackupEntity?> backupDatabase() async {
    try {
      final path = await _localDataSource.backupDatabase();
      if (path == null) return null;
      return BackupEntity(path: path, createdAt: DateTime.now());
    } catch (e, stack) {
      e.logError(stack: stack);
      rethrow;
    }
  }

  @override
  Future<bool> restoreDatabase() async {
    return await _localDataSource.restoreDatabase();
  }
}
