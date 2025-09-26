import 'package:bhf_player/core/presentation/widgets/more_options_button.dart';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_state.dart';
import 'package:bhf_player/features/course/presentation/sheets/exports.dart';
import 'package:bhf_player/features/db_backup/presentation/controller/backup/backup_controller.dart';
import 'package:flutter/material.dart';
import 'package:bhf_player/features/decrypt_video/presentation/screens/import_and_decrypt_video_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'nothing_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BHF Player'),
          actions: [
            BlocProvider<BackupCubit>(
              create: (context) => BackupCubit(context.read<CourseCubit>()),
              child: const MoreOptionsButton(),
            ),
          ],
        ),
        body: BlocSelector<CourseCubit, CourseState, Set<CourseEntity>>(
          selector: (state) => state.courses,
          builder: (context, courses) {
            if (courses.isNotEmpty) return const ImportAndDecryptVideoScreen();

            return NothingScreen(
              imagePath: AppImagesAssests.tutorial,
              textButton: "إضافة دورة",
              textNote: "لم يتم اضافة دورات بعد",
              onPress: () async =>
                  await AddCourseSheet(context).show(title: 'إضافة دورة جديدة'),
            );
          },
        ),
      ),
    );
  }
}
