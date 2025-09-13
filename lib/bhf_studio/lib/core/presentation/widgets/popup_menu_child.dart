import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:flutter/material.dart';

class PopupMenuChild extends StatelessWidget {
  const PopupMenuChild({
    super.key,
    required this.label,
    this.iconData,
    this.assetName,
  });
  final String label;
  final IconData? iconData;
  final String? assetName;

  @override
  Widget build(BuildContext context) {
    final fallback = (assetName != null)
        ? BuildSvgIcon(assetName!)
        : const SizedBox.shrink();

    return Row(
      spacing: 10,
      children: [
        ConditionalBuilder(
          condition: iconData != null,
          builder: (_) => BuildIcon(iconData!),
          fallback: (_) => fallback,
        ),

        Text(label, style: context.textTheme.labelSmall),
      ],
    );
  }
}
