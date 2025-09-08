import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/widgets/build_current_video_progress.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/widgets/build_progress_overall.dart';
import 'package:flutter/material.dart';

class EncryptionInnerLoading extends StatelessWidget {
  const EncryptionInnerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(AppSizes.mainPadding),

      children: [
        const BuildProgressOverall(),
        const BuildCurrentVideoProgress(),
      ].separatedBy(const SizedBox(height: 30)),
    );
  }
}
