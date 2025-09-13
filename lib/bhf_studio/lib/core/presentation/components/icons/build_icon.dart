import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/light_colors.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class BuildIcon extends StatelessWidget {
  const BuildIcon(
    this.icon, {
    super.key,
    this.isBlack = false,
    this.color, this.size,
  });

  final IconData icon;
  final bool isBlack;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size:size?? AppSizes.icon,
      color:color?? (isBlack ? const Color(0xDB000000) : LightColors.icon),
    );
  }
}
