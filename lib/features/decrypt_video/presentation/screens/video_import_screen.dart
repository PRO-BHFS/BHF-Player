import 'package:bhf_player/core/presentation/components/buttons/build_button.dart';
import 'package:bhf_player/core/presentation/components/build_progress_loading.dart';
import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/core/presentation/components/icons/build_svg_icon.dart';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/course/presentation/widgets/courses_panel.dart';
import 'package:bhf_player/features/decrypt_video/presentation/controller/video_decryption/video_decryption_cubit.dart';
import 'package:bhf_player/features/decrypt_video/presentation/controller/video_decryption/video_decryption_state.dart';
import 'package:bhf_player/features/decrypt_video/presentation/widgets/decrypt_play_button.dart';
import 'package:bhf_player/features/device_id/presentation/widgets/device_id_panel.dart';
import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:bhf_player/features/video_player/presentation/screens/video_player_screen.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoImportScreen extends StatelessWidget {
  const VideoImportScreen({super.key, this.sharedFilePath});
  final String? sharedFilePath;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoDecryptionCubit, VideoDecryptionState>(
      listener: (context, state) async {
        if (state is VideoDecryptionImported) {
          Notifications.showFlushbar(
            message:
                "${S.of(context).file_imported_successfully} ${state.filename}",
            iconType: IconType.done,
          );
        }

        if (state is VideoDecryptionCompleted) {
          context.read<VideoDecryptionCubit>().addState(state);
          await context.pushRoute(
            BlocProvider<VideoPlayerCubit>(
              create: (context) => VideoPlayerCubit(),
              child: VideoPlayerScreen(state.resultVideo),
            ),
          );
          if (!context.mounted) return;
          context.read<VideoDecryptionCubit>().resetState();
        }

        if (state is VideoDecryptionFailure) {
          Notifications.showFlushbar(
            message: state.errorMessage,
            iconType: IconType.error,
          );
        }
      },
      builder: (context, state) {
        final videoCubit = context.read<VideoDecryptionCubit>();
        final videoWatchCubit = context.watch<VideoDecryptionCubit>();
        final selectedFile = videoWatchCubit.selectedVideoName;
        final isLoading = context
            .watch<VideoDecryptionCubit>()
            .progressProcess
            .isLoading;
        final isVideoSelected = context
            .watch<VideoDecryptionCubit>()
            .isVideoSelected;

        final theme = context.theme;
        if (sharedFilePath != null) {
          videoCubit.selectSharedFile(sharedFilePath!).then((_) {});
        }
        return ListView(
          padding: const EdgeInsets.all(AppSizes.mainPadding),
          shrinkWrap: true,
          children: [
            const DeviceIdPanel(),
            const CoursesPanel(),
            const SizedBox(height: AppSizes.spacingSmall),

            BuildButton(
              text: S.of(context).choose_encrypted_file,
              icon: const BuildSvgIcon(AppIconsAssests.file),
              onPress: () async => await videoCubit.pickVideo(),
            ),
            const SizedBox(height: AppSizes.spacingSmall),

            if (isVideoSelected)
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 3,
                children: [
                  Text(
                    S.of(context).selected,
                    style: theme.textTheme.labelMedium,
                  ),
                  Text(
                    selectedFile,
                    style: theme.textTheme.labelSmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            else
              Row(
                spacing: 7,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      S.of(context).no_file_selected_yet,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: context.theme.disabledColor,
                      ),
                    ),
                  ),
                  BuildIcon(
                    Icons.info_rounded,
                    color: context.theme.disabledColor,
                  ),
                ],
              ),

            const SizedBox(height: AppSizes.spacingSmall),

            isLoading
                ? const BuildProgressLoading()
                : const DecryptAndPlayButton(),
          ].separatedBy(const SizedBox(height: AppSizes.spacingMiddle)),
        );
      },
    );
  }
}
