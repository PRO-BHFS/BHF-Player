import 'package:bhf_player/core/utils/styles/app_colors/light_colors.dart';
import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final Color circleColor;
  final bool isActive;
  final bool isCircleRadius;
  final double? circleRadius;

  const CircleIconButton({
    super.key,
    this.onPressed,
    this.circleColor = const Color(0x4E000000),
    required this.icon,
    this.isActive = false,
    this.isCircleRadius = true,
    this.circleRadius
  });

  @override
  Widget build(BuildContext context) {
    final child = IconButton(iconSize: 24, onPressed: onPressed, icon: icon);

    final circleAvatar = CircleAvatar(
      backgroundColor: isActive ? LightColors.primary : circleColor,
      radius:circleRadius?? 20,
      child: child,
    );

    return isCircleRadius ? circleAvatar : child;
  }
}
