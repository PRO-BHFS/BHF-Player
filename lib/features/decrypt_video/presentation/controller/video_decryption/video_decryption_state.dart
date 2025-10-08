import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';

sealed class VideoDecryptionState {
  const VideoDecryptionState();
}

class VideoDecryptionInitial extends VideoDecryptionState {
  const VideoDecryptionInitial();
}

class VideoDecryptionImported extends VideoDecryptionState {
  final VideoEntity video;
  String get filename => video.filename;

  const VideoDecryptionImported(this.video);
}

class VideoDecryptionFailure extends VideoDecryptionState {
  final String errorMessage;

  const VideoDecryptionFailure(this.errorMessage);
}

class VideoDecryptionIncrementProgress extends VideoDecryptionState {
  final double progress;

  const VideoDecryptionIncrementProgress(this.progress);

}

class VideoDecryptionCompleted extends VideoDecryptionState {
  final VideoEntity resultVideo;

  const VideoDecryptionCompleted(this.resultVideo);

}
