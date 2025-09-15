import 'package:bhf_player/bhf_studio/lib/core/presentation/widgets/popup_menu_child.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/features/settings/presentation/screens/settings_screen.dart';
import 'package:bhf_player/bhf_studio/lib/features/subscription_renew/presentation/screens/subscription_renew_screen.dart';
import 'package:flutter/material.dart';

class MoreOptionsButton extends StatelessWidget {
  const MoreOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) {
        return [
          PopupMenuItem(
            onTap: () => context.pushRoute(const SubscriptionRenewScreen()),
            child: const PopupMenuChild(
              label: "تجديد باقة",
              iconData: Icons.monetization_on_outlined,
            ),
          ),

          const PopupMenuItem(
            child: PopupMenuChild(
              label: "حفظ نسخة",
              iconData: Icons.save_rounded,
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
