import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class TextTag extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const TextTag({
    super.key,
    required this.text,
    this.backgroundColor = DarkColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall),
      ),
      child: Text(
        text,
        style: textTheme.labelSmall?.copyWith(
          color: textTheme.labelSmall?.color?.withAlpha(150),
        ),
      ),
    );
  }
}
