import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/widgets/build_courses_dropdown.dart';
import 'package:flutter/material.dart';

import 'add_course_button.dart';
import 'delete_course_button.dart';
import 'edit_course_button.dart';

class BuildCoursesDashboard extends StatelessWidget {
  const BuildCoursesDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Text("Course: "),

        const BuildCoursesDropdown(),

        // ايقونة اضافة دورة
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AddCourseButton(),
            EditCourseButton(),
            DeleteCourseButton(),
          ],
        ),
      ].separatedBy(const SizedBox(height: 20)),
    );
  }
}
