import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall),
        color: middleWidget == null
            ? const Color(0x59000000)
            : Colors.transparent,
      ),

      child: Row(
        spacing: AppSizes.spacingSmall,
        mainAxisSize: middleWidget == null
            ? MainAxisSize.min
            : MainAxisSize.max,
        children: [
          TimeText(listenable: playerCubit.playerService.currentPosition),

          ConditionalBuilder(
            condition: middleWidget == null,
            builder: (_) => Text(" / ", style: context.textTheme.displaySmall),
            fallback: (_) => Expanded(child: middleWidget!),
          ),

          TimeText(listenable: playerCubit.playerService.videoDuration),
        ],
      ),
    );
  }
}
