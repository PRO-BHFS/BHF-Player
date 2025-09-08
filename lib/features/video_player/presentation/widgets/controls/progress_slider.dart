import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:flutter/material.dart';

class ProgressSlider extends StatelessWidget {
  final VideoPlayerCubit playerCubit;
  const ProgressSlider(this.playerCubit, {super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: playerCubit.playerService.playerSliderProgress,
      builder: (_, progressValue, _) {
        return Slider(
          value: progressValue.clamp(0.0, 1.0),

          onChanged: playerCubit.seekTo,
        );
      },
    );
  }
}
