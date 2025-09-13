import 'package:bhf_player/bhf_studio/lib/core/presentation/components/buttons/circle_icon_button.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/components/icons/build_svg_icon.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/assests/icons.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/sheets/delete_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteCourseButton extends StatelessWidget {
  const DeleteCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final currentCourse = context.watch<AdminCourseCubit>().currentCourse;

    return CircleIconButton(
      circleColor: context.colorScheme.secondary,

      onPressed: () async => await deleteCourse(context, currentCourse),
      icon: const BuildSvgIcon(IconsAssets.delete),
    );
  }
}
