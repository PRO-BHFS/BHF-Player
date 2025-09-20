import 'package:bhf_player/features/db_backup/domain/repositories/backup_repository.dart';

class RestoreDbUseCase {
  final BackupRepository _repository;

  RestoreDbUseCase(this._repository);

  Future<bool> call() async {
    return await _repository.restoreDatabase();
  }
}
