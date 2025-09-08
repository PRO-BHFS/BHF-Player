import 'video_player_service.dart';

class PlayerListeners {
  PlayerListeners._();
  static PlayerListeners? _instance;
  factory PlayerListeners() => _instance ??= PlayerListeners._();

  void listenPlayer(VideoPlayerService service) {
    listenVideoProgress(service);
    listenIsPlaying(service);
    listenPlaybackSpeed(service);
    listenVolume(service);
  }

  void listenIsPlaying(VideoPlayerService service) {
     service.player?.stream.playing.listen((isPlaying) {
      service.isPlaying.value = isPlaying;
    });
  }

  void listenVolume(VideoPlayerService service) {
service.player?.stream.volume.listen((volume) {
      service.volume.value = volume;
    });
  }

  void listenPlaybackSpeed(VideoPlayerService service) {
   service.player?.stream.rate.listen((rate) {
      service.playbackSpeed.value = rate;
    });
  }

  void listenVideoProgress(VideoPlayerService service) {
service.player?.stream.position.listen((position) {
      service.videoDuration.value = service.player!.state.duration;
      service.currentPosition.value = position;
      service.playerSliderProgress.value =
          service.videoDuration.value.inMilliseconds > 0
          ? position.inMilliseconds / service.videoDuration.value.inMilliseconds
          : 0.0;
    });
  }
}
