import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/core/utils/styles/app_colors/light_colors.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class BuildIcon extends StatelessWidget {
  const BuildIcon(this.icon, {super.key, this.isBlack, this.color, this.size});

  final IconData icon;
  final bool? isBlack;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final Color color;

    color = (isBlack == false || context.isDark)
        ? DarkColors.icon
        : LightColors.icon;
    return Icon(icon, size: size ?? AppSizes.icon, color: this.color ?? color);
  }
}
