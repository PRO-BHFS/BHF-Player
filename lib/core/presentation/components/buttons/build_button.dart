import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final Widget? icon;
  final String text;
  final VoidCallback? onPress;
  final Color? colorBackground;

  const BuildButton({
    super.key,
    this.icon,
    required this.text,
    required this.onPress,
    this.colorBackground,
  });

  @override
  Widget build(BuildContext context) {
    final disabledForegroundColor = context.theme.disabledColor;

    return ElevatedButton(
      onPressed: onPress,

      style: ElevatedButton.styleFrom(
        backgroundColor: colorBackground,
        shadowColor: colorBackground?.withAlpha(70),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 3,
        children: [
          Text(text, style: context.textTheme.labelMedium?.copyWith(
            color: onPress == null ? disabledForegroundColor : null,
          )),
          icon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
