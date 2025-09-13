import 'package:bhf_player/bhf_studio/lib/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/components/icons/build_svg_icon.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/assests/icons.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        final textTheme = context.textTheme;
        if (state is CourseLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return DropdownMenu<int>(
          key: UniqueKey(),
          initialSelection: controller.currentSelectedCourseId,
          maxLines: 1,
          width: double.infinity,
          requestFocusOnTap: false,
          trailingIcon: const BuildSvgIcon(IconsAssets.moveUpDown),
          selectedTrailingIcon: const BuildSvgIcon(IconsAssets.moveUpDown),
          textStyle: textTheme.labelSmall?.copyWith(fontSize: 15.sp),
          menuStyle: MenuStyle(
            maximumSize: WidgetStatePropertyAll(Size(300.w, 300.h)),
            alignment: AlignmentDirectional.bottomStart,
          ),

          dropdownMenuEntries: controller.courses.map((course) {
            return DropdownMenuEntry<int>(
              value: course.id!,
              label: course.title,
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
