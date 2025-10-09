import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class TextTag extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const TextTag({
    super.key,
    required this.text,
    this.backgroundColor = const Color(0xFF0839DA),
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0.8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall),
      ),
      child: Text(
        text,
        style: textTheme.labelSmall?.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.3
        ),
      ),
    );
  }
}
