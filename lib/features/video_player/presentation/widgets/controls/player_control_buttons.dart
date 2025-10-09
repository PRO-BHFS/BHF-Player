import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/video_player/presentation/widgets/controls/lock_ui_action.dart';
import 'package:flutter/material.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'control_button.dart';

class PlayerControlButtons extends StatelessWidget {
  final VideoPlayerCubit playerCubit;

  const PlayerControlButtons({super.key, required this.playerCubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.mainPadding * 2),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Lock icon
          Align(
            alignment: Alignment.centerLeft,
            child: LockUiAction(playerCubit),
          ),

          // Play/Pause icon
          Align(
            alignment: Alignment.center,
            child: ControlButton<bool>(
              listenable: playerCubit.playerService.isPlaying,
              iconBuilder: (isPlaying) {
                return BuildIcon(
                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  color: Colors.white,
                );
              },
              onPressed: () async => await playerCubit.playOrPause(),
            ),
          ),

          // Change video dimensions
          Align(
            alignment: Alignment.centerRight,
            child: ControlButton<AspectRatioPlayer>(
              listenable: playerCubit.playerService.aspectRatio,
              iconBuilder: (aspectRatio) {
                final icon = switch (aspectRatio) {
                  AspectRatioPlayer.fit => Icons.aspect_ratio_rounded,
                  AspectRatioPlayer.original =>
                    Icons.screenshot_monitor_rounded,
                  AspectRatioPlayer.fill => Icons.width_full_rounded,
                };

                return BuildIcon(icon, color: Colors.white);
              },
              onPressed: playerCubit.changeAspectRatio,
            ),
          ),
        ],
      ),
    );
  }
}
