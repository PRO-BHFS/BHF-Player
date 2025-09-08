import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class BuildSvgIcon extends StatelessWidget {
  final bool isDisabled;
  const BuildSvgIcon(this.assetName, {super.key, this.isDisabled = false});

  final String assetName;

  @override
  Widget build(BuildContext context) {
    final color = isDisabled
        ? context.theme.disabledColor
        : context.colorScheme.onPrimary;

    return SvgPicture.asset(assetName,width: AppSizes.icon,height: AppSizes.icon,colorFilter:ColorFilter.mode(color, BlendMode.srcIn) ,);
  }
}