import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/domain/entities/course.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/sheets/base_course_sheet.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCourseSheet extends BaseCourseSheet {
  EditCourseSheet._(this.course, {required super.context});

  final CourseEntity? course;

  factory EditCourseSheet(
    CourseEntity? course, {
    required BuildContext context,
  }) {
    return EditCourseSheet._(course, context: context);
  }

  @override
  Future<void> onSubmit(BuildContext sheetContext) async {
    if (keyForm.currentState?.validate() != true) return;
    if (course == null) return;

    await context.read<AdminCourseCubit>().updateCourse(
      course!.copyWith(
        title: courseNameController.text,
        encryptionCode: encryptionCodeController.text,
      ),
    );

    if (sheetContext.mounted) sheetContext.popRoute();
  }

  @override
  Future<void> show({required String title}) async {
    courseNameController.text = course?.title ?? '';
    encryptionCodeController.text = course?.encryptionCode ?? '';
    await super.show(title: title);
  }
}
