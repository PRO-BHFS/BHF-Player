import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:bhf_player/features/video_player/presentation/services/video_player_controls.dart';
import 'package:bhf_player/features/video_player/presentation/services/video_player_listeners.dart';
import 'package:bhf_player/features/video_player/presentation/services/video_player_service.dart';
import 'package:bhf_player/features/video_player/presentation/services/player_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  final VideoPlayerService playerService = VideoPlayerService();
  final PlayerControls playerControls = PlayerControls();
  final PlayerListeners playerListeners = PlayerListeners();
  final PlayerUi playerUi = PlayerUi();

  VideoPlayerCubit() : super(VideoPlayerInitial());

  Future<void> initializeVideoPlayer(String path) async {
    try {
      await playerService.initialize(path);
      playerListeners.listenPlayer(playerService);
      await playerUi.resetInactivityTimer(playerService);
      await toggleFullscreen();
    } catch (_) {
      emit(const VideoPlayerFailure("لا يمكنك تشغيل الفيديو"));
    }
  }

  void resetInactivityTimer() => playerUi.resetInactivityTimer(playerService);

  void seekTo(double value) {
    playerControls.seekTo(playerService, value);
  }

  void seekHorizontal(DragUpdateDetails details) {
    playerControls.seekHorizontal(playerService, details);
  }

  Future<void> changeVerticalVolume(DragUpdateDetails details) async {
    await playerControls.changeVerticalVolume(playerService, details);
  }

  Future<void> changeVerticalBrightness(DragUpdateDetails details) async {
    await playerUi.changeVerticalBrightness(playerService,details: details);
  }

  Future<void> changeUiIcon({
    required Widget icon,
    required GestureArea area,
  }) => playerUi.changeUiIcon(playerService, icon, area);

  Future<void> backward() async {
    await playerControls.backward(playerService);
  }

  Future<void> forward() async {
    await playerControls.forward(playerService);
  }

  Future<void> playOrPause() async {
    await playerControls.playOrPause(playerService);
  }

  void changePlaybackSpeed(double speed) =>
      playerControls.changePlaybackSpeed(playerService, speed);

  Future<void> toggleFullscreen() async {
    await playerUi.toggleFullscreen(playerService);
  }

  void toggleControls() => playerUi.toggleControls(playerService);

  Future<void> disposePlayer() async {
    await playerService.dispose();
  }
}
