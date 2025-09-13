import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
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
          // ايقونة عمل قفل
          Align(
            alignment: Alignment.centerLeft,
            child: LockUiAction(playerCubit),
          ),

          // ايقونة التشغيل والإيقاف
          Align(
            alignment: Alignment.center,
            child: ControlButton<bool>(
              listenable: playerCubit.playerService.isPlaying,
              iconBuilder: (isPlaying) => isPlaying
                  ? const BuildIcon(Icons.pause_rounded)
                  : const BuildIcon(Icons.play_arrow_rounded),
              onPressed: () async => await playerCubit.playOrPause(),
            ),
          ),
        ],
      ),
    );
  }
}
