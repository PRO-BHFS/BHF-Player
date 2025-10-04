import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/features/db_backup/presentation/controller/backup/backup_controller.dart';
import 'package:bhf_player/features/db_backup/presentation/controller/backup/backup_state.dart';
import 'package:bhf_player/features/db_backup/presentation/helpers/backup_helpers.dart';
import 'package:bhf_player/features/settings/presentation/screens/settings_screen.dart';
import 'package:bhf_player/generated/l10n.dart';
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
              child: PopupMenuChild(
                label: S.of(context).save_backup,
                iconData: Icons.save_rounded,
              ),
              onTap: () async => await context.read<BackupCubit>().backup(),
            ),

            PopupMenuItem(
              child: PopupMenuChild(
                label: S.of(context).restore_backup,
                iconData: Icons.restore_page_rounded,
              ),
              onTap: () async => await context.read<BackupCubit>().restore(),
            ),

            PopupMenuItem(
              onTap: () => context.pushRoute(const SettingsScreen()),
              child: PopupMenuChild(
                label: S.of(context).settings,
                iconData: Icons.settings_rounded,
              ),
            ),
          ];
        },
      ),
    );
  }
}
