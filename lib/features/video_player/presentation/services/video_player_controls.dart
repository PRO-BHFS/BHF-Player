import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:flutter/material.dart';
import 'package:bhf_player/core/utils/app_constants/app_constants.dart';
import 'package:volume_controller/volume_controller.dart';
import 'video_player_service.dart';

class PlayerControls {
  PlayerControls._();
  static PlayerControls? _instance;
  factory PlayerControls() => _instance ??= PlayerControls._();

  void seekTo(VideoPlayerService service, double value) {
    if (service.videoDuration.value.inMilliseconds <= 0) return;
    final seekTo = service.videoDuration.value * value;
    service.player?.seek(seekTo);
  }

  void seekHorizontal(VideoPlayerService service, DragUpdateDetails details) {
    final delta = details.primaryDelta;
    if (service.isNotPlayerInitialized || delta == null) return;
    if (delta > 0) {
      service.player?.seek(
        service.currentPosition.value + AppConsts.seekStepDuration,
      );
    } else if (delta < 0) {
      service.player?.seek(
        service.currentPosition.value - AppConsts.seekStepDuration,
      );
    }
  }

  Future<void> changeVerticalVolume(
    VideoPlayerService service,
    DragUpdateDetails details,
  ) async {
    final delta = details.primaryDelta ?? 0;
    if (service.isNotPlayerInitialized) return;
    final newVolume = service.volume.value - delta;
    await _changeVolume(service, newVolume);
  }

  Future<void>? backward(VideoPlayerService service) => service.player?.seek(
    service.currentPosition.value - AppConsts.seekStepDuration,
  );

  Future<void> forward(VideoPlayerService service) async {
    await service.player?.seek(
      service.currentPosition.value + AppConsts.seekStepDuration,
    );
  }

  Future<void> playOrPause(VideoPlayerService service) async {
    await service.player?.playOrPause();
  }

  Future<void> changePlaybackSpeed(
    VideoPlayerService service,
    double speed,
  ) async {
    service.lastSpeed = service.playbackSpeed.value;
    final fitSpeed = speed.toStringAsFixed(2).toDouble.clamp(0.25, 4.0);
    await service.player?.setRate(fitSpeed);

    final isSpeedControlActive = (fitSpeed != 1.0);
    final videoActions = service.videoActionState.value;

    service.videoActionState.value = videoActions.copyWith(
      isSpeedControlActive: isSpeedControlActive,
    );

    // return fitSpeed;
  }

  Future<void> incrementPlaybackSpeed(
    VideoPlayerService service,
    double incrementValue,
  ) async {
    final updatedSpeed = service.playbackSpeed.value + incrementValue;
    await changePlaybackSpeed(service, updatedSpeed);
  }

  Future<void> decremntPlaybackSpeed(
    VideoPlayerService service,
    double decrementValue,
  ) => incrementPlaybackSpeed(service, -1 * decrementValue);

  Future<void> _changeVolume(
    VideoPlayerService service,
    double newVolume,
  ) async {
    await VolumeController.instance.setVolume(
      (newVolume / 100).clamp(0.0, 1.0),
    );
    service.volume.value = newVolume;
  }

  void toggleUiLock(VideoPlayerService service) {
    service.isUiLocked.value = !service.isUiLocked.value;
  }

  void toggleThemePlayerUi(VideoPlayerService service) {
    final actionState = service.videoActionState.value;
    final isDarkModeActive = !actionState.isDarkModeActive;
    service.videoActionState.value = actionState.copyWith(
      isDarkModeActive: isDarkModeActive,
    );
  }

  Future<void> toggleMute(VideoPlayerService service) async {
    final actionState = service.videoActionState.value;
    final isMuted = !actionState.isMuted;

    service.videoActionState.value = actionState.copyWith(isMuted: isMuted);
    await service.player?.setVolume(isMuted ? 0.0 : 100.0);
  }
}
