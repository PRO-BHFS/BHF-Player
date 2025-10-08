import 'dart:async';
import 'dart:io';
import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:bhf_player/features/video_player/presentation/widgets/speed_panel/speed_control_panel.dart';
import 'package:flutter/material.dart';
import 'package:bhf_player/core/utils/app_constants/app_constants.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'video_player_service.dart';

class PlayerUi {
  PlayerUi._();
  static PlayerUi? _instance;
  factory PlayerUi() => _instance ??= PlayerUi._();

  Future<void> resetInactivityTimer(VideoPlayerService service) async {
    service.inactivityTimer?.cancel();
    if (!service.isFullScreen.value && !Platform.isAndroid) return;

    await setSystemUIVisibility(service.isShowControllers.value);

    service.inactivityTimer = Timer(AppConsts.videoControlsDuration, () async {
      if (!service.isPlaying.value) {
        await showOrHideControls(service, true);
        return;
      }
      await showOrHideControls(service, false);

      await setSystemUIVisibility(false);
    });
  }

  Future<void> toggleFullscreen(VideoPlayerService service) async {
    service.isFullScreen.value = !service.isFullScreen.value;
    service.isFullScreen.value
        ? await setFullScreenMode()
        : await setNormalScreenMode();

    if (!Platform.isWindows) return;
    await showOrHideControls(
      service,
      service.isFullScreen.value ? false : true,
    );
  }

  Future<void> toggleControls(VideoPlayerService service) async {
    service.isShowControllers.value = Platform.isAndroid
        ? !service.isShowControllers.value
        : false;

    await resetInactivityTimer(service);
  }

  Future<void> showOrHideControls(
    VideoPlayerService service,
    bool isShow,
  ) async {
    service.isShowControllers.value = isShow;
  }

  Future<void> changeVerticalBrightness(
    VideoPlayerService service, {
    DragUpdateDetails? details,

    bool isInit = false,
  }) async {
    final delta = details?.primaryDelta ?? 0.0;
    final brightness = isInit ? 10000.0 : service.brightness.value - delta;
    try {
      await ScreenBrightness.instance.setApplicationScreenBrightness(
        (brightness / 100).clamp(0.0, 1.0),
      );
      service.brightness.value = brightness.clamp(0.0, 100.0);
    } catch (e, trace) {
      e.logError(stack: trace, methodName: "changeVerticalBrightness");
    }
  }

  Future<void> changeUiIcon(
    VideoPlayerService service,
    Widget icon,
    GestureArea area,
  ) async {
    service.uiIconTimer?.cancel();
    service.uiIcon.value = icon;
    service.activeGesture.value = area;
    service.uiIconTimer = Timer(
      AppConsts.videoControlsDuration,
      () => service.activeGesture.value = null,
    );
  }

  void showSpeedControlPanel(BuildContext context, VideoPlayerCubit cubit) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        alignment: Alignment.bottomCenter,
        backgroundColor: const Color(0xA8000000),
        insetPadding: const EdgeInsets.all(80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall),
        ),
        child: SpeedControlPanel(playerCubit: cubit),
      ),
    );
  }

  Future<void> disopse(VideoPlayerService service) async {
    await changeVerticalBrightness(service, isInit: true);
  }
}
