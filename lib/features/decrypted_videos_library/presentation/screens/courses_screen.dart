import 'package:bhf_player/core/presentation/screens/empty_state_screen.dart';
import 'package:bhf_player/core/utils/app_constants/app_assests/app_images_assests.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/course/presentation/sheets/add_course_sheet.dart';
import 'package:bhf_player/features/decrypted_videos_library/domain/entities/card_course.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/controller/decrypted_videos/decrypted_video_controller.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/controller/decrypted_videos/decrypted_video_state.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/widgets/course_card.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      DecryptedVideoCubit,
      DecryptedVideoState,
      Set<CardCourse>
    >(
      selector: (state) => state.courses,
      builder: (context, courses) {
        if (courses.isEmpty) {
          return EmptyStateScreen(
            imagePath: AppImagesAssests.tutorial,
            textButton: S.of(context).add_course,
            textNote: S.of(context).no_courses_added_yet,
            onPress: () async => await AddCourseSheet(
              context,
            ).show(title: S.of(context).add_new_course),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(AppSizes.mainPadding),
          itemExtent: 140,
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final cardCourse = courses.elementAt(index);
            return BuildCourseCard(cardCourse);
          },
        );
      },
    );
  }
}
