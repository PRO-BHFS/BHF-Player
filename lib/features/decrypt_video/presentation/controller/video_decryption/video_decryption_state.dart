import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';
import 'package:equatable/equatable.dart';

sealed class VideoDecryptionState extends Equatable {
  const VideoDecryptionState();

  @override
  List<Object?> get props => [];
}

class VideoDecryptionInitial extends VideoDecryptionState {}

class VideoDecryptionImported extends VideoDecryptionState {
  final VideoEntity video;
  String get filename => video.filename;

  const VideoDecryptionImported(this.video);

  @override
  List<Object?> get props => [video];
}

class VideoDecryptionFailure extends VideoDecryptionState {
  final String errorMessage;

  const VideoDecryptionFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class VideoDecryptionIncrementProgress extends VideoDecryptionState {
  final double progress;

  const VideoDecryptionIncrementProgress(this.progress);

  @override
  List<Object?> get props => [progress];
}

class VideoDecryptionCompleted extends VideoDecryptionState {
  final VideoEntity resultVideo;

  const VideoDecryptionCompleted(this.resultVideo);

  @override
  List<Object?> get props => [resultVideo];
}

