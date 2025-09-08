import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/controllers/encryption_process/encryption_process_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'video_info_card.dart';

class UploadedVideosList extends StatelessWidget {
  const UploadedVideosList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EncryptionProcessCubit>();
    final header = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          const Text("قائمة الفيديوهات:"),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "Total Videos: ",
                  style: context.textTheme.labelSmall,
                  children: [
                    TextSpan(
                      text: "${controller.totalVideosCount}",
                      style: context.textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Full Size: ",
                  style: context.textTheme.labelSmall,
                  children: [
                    TextSpan(
                      text: "${controller.totalVideosSizes} MB",
                      style: context.textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    if (!controller.hasSelectedVideos) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.mainPadding),
          child: Text(
            "لم يتم اختيار فيديوهات بعد",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    // lazy load للفيديوهات
    return SliverList.builder(
      addAutomaticKeepAlives: false,
      itemCount: controller.totalVideosCount + 1,
      itemBuilder: (context, index) {
        if (index == 0) return header;
        final video = controller.videos[index - 1];
        
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: VideoInfoCard(video: video),
        );
      },
    );
  }
}
