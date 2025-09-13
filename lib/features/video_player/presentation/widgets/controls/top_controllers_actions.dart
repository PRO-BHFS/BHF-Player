import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/app_constants/app_assests/app_icons_assests.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:flutter/material.dart';

class TopControllersActions extends StatelessWidget {
  const TopControllersActions({
    super.key,
    required this.handleExit,
    required this.filename,
    required this.playerCubit,
  });
  final Future<void> Function() handleExit;
  final String filename;
  final VideoPlayerCubit playerCubit;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,

      child: Padding(
        padding: const EdgeInsets.all(AppSizes.mainPadding),
        child: Column(
          spacing: AppSizes.spacingSmall,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: AppSizes.spacingSmall,
              children: [
                BuildIconButton(
                  onPressed: () async => await handleExit(),
                  icon: const Icon(Icons.arrow_back),
                ),
                Flexible(
                  child: Text(
                    filename*3,
                    style: context.textTheme.titleSmall,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ValueListenableBuilder(
                valueListenable: playerCubit.playerService.videoActionState,
                builder: (_, videoActions, _) {
                  return Row(
                    spacing: AppSizes.spacingMiddle,

                    children: [
                      CircleIconButton(
                        onPressed: playerCubit.toggleThemePlayerUi,
                        icon: const BuildSvgIcon(AppIconsAssests.dark),
                        isActive: videoActions.isDarkModeActive,
                      ),

                      CircleIconButton(
                        onPressed: () {
                          playerCubit.playerUi.showSpeedControlPanel(
                            context,
                            playerCubit,
                          );
                        },
                        isActive: videoActions.isSpeedControlActive,
                        icon: ValueListenableBuilder(
                          valueListenable:
                              playerCubit.playerService.playbackSpeed,
                          builder: (_, speed, _) {
                            return FittedBox(
                              child: Text(
                                "${speed}X",
                                style: context.textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      CircleIconButton(
                        onPressed: () async => await playerCubit.toggleMute(),
                        icon: const BuildSvgIcon(AppIconsAssests.mute),
                        isActive: videoActions.isMuted,
                      ),

                      CircleIconButton(
                        onPressed: () async =>
                            await playerCubit.toggleFullscreen(),
                        icon: const BuildIcon(Icons.screen_rotation_rounded,size: 20,),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
