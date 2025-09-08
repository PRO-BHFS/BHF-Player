import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants_exports.dart';
import 'package:flutter/material.dart';

class BuildAppLogo extends StatelessWidget {
  final double width;

  const BuildAppLogo({super.key, this.width = 200});

  @override
  Widget build(BuildContext context) {
    return Image(image: const AssetImage(Images.logo), width: width);
  }
}
