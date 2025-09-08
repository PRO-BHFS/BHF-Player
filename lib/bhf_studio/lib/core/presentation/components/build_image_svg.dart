import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class BuildImageSvg extends StatelessWidget {
  final String assetName;
  const BuildImageSvg(this.assetName, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.screenHeight;
    return SvgPicture.asset(
      assetName,
      width: screenHeight <= 700 ? screenHeight * 0.3 : screenHeight * 0.4,
      placeholderBuilder: (context) =>
          const Center(child: CircularProgressIndicator()),
    );
  }
}
