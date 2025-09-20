import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/db_backup/domain/usecases/backup_db.dart';
import 'package:bhf_player/features/db_backup/domain/usecases/restore_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'backup_state.dart';

class BackupCubit extends Cubit<BackupState> {
  BackupCubit(this._userCourseCubit) : super(BackupInitial());

  final CourseCubit _userCourseCubit;

  Future<void> backup() async {
    final backupDb = GetIt.I<BackupDbUseCase>();
    emit(BackupLoading());
    try {
      final backup = await backupDb();
      if (backup != null) emit(BackupSuccess(backup));
    } catch (e) {
      emit(BackupError(e.toString()));
    }
  }

  Future<void> restore() async {
    final restoreDb = GetIt.I<RestoreDbUseCase>();
    emit(BackupLoading());
    try {
      final isRestored = await restoreDb();
      await _userCourseCubit.loadCourses();
      if (isRestored) emit(RestoreSuccess());
    } catch (e) {
      emit(RestoreError(e.toString()));
    }
  }
}
