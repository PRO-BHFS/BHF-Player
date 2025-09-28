import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayerView extends StatelessWidget {
  const VideoPlayerView(this.video, {super.key});

  final VideoEntity video;
  @override
  Widget build(BuildContext context) {
    final playerService = context.read<VideoPlayerCubit>().playerService;
    final isPlayerInitialized = context
        .watch<VideoPlayerCubit>()
        .playerService
        .isPlayerInitialized;

    return ConditionalBuilder(
      condition: isPlayerInitialized,
      builder: (_) => Stack(
        alignment: Alignment.center,

        children: [
          ValueListenableBuilder(
            valueListenable: playerService.asepectRatio,
            builder: (_, asepectRatio, _) {
              final ratioValue = switch (asepectRatio) {
                AspectRatioPlayer.fit => asepectRatio.value,
                AspectRatioPlayer.original => video.metadata.aspectRatio,
                AspectRatioPlayer.fill => context.devicePixelRatio,
              };

              return Video(
                controller: playerService.videoController!,
                aspectRatio: ratioValue,
                fit: asepectRatio.isFill ? BoxFit.fill : BoxFit.contain,
                controls: null,
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: context
                .watch<VideoPlayerCubit>()
                .playerService
                .videoActionState,
            builder: (context, videoAction, darkOverlay) {
              return videoAction.isDarkModeActive
                  ? darkOverlay!
                  : const SizedBox.shrink();
            },
            child: const Positioned.fill(
              child: Material(color: Color(0x9E000000)),
            ),
          ),
        ],
      ),
      fallback: (_) => const Center(child: CircularProgressIndicator()),
    );
  }
}
