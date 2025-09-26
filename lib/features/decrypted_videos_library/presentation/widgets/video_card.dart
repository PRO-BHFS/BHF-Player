import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/presentation/widgets/text_tag.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/decrypted_videos_library/domain/entities/decrypted_video.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:bhf_player/features/video_player/presentation/screens/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'video_card_thumbnail.dart';

class BuildVideoCard extends StatelessWidget {
  const BuildVideoCard(this.video, {super.key});

  final DecryptedVideo video;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return GestureDetector(
      onTap: () async => context.pushRoute(
        BlocProvider<VideoPlayerCubit>(
          create: (context) => VideoPlayerCubit(),
          child: VideoPlayerScreen(video),
        ),
      ),

      child: Row(
        spacing: AppSizes.spacingMiddle,
        children: [
          VideoCardThumbnail(video),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSizes.spacingSmall,
              children: [
                Text(
                  video.filename,
                  maxLines: 2,
                  style: textTheme.titleMedium?.copyWith(fontSize: 15),
                ),

                TextTag(text: "${video.sizeInMegaBytes} MB"),
              ],
            ),
          ),
          const BuildIcon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }
}
