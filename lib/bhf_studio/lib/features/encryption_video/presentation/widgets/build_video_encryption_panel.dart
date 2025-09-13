import 'package:bhf_player/bhf_studio/lib/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/widgets/build_courses_dashboard.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/controllers/encryption_process/encryption_process_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildVideoEncryptionPanel extends StatelessWidget {
  const BuildVideoEncryptionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final courseCubit = context.read<AdminCourseCubit>();
    final encryptionCubit = context.read<EncryptionProcessCubit>();
    final encryptionWatchCubit = context.watch<EncryptionProcessCubit>();

    return SliverList.list(
      children: [
        const BuildCoursesDashboard(),

        BuildButton(
          text: 'اختيار فيديوهات',
          onPress: () async => await encryptionCubit.pickVideos(),
        ),

        BuildButton(
          text: 'اختيار مجلد الحفظ',
          onPress: () async => await encryptionCubit.selectOutputDirectory(),
        ),

        ValueListenableBuilder(
          valueListenable: encryptionCubit.outputDirectory,
          builder: (context, outputPath, child) {
            return Text(
              encryptionCubit.hasOutputDirectory
                  ? 'سيتم حفظ الفيديوهات في:\n $outputPath'
                  : 'لم يتم اختيار مسار الحفظ بعد.',
              textAlign: TextAlign.center,
            );
          },
        ),
        BuildButton(
          text: 'تشفير الفيديوهات',
          onPress: encryptionWatchCubit.isReadyVideo
              ? () async => await encryptionCubit.encryptSelectedVideos(
                  courseCubit.currentEncryptionCode,
                )
              : null,
        ),
      ].separatedBy(const SizedBox(height: 30)),
    );
  }
}
