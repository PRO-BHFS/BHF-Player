import 'package:bhf_player/core/utils/styles/app_colors/light_colors.dart';
import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final Color circleColor;
  final bool isActive;

  const CircleIconButton({
    super.key,
     this.onPressed,
    this.circleColor = const Color(0x75000000),
    required this.icon,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: isActive ? LightColors.primary : circleColor,

      radius: 20,

      child: IconButton(
        iconSize: 20,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
