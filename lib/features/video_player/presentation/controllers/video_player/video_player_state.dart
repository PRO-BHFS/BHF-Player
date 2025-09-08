import 'package:equatable/equatable.dart';

abstract class VideoPlayerState extends Equatable {
  const VideoPlayerState();

  @override
  List<Object?> get props => [];
}

class VideoPlayerInitial extends VideoPlayerState {}


class VideoPlayerFailure extends VideoPlayerState {
  final String errorMessage;

  const VideoPlayerFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

