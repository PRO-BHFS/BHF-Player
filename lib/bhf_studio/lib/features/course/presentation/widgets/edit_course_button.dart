import 'package:bhf_player/bhf_studio/lib/core/presentation/components/buttons/icon_button.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/ui_helpers/edit_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCourseButton extends StatelessWidget {
  const EditCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final currentCourse = context.watch<AdminCourseCubit>().currentCourse;

    return BuildIconButton(
      icon: const CircleAvatar(
        backgroundColor: Color(0xFF6DABFD),
        foregroundColor: Colors.white,
        child: Icon(Icons.edit),
      ),
      onPressed: () async => await editCourse(context, currentCourse),
    );
  }
}
