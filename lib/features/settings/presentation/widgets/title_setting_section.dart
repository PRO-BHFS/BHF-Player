import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class TitleSettingSection extends StatelessWidget {
  final Widget icon;
  final String title;

  const TitleSettingSection({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        icon,
        Text(title, style: context.textTheme.titleSmall),
      ],
    );
  }
}
