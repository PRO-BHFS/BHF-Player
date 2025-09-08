import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit_video/media_kit_video.dart';
class VideoPlayerView extends StatelessWidget {
  const VideoPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: context
          .watch<VideoPlayerCubit>()
          .playerService
          .isPlayerInitialized,
      builder: (_) => Video(
        controller: context
            .read<VideoPlayerCubit>()
            .playerService
            .videoController!,
        controls: null,
      ),
      fallback: (_) => const Center(child: CircularProgressIndicator()),
    );
  }
}
