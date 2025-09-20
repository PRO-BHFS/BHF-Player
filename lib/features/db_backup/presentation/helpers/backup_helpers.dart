import 'package:bhf_player/core/utils/helpers_functions/notifications/notifications.dart';
import 'package:bhf_player/features/db_backup/presentation/controller/backup/backup_state.dart';
import 'package:flutter/material.dart';

Future<void> handleBackupState(BuildContext context, BackupState state) async {
  switch (state) {
    case BackupInitial():
    case BackupLoading():
      break;
    case BackupSuccess():
      Notifications.showFlushbar(
        message: "تم حفظ نسخة احتياطية من البيانات بنجاح",
        iconType: IconType.done,
      );
      break;

    case BackupError():
      Notifications.showFlushbar(
        message: "حدث خطأ أثناء حفظ البيانات",
        iconType: IconType.error,
      );
      break;

    case RestoreSuccess():
      Notifications.showFlushbar(
        message: "تم استعادة البيانات بنجاح",
        iconType: IconType.done,
      );

      break;

    case RestoreError():
      Notifications.showFlushbar(
        message: "حدث خطأ أثناء استعادة البيانات",
        iconType: IconType.error,
      );
      break;

    case RestoreLoading():
      break;
  }
}
