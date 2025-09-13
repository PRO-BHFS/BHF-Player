import 'package:bhf_player/bhf_studio/lib/core/presentation/widgets/popup_menu_child.dart';
import 'package:flutter/material.dart';

class MoreOptionsButton extends StatelessWidget {
  const MoreOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) {
        return [
          const PopupMenuItem(
            
            child: PopupMenuChild(
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
          const PopupMenuItem(child: PopupMenuChild(
              label: "حفظ نسخة",
              iconData: Icons.settings_rounded,
            ),
          ),
        ];
      },
    );
  }
}
