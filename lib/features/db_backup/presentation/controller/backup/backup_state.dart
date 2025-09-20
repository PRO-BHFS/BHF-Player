import 'package:bhf_player/features/db_backup/domain/entities/backup_entity.dart';

sealed class BackupState {}

class BackupInitial extends BackupState {}

class BackupLoading extends BackupState {}

class RestoreLoading extends BackupState {}

class BackupSuccess extends BackupState {
  final BackupEntity backup;
  BackupSuccess(this.backup);
}

class RestoreSuccess extends BackupState {}

class BackupError extends BackupState {
  final String message;
  BackupError(this.message);
}

class RestoreError extends BackupState {
  final String message;
  RestoreError(this.message);
}
