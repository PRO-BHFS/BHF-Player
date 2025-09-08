import 'package:bhf_player/bhf_studio/lib/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class NothingScreen extends StatelessWidget {
  final String textButton;
  final String textNote;
  final String imagePath;
  final VoidCallback onPress;
  const NothingScreen({
    super.key,
    required this.textButton,
    required this.onPress,
    required this.imagePath,
    required this.textNote,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSizes.mainPadding),
      shrinkWrap: true,
      children: [

        BuildImageSvg(imagePath),
        Text(textNote, textAlign: TextAlign.center),
        BuildPrimaryButton(onPress: onPress, text: textButton),
      ].separatedBy(const SizedBox(height: 30)),
    );
  }
}
