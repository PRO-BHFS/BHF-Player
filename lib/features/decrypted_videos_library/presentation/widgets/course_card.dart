import 'package:bhf_player/core/presentation/components/rounded_container.dart';
import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/decrypted_videos_library/domain/entities/card_course.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/screens/course_details_screen.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'course_card_thumbnail.dart';

class BuildCourseCard extends StatelessWidget {
  const BuildCourseCard(this.cardCourse, {super.key});

  final CardCourse cardCourse;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return GestureDetector(
      onTap: () async =>
          await context.pushRoute(CourseDetailsScreen(cardCourse)),
      child: RoundedContainer(
        padding: const EdgeInsets.all(AppSizes.secondPadding),
        child: Row(
          spacing: AppSizes.spacingMiddle,
          children: [
            CourseCardThumbnail(thumbnailPath: cardCourse.courseThumbnail),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSizes.spacingSmall,
                children: [
                  Text(
                    cardCourse.courseTitle,
                    maxLines: 2,
                    style: textTheme.titleMedium?.copyWith(fontSize: 15),
                  ),
                  Text(
                    "${cardCourse.videos.length} ${S.of(context).videos}",
                    style: textTheme.labelSmall?.copyWith(
                      color: textTheme.labelSmall?.color?.withAlpha(150),
                    ),
                  ),
                ],
              ),
            ),
            const BuildIcon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
