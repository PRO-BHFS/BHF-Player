import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flashy_flushbar/flashy_flushbar_widget.dart';
import 'package:flutter/material.dart';

enum IconType { done, error, info }

class Notifications {
  Notifications._();

  static Widget _getTypeIcon(IconType iconType) {
    switch (iconType) {
      case IconType.done:
        return const Icon(Icons.check_circle, color: Color(0xFF72FF59));

      case IconType.info:
        return const Icon(Icons.info_outline, color: Color(0xF5FFFFFF));

      case IconType.error:
        return const Icon(Icons.error, color: Colors.redAccent);
    }
  }

  static void showFlushbar({
    required String message,
    IconType iconType = IconType.info,
  }) {
    FlashyFlushbar(
      customWidget: Row(
        children: [
          Expanded(
            child: Text(
              message,
              maxLines: 2,
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Color.fromARGB(255, 29, 29, 29)),
            ),
          ),
          const SizedBox(width: 10),
          _getTypeIcon(iconType),
        ],
      ),
      horizontalPadding: const EdgeInsets.all(AppSizes.secondPadding),
      borderRadius: BorderRadius.circular(10),
      backgroundColor: const Color(0xFFFFFFFF).withAlpha(245),
      boxShadows: [
        const BoxShadow(

          color: Color(0x1C000000),
          spreadRadius: .3,
          blurRadius: 10,
        ),
      ],
    ).show();
  }
}
