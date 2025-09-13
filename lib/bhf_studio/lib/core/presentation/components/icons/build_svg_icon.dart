import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class BuildSvgIcon extends StatelessWidget {
  const BuildSvgIcon(
    this.assetName, {
    super.key,
    this.size,
    this.isDisabled = false,
  });

  final String assetName;
  final bool isDisabled;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final color = isDisabled
        ? context.theme.disabledColor
        : context.colorScheme.onPrimary;
        
    return SvgPicture.asset(
      assetName,
      width: size ?? AppSizes.icon,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
