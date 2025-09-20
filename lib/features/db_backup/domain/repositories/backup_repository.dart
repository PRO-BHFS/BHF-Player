

import 'package:bhf_player/features/db_backup/domain/entities/backup_entity.dart';

abstract class BackupRepository {
  Future<BackupEntity?> backupDatabase();
  Future<bool> restoreDatabase();
}
