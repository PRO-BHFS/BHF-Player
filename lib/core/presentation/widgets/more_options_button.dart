
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/features/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import 'popup_menu_child.dart';

class MoreOptionsButton extends StatelessWidget {
  const MoreOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) {
        return [
         
          const PopupMenuItem(
            child: PopupMenuChild(
              label: "حفظ نسخة",
              iconData: Icons.save_rounded,
            ),
          ),

          const PopupMenuItem(
            child: PopupMenuChild(
              label: "استعادة نسخة",
              iconData: Icons.restore_page_rounded,
            ),
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
    );
  }
}
