import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart'
    show AppIconsAssests;
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/course/presentation/sheets/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCourseButton extends StatelessWidget {
  const EditCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final currentCourse = context.watch<UserCourseCubit>().currentCourse;

    return CircleIconButton(
      circleColor: context.colorScheme.secondary,
      onPressed: () async => await EditCourseSheet(
        currentCourse,
        context: context,
      ).show(title: 'تعديل الدورة'),
      icon: const BuildSvgIcon(AppIconsAssests.edit),
    );
  }
}
