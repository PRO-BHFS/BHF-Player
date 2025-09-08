import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/controllers/encryption_process/encryption_process_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildCurrentVideoProgress extends StatelessWidget {
  const BuildCurrentVideoProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final progresTracker = context
        .read<EncryptionProcessCubit>()
        .progressTracker;

    return Column(
      spacing: 12,
      children: [
        ValueListenableBuilder(
          valueListenable: progresTracker.currentVideoTitle,
          builder: (context, currentVideoTitle, _) {
            return Text(
              currentVideoTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            );
          },
        ),

        Stack(
          alignment: Alignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: progresTracker.currentVideoProgress,
              builder: (context, videoProgress, child) {
                return TweenAnimationBuilder<double>(
                  duration: AppConsts.loadingDuration,
                  curve: Curves.ease,

                  tween: Tween(begin: videoProgress, end: videoProgress),
                  builder: (_, progress, _) {
                    return SizedBox(
                      width: context.widthExceptPadding * 0.4,
                      height: context.widthExceptPadding * 0.4,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 8,
                        strokeCap: StrokeCap.round,
                      ),
                    );
                  },
                );
              },
            ),
            Column(
              children: [
                ValueListenableBuilder(
                  valueListenable: progresTracker.currentVideoProgress,
                  builder: (_, videoProgress, _) {
                    return TweenAnimationBuilder<double>(
                      duration: AppConsts.loadingDuration,
                      curve: Curves.easeIn,

                      tween: Tween(begin: videoProgress, end: videoProgress),
                      builder: (context, value, child) {
                        final progress = (value * 100).round();
                        return Text(
                          "$progress%",
                          textScaler: const TextScaler.linear(3),
                        );
                      },
                    );
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Part"),
                    const SizedBox(width: 5),
                    ValueListenableBuilder(
                      valueListenable: progresTracker.completedParts,
                      builder: (context, completedParts, _) =>
                          Text("$completedParts"),
                    ),
                    const Text("/"),
                    ValueListenableBuilder(
                      valueListenable: progresTracker.partsPerCurrentVideo,
                      builder: (context, partsPerVideo, _) =>
                          Text("$partsPerVideo"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ].separatedBy(const SizedBox(height: 30)),
    );
  }
}
