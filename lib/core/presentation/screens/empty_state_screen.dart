import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/device_id/presentation/widgets/device_id_panel.dart';
import 'package:flutter/material.dart';

class EmptyStateScreen extends StatelessWidget {
  final String textButton;
  final String textNote;
  final String imagePath;
  final VoidCallback onPress;
  const EmptyStateScreen({
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
        const DeviceIdPanel(),

        BuildImageSvg(imagePath),
        Text(
          textNote,
          textAlign: TextAlign.center,
          style: context.textTheme.labelMedium,
        ),
        BuildButton(onPress: onPress, text: textButton),
      ].separatedBy(const SizedBox(height: 30)),
    );
  }
}
