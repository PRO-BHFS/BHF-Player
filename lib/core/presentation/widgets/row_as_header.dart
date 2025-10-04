import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class RowAsHeader extends StatelessWidget {
  const RowAsHeader({super.key, required this.title, required this.icon});

  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSizes.spacingMiddle,
      children: [
        icon,
        Text(title, style: context.textTheme.labelSmall),
      ],
    );
  }
}
