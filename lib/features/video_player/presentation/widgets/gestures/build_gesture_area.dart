import 'package:bhf_player/core/presentation/components/icons/build_svg_icon.dart';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:flutter/material.dart';

class BuildGestureArea extends StatelessWidget {
  final GestureArea area;
  final VoidCallback onDoubleTap;
  final void Function(DragUpdateDetails)? onVerticalDragUpdate;
  final VideoPlayerCubit playerCubit;

  const BuildGestureArea({
    super.key,
    required this.area,
    required this.onDoubleTap,
    required this.playerCubit,
    this.onVerticalDragUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final colorBackground = ValueNotifier(Colors.transparent);
    return GestureDetector(
      onTap: playerCubit.toggleControls,
      onDoubleTap: () {
        onDoubleTap();
        if (area == GestureArea.center) return;
        colorBackground.value = const Color(0x5B000000);
      },
      onHorizontalDragUpdate: playerCubit.seekHorizontal,
      onHorizontalDragEnd:(_)=> playerCubit.resetInactivityTimer(),
      onVerticalDragUpdate: onVerticalDragUpdate,
      onLongPressStart: (_) {
        playerCubit.playerService.lastSpeed =
            playerCubit.playerService.playbackSpeed.value;
      },
      onLongPressMoveUpdate: (_) async {
        await playerCubit.changePlaybackSpeed(2.0);
        await playerCubit.changeUiIcon(
          icon: BuildSvgIcon(AppIconsAssests.speed2x, size: AppSizes.bigIcon),
          area: GestureArea.center,
        );
      },
      onLongPressDown: (_) async {
        await playerCubit.changePlaybackSpeed(
          playerCubit.playerService.lastSpeed,
        );
      },
      child: ValueListenableBuilder<GestureArea?>(
        valueListenable: playerCubit.playerService.activeGesture,
        builder: (context, activeGesture, _) {
          return ValueListenableBuilder(
            valueListenable: playerCubit.playerService.uiIcon,
            builder: (context, uiIcon, _) {
              return AnimatedOpacity(
                duration: AppConsts.fadeInDuration,
                opacity: activeGesture == area ? 1.0 : 0.0,
                child: ValueListenableBuilder(
                  valueListenable: colorBackground,
                  builder: (context, color, _) {
                    return Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(250),
                      ),
                      child: Center(child: uiIcon),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
