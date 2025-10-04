import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/presentation/widgets/text_tag.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';
import 'package:bhf_player/features/video_info/video_info_exports.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:bhf_player/features/video_player/presentation/screens/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'video_card_thumbnail.dart';

class BuildVideoCard extends StatelessWidget {
  const BuildVideoCard(this.video, {super.key});

  final VideoEntity video;

  VideoMetadata get metadata => video.metadata;

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
              spacing: 10,

              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        video.filename,
                        maxLines: 2,
                        style: textTheme.titleMedium?.copyWith(fontSize: 15),
                      ),
                    ),
                    const BuildIcon(Icons.arrow_forward_ios_rounded),
                  ],
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10,
                    children: [
                      TextTag(text: metadata.formatBytes(metadata.fileSize)),
                      if (video.metadata.date != null)
                        TextTag(text: "${video.metadata.date}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
