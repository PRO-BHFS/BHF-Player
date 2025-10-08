import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/decrypted_videos_library/domain/entities/card_course.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/widgets/video_card.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen(this.course, {super.key});
  final CardCourse course;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.courseTitle)),
      body: (course.videos.isEmpty)
          ? Center(child: Text(S.of(context).no_videos))
          : ListView.builder(
              padding: const EdgeInsets.all(AppSizes.secondPadding),
              itemExtent: 100,
              itemCount: course.videos.length,
              itemBuilder: (context, index) {
                final videoCard = course.videos.elementAt(index);
                return BuildVideoCard(videoCard,);
              },
            ),
    );
  }
}
