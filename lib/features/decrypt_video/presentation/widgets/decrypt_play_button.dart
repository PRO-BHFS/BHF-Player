import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart'
    show AppIconsAssests;
import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/decrypt_video/presentation/controller/video_decryption/video_decryption_cubit.dart';
import 'package:bhf_player/features/decrypt_video/presentation/controller/video_decryption/video_decryption_state.dart';
import 'package:bhf_player/features/device_id/presentation/controller/device_id/device_id.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DecryptAndPlayButton extends StatelessWidget {
  const DecryptAndPlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoDecryptionCubit, VideoDecryptionState>(
      builder: (context, state) {
        final isVideoNotSelected = context
            .watch<VideoDecryptionCubit>()
            .isVideoNotSelected;
        final courseCubit = context.read<CourseCubit>();
        final videoCubit = context.read<VideoDecryptionCubit>();
        final icon = BuildSvgIcon(
          AppIconsAssests.playCircle,
          isDisabled: isVideoNotSelected,
        );
        return BuildButton(
          text: S.of(context).play_video,
          icon: icon,
          onPress: isVideoNotSelected
              ? null
              : () async {
                  await videoCubit.playVideo(
                    selectedCourse: courseCubit.currentCourse,
                    userId: context.read<DeviceIdCubit>().userId,
                  );
                },
        );
      },
    );
  }
}
