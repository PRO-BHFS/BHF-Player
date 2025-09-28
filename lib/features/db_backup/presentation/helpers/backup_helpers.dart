import 'package:bhf_player/core/utils/helpers_functions/notifications/notifications.dart';
import 'package:bhf_player/features/db_backup/presentation/controller/backup/backup_state.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';

Future<void> handleBackupState(BuildContext context, BackupState state) async {
  switch (state) {
    case BackupInitial():
    case BackupLoading():
      break;
    case BackupSuccess():
      Notifications.showFlushbar(
        message: S.of(context).backup_saved_successfully,
        iconType: IconType.done,
      );
      break;

    case BackupError():
      Notifications.showFlushbar(
        message: S.of(context).error_occurred_while_saving,
        iconType: IconType.error,
      );
      break;

    case RestoreSuccess():
      Notifications.showFlushbar(
        message: S.of(context).data_restored_successfully,
        iconType: IconType.done,
      );

      break;

    case RestoreError():
      Notifications.showFlushbar(
        message: S.of(context).error_occurred_while_restoring,
        iconType: IconType.error,
      );
      break;

    case RestoreLoading():
      break;
  }
}
