import 'package:bhf_player/core/presentation/screens/nothing_screen.dart';
import 'package:bhf_player/core/utils/app_constants/app_assests/app_images_assests.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/course/presentation/sheets/add_course_sheet.dart';
import 'package:bhf_player/features/decrypted_videos_library/domain/entities/card_course.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/controller/decrypted_videos/decrypted_video_controller.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/controller/decrypted_videos/decrypted_video_state.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesLibraryScreen extends StatelessWidget {
  const CoursesLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Courses')),
      body: BlocSelector<DecryptedVideoCubit, DecryptedVideoState,Set<CardCourse>>(
        selector: (state) => state.courses,
        builder: (context, courses) {
          if (courses.isEmpty) {
            return NothingScreen(
              imagePath: AppImagesAssests.tutorial,
              textButton: "إضافة دورة",
              textNote: "لم يتم اضافة دورات بعد",
              onPress: () async =>
                  await AddCourseSheet(context).show(title: 'إضافة دورة جديدة'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(AppSizes.mainPadding),
            itemExtent: 140,
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final cardCourse =courses.elementAt(index);
              return BuildCourseCard(cardCourse);
            },
          );
        },
      ),
    );
  }
}
