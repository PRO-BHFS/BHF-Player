import 'package:equatable/equatable.dart';

abstract class EncryptionProcessState extends Equatable {
  const EncryptionProcessState();

  @override
  List<Object?> get props => [];
}

class InitialState extends EncryptionProcessState {}

class PathsVideosSelected extends EncryptionProcessState {
  final int videosLength;
  final String message;

  const PathsVideosSelected(this.message, this.videosLength);

  @override
  List<Object?> get props => [message,videosLength];
}

class PathsOutputSelected extends EncryptionProcessState {
  final String message;

  const PathsOutputSelected(this.message);

  @override
  List<Object?> get props => [message];
}

class EncryptionProcessing extends EncryptionProcessState {}

class EncryptionCompleted extends EncryptionProcessState {
  final String message;
  const EncryptionCompleted(this.message);

  @override
  List<Object?> get props => [message];
}

class VideoListUpdated extends EncryptionProcessState {
  final int videosLength;
  const VideoListUpdated(this.videosLength);

  @override
  List<Object?> get props => [videosLength];
}

class ErrorsHandler extends EncryptionProcessState {
  final String message;
  const ErrorsHandler(this.message);

  @override
  List<Object?> get props => [message];
}
