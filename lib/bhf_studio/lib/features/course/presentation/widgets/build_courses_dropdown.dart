import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildCoursesDropdown extends StatelessWidget {
  const BuildCoursesDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCourseCubit, AdminCourseState>(
      listener: (context, state) {
        if (state case CourseAdded(:final course)) {
          Notifications.showFlushbar(
            message: "تم اضافة دورة ${course.title} بنجاح",
            iconType: IconType.done,
          );
        }
        if (state case CourseRemoved(:final course)) {
          Notifications.showFlushbar(
            message: 'تم حذف دورة ${course.title} بنجاح',
            iconType: IconType.done,
          );
        }
        if (state is CourseUpdated) {
          Notifications.showFlushbar(
            message: 'تم تعديل الدورة بنجاح',
            iconType: IconType.done,
          );
        }
      },
      builder: (context, state) {
        final controller = context.watch<AdminCourseCubit>();

        if (state is CourseLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Tooltip(
          message: "Encryption Code: ${controller.currentEncryptionCode}",

          child: DropdownMenu<int>(
            key: UniqueKey(),
            initialSelection: controller.currentSelectedCourseId,
            maxLines: 1,
            width: double.infinity,
            requestFocusOnTap: false,
            leadingIcon: const Icon(Icons.school),
            menuStyle: MenuStyle(
              maximumSize: WidgetStatePropertyAll(
                Size(context.widthExceptPadding - 16, 200),
              ),
              alignment: AlignmentDirectional.bottomStart,
            ),

            dropdownMenuEntries: controller.courses.map((course) {
              return DropdownMenuEntry<int>(
                value: course.id!,
                label: course.title,

                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.all(AppSizes.secondPadding),
                  ),
                ),
              );
            }).toList(),
            onSelected: (courseId) async =>
                await controller.selectCourse(courseId),
          ),
        );
      },
    );
  }
}
