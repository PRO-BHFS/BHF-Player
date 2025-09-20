import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> deleteCourse(BuildContext context, CourseEntity? course) async {
  await showDialog(
    context: context,
    builder: (dialogContext) {
      final textTheme = dialogContext.textTheme;
      return AlertDialog(
        title: const Text('تأكيد الحذف', textAlign: TextAlign.center),
        actionsAlignment: MainAxisAlignment.center,
        actionsOverflowButtonSpacing: 10,
        titlePadding: const EdgeInsets.all(AppSizes.mainPadding),
        contentPadding: const EdgeInsets.only(
          left: AppSizes.mainPadding,
          right: AppSizes.mainPadding,
          bottom: AppSizes.mainPadding,
        ),

        titleTextStyle: textTheme.titleSmall,
        contentTextStyle: textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.normal,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            const Text('هل أنت متأكد أنك تريد حذف دورة: '),
            Text("${course?.courseTitle ?? ""}?", style: textTheme.labelMedium),
            const Text('لا يمكن التراجع عن هذه العملية.'),
          ],
        ),
        actions: [
          BuildButton(
            text: 'حذف',
            colorBackground: Colors.red,

            onPress: () async {
              await context.read<CourseCubit>().removeCourse(course?.id);
              if (dialogContext.mounted) dialogContext.popRoute();
            },
          ),
          BuildButton(text: 'إلغاء', onPress: context.popRoute),
        ].separatedBy(const SizedBox(width: 10)),
      );
    },
  );
}
