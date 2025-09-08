import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/controllers/encryption_process/encryption_process_cubit.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildProgressOverall extends StatelessWidget {
  const BuildProgressOverall({super.key});

  @override
  Widget build(BuildContext context) {
    final progresTracker = context
        .read<EncryptionProcessCubit>()
        .progressTracker;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Overall Progress"),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xA71B2127),
          ),
          padding: const EdgeInsets.all(AppSizes.secondPadding),
          width: double.infinity,
          height: 100,
          child: Column(
            children: [
              Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: progresTracker.completedVideos,
                    builder: (context, completedVideos, _) =>
                        Text("$completedVideos"),
                  ),
                  const Text("/"),
                  Text("${progresTracker.totalVideos}"),
                  const SizedBox(width: 5),
                  const Text("Videos Encrypted"),

                  const Spacer(),

                  ValueListenableBuilder<double>(
                    valueListenable: progresTracker.overallProgress,
                    builder: (_, overallProgress, _) {
                      return TweenAnimationBuilder(
                        duration: AppConsts.loadingDuration,
                        curve: Curves.easeIn,

                        tween: Tween(begin: overallProgress, end: overallProgress),
                        builder: (context, value, child) {
                      final progress = (value * 100).round();
                          return Text("$progress%");
                        },
                      );
                    },
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: progresTracker.overallProgress,
                builder: (context, overallProgress, _) {
                  return TweenAnimationBuilder<double>(
                    curve: Curves.easeIn,
                    duration: AppConsts.loadingDuration,

                    tween: Tween(begin: overallProgress, end: overallProgress),
                    builder: (context, progress, _) {
                      return LinearProgressIndicator(value: progress);
                    },
                  );
                },
              ),
            ].separatedBy(const SizedBox(height: 20)),
          ),
        ),
      ].separatedBy(const SizedBox(height: 10)),
    );
  }
}
