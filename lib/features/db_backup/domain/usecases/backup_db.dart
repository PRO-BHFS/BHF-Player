import 'package:bhf_player/features/db_backup/domain/entities/backup_entity.dart';
import 'package:bhf_player/features/db_backup/domain/repositories/backup_repository.dart';

class BackupDbUseCase {
  final BackupRepository _repository;

  BackupDbUseCase(this._repository);

  Future<BackupEntity?> call() async {
    return await _repository.backupDatabase();
  }
}
