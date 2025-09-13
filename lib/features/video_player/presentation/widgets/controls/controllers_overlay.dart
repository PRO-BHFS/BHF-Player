import 'package:bhf_player/core/utils/app_constants/app_constants.dart';
import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
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
        return AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0,
          duration: AppConsts.fadeInDuration,
          curve: Curves.easeInBack,
          child: Visibility(visible: isVisible, child: builderChild!),
        );
      },
      child: Container(
        color: DarkColors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.mainPadding),
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
