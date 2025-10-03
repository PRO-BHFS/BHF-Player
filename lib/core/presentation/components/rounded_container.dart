import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  const RoundedContainer({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final seecondColor = colorScheme.surface.withAlpha(140);
    final isDarkTheme = context.isDark;
    return Container(
      padding: padding ?? const EdgeInsets.all(AppSizes.secondPadding),
      margin: const EdgeInsets.only(bottom: AppSizes.spacingMiddle),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [.8, .99],
          colors: isDarkTheme
              ? [seecondColor, colorScheme.surface]
              : [colorScheme.surface, seecondColor],
        ),
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusMiddle),
        boxShadow: [
          const BoxShadow(
            color: Color(0x2C919191),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
