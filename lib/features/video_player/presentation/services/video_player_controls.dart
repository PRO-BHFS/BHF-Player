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

  Future<void> backward(VideoPlayerService service) async {
    await service.player?.seek(
      service.currentPosition.value - AppConsts.seekStepDuration,
    );
  }

  Future<void> forward(VideoPlayerService service) async {
    await service.player?.seek(
      service.currentPosition.value + AppConsts.seekStepDuration,
    );
  }

  Future<void> playOrPause(VideoPlayerService service) async {
    await service.player?.playOrPause();
  }

  void changePlaybackSpeed(VideoPlayerService service, double speed) =>
      service.player?.setRate(speed);

  Future<void> _changeVolume(
    VideoPlayerService service,
    double newVolume,
  ) async {
    await VolumeController.instance.setVolume(
      (newVolume / 100).clamp(0.0, 1.0),
    );
    service.volume.value = newVolume;
  }
}
