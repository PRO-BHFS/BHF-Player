import 'package:bhf_player/core/native_codes/file_intent_handler.dart';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_state.dart';
import 'package:bhf_player/features/course/presentation/sheets/exports.dart';
import 'package:bhf_player/features/decrypt_video/presentation/screens/video_import_screen.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'empty_state_screen.dart';

class CourseSetupScreen extends StatefulWidget {
  const CourseSetupScreen({super.key});

  @override
  State<CourseSetupScreen> createState() => _CourseSetupScreenState();
}

class _CourseSetupScreenState extends State<CourseSetupScreen> {
  String? sharedFilePath;

  @override
  void initState() {
    super.initState();

    // عند فتح التطبيق بملف
    FileIntentHandler.getInitialFile().then((initialFile) {
      if (initialFile != null) setState(() => sharedFilePath = initialFile);
    });

    // أثناء عمل التطبيق
    FileIntentHandler.listenNewFiles((path) {

      Notifications.showFlushbar(
        message: "تم استقبال ملف جديد أثناء عمل التطبيق",
        iconType: IconType.done,
      );
      setState(() => sharedFilePath = path);
    });
  }

  @override
  Widget build(BuildContext context) {

    return BlocSelector<CourseCubit, CourseState, Set<CourseEntity>>(
      selector: (state) => state.courses,
      builder: (context, courses) {

        if (courses.isNotEmpty) {
          return VideoImportScreen(sharedFilePath: sharedFilePath);
        }

        return EmptyStateScreen(
          imagePath: AppImagesAssests.tutorial,
          textButton: S.of(context).add_course,
          textNote: S.of(context).no_courses_added_yet,
          onPress: () async => await AddCourseSheet(
            context,
          ).show(title: S.of(context).add_new_course),
        );
      },
    );
  }
}
