import 'dart:async';
import 'package:bhf_player/features/video_player/domain/entities/video_action_state.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayerService {
  VideoPlayerService._();
  static VideoPlayerService? _instance;
  factory VideoPlayerService() => _instance ??= VideoPlayerService._();

  Player? player;
  VideoController? videoController;

  final isFullScreen = ValueNotifier(false);
  final isShowControllers = ValueNotifier(true);
  final isPlaying = ValueNotifier(true);
  final uiIcon = ValueNotifier(const SizedBox() as Widget);
  final playerSliderProgress = ValueNotifier(0.0);
  final volume = ValueNotifier(100.0);
  final brightness = ValueNotifier(1.0);
  final playbackSpeed = ValueNotifier(1.0);
  final videoDuration = ValueNotifier(Duration.zero);
  final currentPosition = ValueNotifier(Duration.zero);
  final activeGesture = ValueNotifier<GestureArea?>(null);
  final isUiLocked = ValueNotifier<bool>(false);
  final aspectRatio = ValueNotifier<AspectRatioPlayer>(
    AspectRatioPlayer.original,
  );
  final videoActionState = ValueNotifier<VideoActionState>(
    const VideoActionState(),
  );
  double lastSpeed = 1.0;

  Timer? inactivityTimer;
  Timer? uiIconTimer;

  bool get isPlayerInitialized => player != null && videoController != null;
  bool get isNotPlayerInitialized => !isPlayerInitialized;

  Future<void> initialize(String videoPath) async {
    player = Player();
    videoController = VideoController(player!);
    await player?.open(Media(videoPath));
  }

  Future<void> dispose() async {
    inactivityTimer?.cancel();
    uiIconTimer?.cancel();

    isFullScreen.dispose();
    isShowControllers.dispose();
    isPlaying.dispose();
    uiIcon.dispose();
    playerSliderProgress.dispose();
    volume.dispose();
    playbackSpeed.dispose();
    videoDuration.dispose();
    currentPosition.dispose();
    activeGesture.dispose();
    isUiLocked.dispose();
    videoActionState.dispose();
    brightness.dispose();
    aspectRatio.dispose();
    await player?.dispose();
    player = null;
    videoController = null;
    _instance = null;
  }
}
