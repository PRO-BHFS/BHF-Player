import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
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
        return SizedBox(
          height: 180,
          child: Column(
            spacing: 5,
            children: [
              Text(progress.range(0, 15),),
              Expanded(
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Slider(
                    value: progress.clamp(0.0, 100.0),
                    onChanged: (_) {},
                    max: 100.0,
                  ),
                ),
              ),
              ConditionalBuilder(
                condition: progress == 0,
                builder: (_) => BuildIcon(icon),
                fallback: (_) => BuildIcon(emptyIcon ?? icon),
              ),
            ],
          ),
        );
      },
    );
  }
}
