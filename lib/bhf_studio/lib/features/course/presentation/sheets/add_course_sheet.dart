
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/domain/entities/course.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/sheets/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCourseSheet extends BaseCourseSheet {
  AddCourseSheet._({required super.context});

  factory AddCourseSheet(BuildContext context) {
    return AddCourseSheet._(context: context);
  }

  @override
  Future<void> onSubmit(BuildContext sheetContext) async {
    if (keyForm.currentState?.validate() != true) return;

    final course = CourseEntity(
      title: courseNameController.text,
      encryptionCode: encryptionCodeController.text,
    );
    await context.read<AdminCourseCubit>().addCourse(course);
    if (sheetContext.mounted) sheetContext.popRoute();
  }
}
