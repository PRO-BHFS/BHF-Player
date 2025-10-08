import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:flutter/material.dart';

class SpeedControlPanel extends StatelessWidget {
  const SpeedControlPanel({super.key, required this.playerCubit});
  final VideoPlayerCubit playerCubit;
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final labelSmall = textTheme.labelSmall?.copyWith(letterSpacing: 2);
    final headlineSmall = textTheme.headlineSmall?.copyWith(letterSpacing: 2);

    return Container(
      padding: const EdgeInsets.all(AppSizes.secondPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleIconButton(
                onPressed: () {},
                icon: const BuildIcon(Icons.remove_rounded),
              ),
              ValueListenableBuilder(
                valueListenable: playerCubit.playerService.playbackSpeed,
                builder: (_, speed, child) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.secondPadding,
                      vertical: AppSizes.secondPadding / 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF515151),
                      borderRadius: BorderRadius.circular(
                        AppSizes.borderRadiusSmall,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("$speed", style: headlineSmall),
                        child!,
                      ],
                    ),
                  );
                },
                child: Text(
                  "X",
                  style: headlineSmall,
                  textScaler: const TextScaler.linear(0.7),
                ),
              ),
              CircleIconButton(
                onPressed: () {},
                icon: const BuildIcon(Icons.add_rounded),
              ),
            ],
          ),
          Row(
            spacing: AppSizes.spacingSmall,
            children: [
              Text("0.25X", style: labelSmall),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: playerCubit.playerService.playbackSpeed,
                  builder: (context, speed, child) {
                    return Slider(
                      onChanged: (newSpeed) async {
                        playerCubit.playerService.lastSpeed = await playerCubit
                            .changePlaybackSpeed(newSpeed.clamp(0.25, 4.0));
                      },
                      value: speed.clamp(0.25, 4.0),
                      min: 0.25,
                      max: 4.0,
                    );
                  },
                ),
              ),
              Text("4.0X", style: labelSmall),

              BuildIconButton(
                onPressed: () async {
                  playerCubit.playerService.lastSpeed = await playerCubit
                      .changePlaybackSpeed(1.0);
                },
                icon: const BuildIcon(Icons.refresh),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
