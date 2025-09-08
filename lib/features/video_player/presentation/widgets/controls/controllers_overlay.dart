import 'package:bhf_player/core/utils/app_constants/app_constants.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:bhf_player/features/video_player/presentation/widgets/controls/progress_slider.dart';
import 'package:bhf_player/features/video_player/presentation/widgets/time/player_time_display.dart';
import 'package:flutter/material.dart';

import 'player_control_buttons.dart';

class ControllersOverlay extends StatelessWidget {
  final VideoPlayerCubit playerCubit;
  const ControllersOverlay(this.playerCubit, {super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: playerCubit.playerService.isShowControllers,
      builder: (_, isVisible, builderChild) {
        return AnimatedSwitcher(
          duration: AppConsts.fadeInDuration,
          reverseDuration: AppConsts.fadeOutDuration,
          switchInCurve: Curves.easeInToLinear,
          switchOutCurve: Curves.easeInToLinear,
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: isVisible ? builderChild : null,
        );
      },
      child: Container(
        color: const Color(0xCE000000),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.secondPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PlayerTimeDisplay(
                playerCubit: playerCubit,
                middleWidget: ProgressSlider(playerCubit),
              ),
              PlayerControlButtons(playerCubit: playerCubit),
            ],
          ),
        ),
      ),
    );
  }
}
