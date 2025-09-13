import 'package:bhf_player/bhf_studio/lib/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/screens/nothing_screen.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_state.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/sheets/add_course_sheet.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/controllers/encryption_process/encryption_process_cubit.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/controllers/encryption_process/encryption_process_state.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/widgets/encryption_inner_loading.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/widgets/build_video_encryption_panel.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/widgets/uploaded_videos_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoEncryptionScreen extends StatelessWidget {
  const VideoEncryptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EncryptionProcessCubit, EncryptionProcessState>(
      listener: (context, state) {
        if (state is EncryptionCompleted) {
          Notifications.showFlushbar(
            message: state.message,
            iconType: IconType.done,
          );
        }
        if (state is PathsVideosSelected) {
          Notifications.showFlushbar(
            message: state.message,
            iconType: IconType.done,
          );
        }

        if (state is PathsOutputSelected) {
          Notifications.showFlushbar(
            message: state.message,
            iconType: IconType.done,
          );
        }
      },
      child: BlocBuilder<AdminCourseCubit, AdminCourseState>(
        builder: (context, state) {
          final encryptionCubit = context.watch<EncryptionProcessCubit>();

          if (state is CourseLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (context.watch<AdminCourseCubit>().isCoursesEmpty) {
            return NothingScreen(
              textButton: "إضافة دورة",
              textNote: "لم يتم اضافة دورات بعد",
              imagePath: Images.tutorial,
              onPress: () async =>
                  await AddCourseSheet(context).show(title: "إنشاء أول جديدة"),
            );
          }

          return ValueListenableBuilder(
            valueListenable: encryptionCubit.progressTracker.isEncrypting,
            builder: (context, isEncrypting, videosPanel) {
              return ConditionalBuilder(
                condition: isEncrypting,
                builder: (_) => const EncryptionInnerLoading(),
                fallback: (_) => videosPanel,
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(AppSizes.mainPadding),
              child: CustomScrollView(
                slivers: [BuildVideoEncryptionPanel(), UploadedVideosList()],
              ),
            ),
          );
        },
      ),
    );
  }
}
