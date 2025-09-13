import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:flutter/material.dart';

class LockUiAction extends StatelessWidget {
  const LockUiAction(this.playerCubit, {super.key});
  final VideoPlayerCubit playerCubit;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: playerCubit.playerService.isUiLocked,
      builder: (context, isUiLocked, child) {
        return ValueListenableBuilder(
          valueListenable: playerCubit.playerService.isShowControllers,
          builder: (context, isShowControllers, child) {
            return Visibility(
              visible: isShowControllers,
              child: BuildIconButton(
                onPressed: playerCubit.toggleUiLock,
                icon: isUiLocked
                    ? const BuildSvgIcon(AppIconsAssests.lock)
                    : const BuildSvgIcon(AppIconsAssests.unlock),
              ),
            );
          },
        );
      },
    );
  }
}
