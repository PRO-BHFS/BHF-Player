import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VerticalSlider extends StatelessWidget {
  final ValueListenable<double> valueListenable;
  final IconData icon;
  final IconData? emptyIcon;
  const VerticalSlider({
    super.key,
    required this.valueListenable,
    required this.icon,
    this.emptyIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, progress, _) {
        return Container(
          height: 180,
          width: 50,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: DarkColors.transparent,
          ),

          child: Column(
            spacing: 5,
            children: [
              Text(
                progress.range(0, 15),
                style: context.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Slider(
                    value: progress.clamp(0.0, 100.0),
                    divisions: 10,
                    onChanged: (_) {},
                    max: 100.0,
                  ),
                ),
              ),
              BuildIcon(progress > 0.0 ? icon : emptyIcon ?? icon),
            ],
          ),
        );
      },
    );
  }
}
