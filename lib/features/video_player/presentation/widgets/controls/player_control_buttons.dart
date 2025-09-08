import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
import 'package:flutter/material.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'playback_speed_dropdown.dart';
import 'control_button.dart';

class PlayerControlButtons extends StatelessWidget {
  final VideoPlayerCubit playerCubit;

  const PlayerControlButtons({super.key, required this.playerCubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // زر التشغيل والإيقاف
        ControlButton<bool>(
          listenable: playerCubit.playerService.isPlaying,
          iconBuilder: (isPlaying) => isPlaying
              ? const BuildIcon(Icons.pause_rounded)
              : const BuildIcon(Icons.play_arrow_rounded),
          onPressed: () async => await playerCubit.playOrPause(),
        ),

        PlaybackSpeedDropdown(playerCubit: playerCubit),

        // زر ملء الشاشة
        ControlButton<bool>(
          listenable: playerCubit.playerService.isFullScreen,
          iconBuilder: (isFullScreen) =>
              Icon(isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen),
          onPressed: () async => await playerCubit.toggleFullscreen(),
        ),
      ],
    );
  }
}
