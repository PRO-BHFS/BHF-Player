import 'package:bhf_player/core/presentation/components/buttons/circle_icon_button.dart';
import 'package:bhf_player/core/presentation/components/icons/build_svg_icon.dart';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:bhf_player/core/utils/extensions/context_extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:flutter/material.dart';

class BuildGestureArea extends StatelessWidget {
  final GestureArea gestureArea;
  final VoidCallback onDoubleTap;
  final void Function(DragUpdateDetails)? onVerticalDragUpdate;
  final VideoPlayerCubit playerCubit;

  const BuildGestureArea({
    super.key,
    required this.gestureArea,
    required this.onDoubleTap,
    required this.playerCubit,
    this.onVerticalDragUpdate,
  });

  BorderRadius getBorderRadiusForGesture(GestureArea? activeGesture) {
    const double radius = 200.0;
    return BorderRadius.horizontal(
      left: Radius.circular(activeGesture == GestureArea.right ? radius : 0),
      right: Radius.circular(activeGesture == GestureArea.left ? radius : 0),
    );
  }

  Widget buildGestureBackground(
    ValueNotifier<Color> colorBackground,
    GestureArea? activeGesture,
    Widget uiIcon,
  ) {
    return ValueListenableBuilder(
      valueListenable: colorBackground,
      builder: (context, color, _) {
        final screenHeight = context.screenHeight;
        return Container(
          height: screenHeight,
          width: screenHeight,
          decoration: BoxDecoration(
            color: color,
            borderRadius: getBorderRadiusForGesture(activeGesture),
          ),
          child: Center(child: uiIcon),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColorNotifier = ValueNotifier(Colors.transparent);

    return GestureDetector(
      onTap: playerCubit.toggleControls,
      onDoubleTap: () {
        onDoubleTap();
        if (gestureArea == GestureArea.center) return;
        backgroundColorNotifier.value = const Color(0x5B000000);
      },
      onHorizontalDragUpdate: playerCubit.seekHorizontal,
      onHorizontalDragEnd: (_) => playerCubit.resetInactivityTimer(),
      onVerticalDragUpdate: onVerticalDragUpdate,
      onLongPressStart: (_) {
        playerCubit.playerService.lastSpeed =
            playerCubit.playerService.playbackSpeed.value;
      },
      onLongPress: () async {

        await playerCubit.changePlaybackSpeed(2.0);
        await playerCubit.changeUiIcon(
          icon: CircleIconButton(
            icon: BuildSvgIcon(AppIconsAssests.speed2x, size: AppSizes.bigIcon),
            circleRadius: 40,
          ),
          area: GestureArea.center,
        );
      },
      onLongPressUp: () async {
        await playerCubit.changePlaybackSpeed(
          playerCubit.playerService.lastSpeed,
        );
      },
      child: ValueListenableBuilder<GestureArea?>(
        valueListenable: playerCubit.playerService.activeGesture,
        builder: (context, activeGesture, _) {
          return ValueListenableBuilder(
            valueListenable: playerCubit.playerService.uiIcon,
            builder: (context, gestureIcon, _) {
              return AnimatedOpacity(
                duration: Duration.zero,

                opacity: activeGesture == gestureArea ? 1.0 : 0.0,
                child: buildGestureBackground(
                  backgroundColorNotifier,
                  activeGesture,
                  gestureIcon,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
