import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_state.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildCoursesDropdown extends StatelessWidget {
  const BuildCoursesDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseCubit, CourseState>(
      listener: (context, state) {
        if (state case CourseAdded(:final course)) {
          Notifications.showFlushbar(
            message:
                "${S.of(context).course_added_successfully} ${course.courseTitle}",
            iconType: IconType.done,
          );
        }
        if (state case CourseRemoved(:final course)) {
          Notifications.showFlushbar(
            message:
                '${S.of(context).course_deleted_successfully} ${course.courseTitle}',
            iconType: IconType.done,
          );
        }
        if (state is CourseUpdated) {
          Notifications.showFlushbar(
            message: S.of(context).course_updated_successfully,
            iconType: IconType.done,
          );
        }
      },
      builder: (context, state) {
        final controller = context.watch<CourseCubit>();
        final textTheme = context.textTheme;

        if (state is CourseLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        return DropdownMenu<int>(
          key: UniqueKey(),
          initialSelection: controller.currentSelectedCourseId,
          maxLines: 1,
          width: double.infinity,
          requestFocusOnTap: false,
          trailingIcon: const BuildIcon(Icons.keyboard_arrow_down_rounded),
          selectedTrailingIcon: const BuildIcon(
            Icons.keyboard_arrow_up_rounded,
          ),
          textStyle: textTheme.labelSmall?.copyWith(fontSize: 15.sp),
          menuStyle: MenuStyle(
            maximumSize: WidgetStatePropertyAll(Size(300.w, 300.h)),
            alignment: AlignmentDirectional.bottomStart,
          ),

          dropdownMenuEntries: controller.state.courses.map((course) {
            return DropdownMenuEntry<int>(
              value: course.id!,
              label: course.courseTitle,
              leadingIcon: const BuildIcon(Icons.school),
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.all(AppSizes.secondPadding / 2),
                ),
                textStyle: WidgetStatePropertyAll(textTheme.labelSmall),

                foregroundColor: WidgetStatePropertyAll(
                  textTheme.labelSmall?.color,
                ),
              ),
            );
          }).toList(),
          onSelected: (courseId) async =>
              await controller.selectCourse(courseId),
        );
      },
    );
  }
}
