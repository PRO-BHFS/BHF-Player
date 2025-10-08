import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/core/presentation/components/icons/build_svg_icon.dart';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:bhf_player/features/video_player/presentation/widgets/gestures/build_gesture_area.dart';
import 'package:bhf_player/features/video_player/presentation/widgets/controls/vertical_slider.dart';
import 'package:flutter/material.dart';

class VideoPlayerGestures extends StatelessWidget {
  final VideoPlayerCubit playerCubit;

  const VideoPlayerGestures({super.key, required this.playerCubit});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Row(
        children: [
          Expanded(
            child: BuildGestureArea(
              gestureArea: GestureArea.left,
              onDoubleTap: () async {
                await playerCubit.backward();
                await playerCubit.changeUiIcon(
                  icon: const BuildSvgIcon(AppIconsAssests.backward),
                  area: GestureArea.left,
                );
              },
              onVerticalDragUpdate: (details) async {
                await playerCubit.changeVerticalBrightness(details);
                await playerCubit.changeUiIcon(
                  icon: VerticalSlider(
                    icon: Icons.brightness_6_rounded,
                    valueListenable: playerCubit.playerService.brightness,
                  ),
                  area: GestureArea.right,
                );
              },
              playerCubit: playerCubit,
            ),
          ),

          Expanded(
            child: ValueListenableBuilder<bool>(
              valueListenable: playerCubit.playerService.isPlaying,
              builder: (context, isPlaying, _) {
                return BuildGestureArea(
                  gestureArea: GestureArea.center,
                  onDoubleTap: () async {
                    await playerCubit.playOrPause();
                    await playerCubit.changeUiIcon(
                      icon: BuildIcon(
                        isPlaying
                            ? Icons.play_arrow_rounded
                            : Icons.pause_rounded,
                        size: AppSizes.bigIcon,
                      ),
                      area: GestureArea.center,
                    );
                  },
                  playerCubit: playerCubit,
                );
              },
            ),
          ),

          Expanded(
            child: BuildGestureArea(
              gestureArea: GestureArea.right,
              onDoubleTap: () async {
                await playerCubit.forward();
                await playerCubit.changeUiIcon(
                  icon: const BuildSvgIcon(AppIconsAssests.forward),

                  area: GestureArea.right,
                );
              },
              onVerticalDragUpdate: (details) async {
                await playerCubit.changeVerticalVolume(details);
                await playerCubit.changeUiIcon(
                  icon: VerticalSlider(
                    icon: Icons.volume_up_rounded,
                    emptyIcon: Icons.volume_mute_rounded,
                    valueListenable: playerCubit.playerService.volume,
                  ),
                  area: GestureArea.left,
                );
              },

              playerCubit: playerCubit,
            ),
          ),
        ],
      ),
    );
  }
}
