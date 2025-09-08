import 'package:bhf_player/bhf_studio/lib/core/presentation/components/buttons/icon_button.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/ui_helpers/delete_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteCourseButton extends StatelessWidget {
  const DeleteCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final currentCourse = context.watch<AdminCourseCubit>().currentCourse;

    return BuildIconButton(
      icon: const CircleAvatar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: Icon(Icons.delete),
      ),
      onPressed: () async => await deleteCourse(context, currentCourse,
      ),
    );
  }
}
