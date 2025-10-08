import 'package:bhf_player/core/utils/extensions/context_extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.secondPadding),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold)),
          Flexible(child: Text(value, style: textTheme.labelSmall?.copyWith(
          letterSpacing: 2
          ))),
        ],
      ),
    );
  }
}
