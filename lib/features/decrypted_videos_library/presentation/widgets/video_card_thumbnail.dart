import 'dart:io';

import 'package:bhf_player/core/presentation/widgets/text_tag.dart';
import 'package:bhf_player/core/utils/app_constants/app_assests/app_images_assests.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';
import 'package:bhf_player/features/language/presentation/controllers/language/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoCardThumbnail extends StatelessWidget {
  const VideoCardThumbnail(this.video, {super.key});

  final VideoEntity video;

  @override
  Widget build(BuildContext context) {
    final ImageProvider image = video.thumbnailPath != null
        ? FileImage(File(video.thumbnailPath!))
        : const AssetImage(AppImagesAssests.error);
    return Stack(
      children: [
        Container(
          height: 80,
          width: 130,
          decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Positioned.directional(
          textDirection: context.read<LanguageCubit>().language.textDirection,
          start: 5,
          bottom: 5,
          child: TextTag(
            text: video.metadata.duration?.formattedVideoDuration ?? "--:--",
            backgroundColor: Colors.black87,
          ),
        ),
      ],
    );
  }
}
