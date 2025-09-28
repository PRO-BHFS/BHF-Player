import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:bhf_player/features/video_player/presentation/services/video_player_controls.dart';
import 'package:bhf_player/features/video_player/presentation/services/video_player_listeners.dart';
import 'package:bhf_player/features/video_player/presentation/services/video_player_service.dart';
import 'package:bhf_player/features/video_player/presentation/services/player_ui.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  final playerService = VideoPlayerService();
  final playerControls = PlayerControls();
  final playerListeners = PlayerListeners();
  final playerUi = PlayerUi();

  VideoPlayerCubit() : super(VideoPlayerInitial());

  Future<void> initializeVideoPlayer(String? path) async {
    try {
      if (path == null) throw PathException(S.current.no_video_in_path);
      await playerService.initialize(path);
      playerListeners.listenPlayer(playerService);
      await playerUi.resetInactivityTimer(playerService);
      await toggleFullscreen();
    } catch (_) {
      emit(VideoPlayerFailure(S.current.cannot_play_video_error));
    }
  }

  void resetInactivityTimer() => playerUi.resetInactivityTimer(playerService);

  void seekTo(double value) {
    playerControls.seekTo(playerService, value);
  }

  Future<void> seekHorizontal(DragUpdateDetails details) async {
    await playerUi.showOrHideControls(playerService, true);
    playerControls.seekHorizontal(playerService, details);
  }

  Future<void> changeVerticalVolume(DragUpdateDetails details) async {
    await playerControls.changeVerticalVolume(playerService, details);
  }

  Future<void> changeVerticalBrightness(DragUpdateDetails details) async {
    await playerUi.changeVerticalBrightness(playerService, details: details);
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

  void changeAspectRatio() {
    playerService.aspectRatio.value = playerService.aspectRatio.value
        .switchAspect();
  }

  Future<double> changePlaybackSpeed(double speed) async =>
      await playerControls.changePlaybackSpeed(playerService, speed);

  Future<void> toggleFullscreen() async {
    await playerUi.toggleFullscreen(playerService);
  }

  Future<void> toggleControls() async =>
      await playerUi.toggleControls(playerService);

  void toggleUiLock() => playerControls.toggleUiLock(playerService);
  void toggleThemePlayerUi() =>
      playerControls.toggleThemePlayerUi(playerService);
  Future<void> toggleMute() async =>
      await playerControls.toggleMute(playerService);

  Future<void> disposePlayer() async {
    emit(VideoPlayerInitial());
    await playerUi.disopse(playerService);
    await playerService.dispose();
  }
}
