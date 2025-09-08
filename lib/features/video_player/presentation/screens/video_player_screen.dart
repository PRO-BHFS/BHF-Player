import 'dart:io';
import 'package:bhf_player/core/native_codes/screenshot_protector.dart';
import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';

import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:bhf_player/features/video_player/presentation/widgets/controls/controllers_overlay.dart';
import 'package:bhf_player/features/video_player/presentation/widgets/time/player_time_display.dart';
import 'package:bhf_player/features/video_player/presentation/widgets/video_player_view.dart';
import 'package:bhf_player/features/video_player/presentation/widgets/gestures/video_player_gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoEntity video;
  const VideoPlayerScreen(this.video, {super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final VideoPlayerCubit playerCubit;

  String get videoPath => widget.video.decryptedPath!;

  @override
  void initState() {
    super.initState();
    playerCubit = context.read<VideoPlayerCubit>();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    await _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    await playerCubit.initializeVideoPlayer(videoPath);
    if (!Platform.isAndroid) return;
    await ScreenshotProtector.disableScreenshot();
  }

  Future<void> _handleExit(BuildContext context) async {
    try {
      await playerCubit.disposePlayer();
      if (Platform.isAndroid) {
        await ScreenshotProtector.enableScreenshot();
      }
      await setNormalScreenMode();
      if (context.mounted) context.popRoute();
    } catch (e, stackTrace) {
      Notifications.showFlushbar(
        message: "حدث خطا اثناء الرجوع",
        iconType: IconType.error,
      );
      logError(stack: stackTrace, methodName: "_handleExit");
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) await _handleExit(context);
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              const VideoPlayerView(),
              VideoPlayerGestures(playerCubit: playerCubit),
              ValueListenableBuilder(
                valueListenable: playerCubit.playerService.isShowControllers,
                builder: (_, isVisible, child) {
                  return Visibility(
                    visible: isVisible,
                    child: child ?? const SizedBox.shrink(),
                  );
                },
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.secondPadding),
                    child: Row(
                      children: [
                        BuildIconButton(
                          onPressed: () async => await _handleExit(context),
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: playerCubit.playerService.isShowControllers,
                builder: (_, isShowControllers, playerTimeDisplayRow) {
                  return Visibility(
                    visible: !isShowControllers,
                    child: playerTimeDisplayRow!,
                  );
                },
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.secondPadding),
                    child: PlayerTimeDisplay(playerCubit: playerCubit),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ControllersOverlay(playerCubit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
