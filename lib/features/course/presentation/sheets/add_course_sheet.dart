import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:bhf_player/features/course/domain/entities/sub_entity/course_password.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/course/presentation/sheets/base_course_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCourseSheet extends BaseCourseSheet {
  AddCourseSheet._({required super.context});

  factory AddCourseSheet({required BuildContext context}) {
    return AddCourseSheet._(context: context);
  }

  @override
  Future<void> onSubmit(BuildContext sheetContext) async {
    if (keyForm.currentState?.validate() != true) return;

    final course = CourseEntity(
      courseTitle: courseNameController.text,
      password: CoursePassword(passwordController.text),
    );
    await context.read<UserCourseCubit>().addCourse(course);
    if (context.mounted) context.popRoute();
  }
}
