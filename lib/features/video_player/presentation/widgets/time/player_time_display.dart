import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:flutter/material.dart';

import 'time_text.dart';

class PlayerTimeDisplay extends StatelessWidget {
  final Widget? middleWidget;
  final VideoPlayerCubit playerCubit;

  const PlayerTimeDisplay({
    super.key,
    this.middleWidget,
    required this.playerCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSizes.secondPadding,
      children: [
        TimeText(listenable: playerCubit.playerService.currentPosition),

        middleWidget == null ? const Spacer() : Expanded(child: middleWidget!),

        TimeText(listenable: playerCubit.playerService.videoDuration),
      ],
    );
  }
}

