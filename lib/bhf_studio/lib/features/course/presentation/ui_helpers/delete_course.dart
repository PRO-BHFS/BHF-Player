import 'package:bhf_player/bhf_studio/lib/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/domain/entities/course.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> deleteCourse(BuildContext context, CourseEntity? course) async {
  return await showDialog(
    context: context,

    builder: (dialogContext) {
      return AlertDialog(
        title: const Text('تأكيد الحذف'),
        contentPadding: const EdgeInsets.all(AppSizes.mainPadding),
        content: Column(
          mainAxisSize: MainAxisSize.min,
      
          children: [
            Text(
              'هل أنت متأكد أنك تريد حذف دورة: \n"${course?.title ?? ""}"؟',
              textDirection: TextDirection.rtl,
            ),
            const Text(
              'لا يمكن التراجع عن هذه العملية.',
              textDirection: TextDirection.rtl,
            ),
          ].separatedBy(const SizedBox(height: 20)),
        ),
        actions: [
          BuildAppTextButton(text: 'إلغاء', onPress: context.popRoute),
      
          BuildPrimaryButton(
            text: 'حذف',
            onPress: () async {
              await context.read<AdminCourseCubit>().removeCourse(course?.id);
              if (dialogContext.mounted) dialogContext.popRoute();
            },
          ),
        ].separatedBy(const SizedBox(width: 20)),
      );
    },
  );
}
