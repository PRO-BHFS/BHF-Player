import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/features/db_backup/presentation/controller/backup/backup_controller.dart';
import 'package:bhf_player/features/db_backup/presentation/controller/backup/backup_state.dart';
import 'package:bhf_player/features/db_backup/presentation/helpers/backup_helpers.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/screens/courses_library_screen.dart';
import 'package:bhf_player/features/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'popup_menu_child.dart';

class MoreOptionsButton extends StatelessWidget {
  const MoreOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BackupCubit, BackupState>(
      listener: handleBackupState,
      child: PopupMenuButton(
        icon: const BuildIcon(Icons.more_vert_rounded),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: const PopupMenuChild(
                label: "مكتبة الفيديوهات",
                iconData: Icons.video_library_outlined,
              ),
              onTap: () async =>
                  await context.pushRoute(const CoursesLibraryScreen()),
            ),

            PopupMenuItem(
              child: const PopupMenuChild(
                label: "حفظ نسخة",
                iconData: Icons.save_rounded,
              ),
              onTap: () async => await context.read<BackupCubit>().backup(),
            ),

            PopupMenuItem(
              child: const PopupMenuChild(
                label: "استعادة نسخة",
                iconData: Icons.restore_page_rounded,
              ),
              onTap: () async => await context.read<BackupCubit>().restore(),
            ),

            PopupMenuItem(
              onTap: () => context.pushRoute(const SettingsScreen()),
              child: const PopupMenuChild(
                label: "الاعدادات",
                iconData: Icons.settings_rounded,
              ),
            ),
          ];
        },
      ),
    );
  }
}
