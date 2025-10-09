import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/controller/decrypted_videos/decrypted_video_controller.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> deleteCourse(BuildContext context, CourseEntity? course) async {
  await showDialog(
    context: context,
    builder: (dialogContext) {
      final textTheme = dialogContext.textTheme;
      final labelSmall = textTheme.labelSmall?.copyWith(
        fontWeight: FontWeight.w500,
      );
      return AlertDialog(
        title: Text(
          S.of(context).confirm_delete,
          style: textTheme.titleMedium,
          // textAlign: TextAlign.center,
        ),
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
            Text(
              S.of(context).are_you_sure_delete_course,
              textAlign: TextAlign.center,
              style: labelSmall,
            ),
            Text("${course?.courseTitle ?? ""}?", style: textTheme.labelMedium),
            Text(
              S.of(context).cannot_undo_this_action,
              textAlign: TextAlign.center,
              style: labelSmall,
            ),
          ],
        ),
        actions: [
          Builder(
            builder: (context) {
              return BuildButton(
                text: S.of(context).delete,
                colorBackground: Colors.red,

                onPress: () async {
                  await context.read<CourseCubit>().removeCourse(course);

                  if (context.mounted) {
                    await context.read<DecryptedVideoCubit>().removeCourse(
                      course,
                    );
                  }

                  if (dialogContext.mounted) dialogContext.popRoute();
                },
              );
            },
          ),
          BuildButton(text: S.of(context).cancel, onPress: context.popRoute),
        ].separatedBy(const SizedBox(width: 10)),
      );
    },
  );
}
