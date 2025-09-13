import 'package:bhf_player/bhf_studio/lib/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/components/rounded_container.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/widgets/build_courses_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_course_button.dart';
import 'delete_course_button.dart';
import 'edit_course_button.dart';

class BuildCoursesDashboard extends StatelessWidget {
  const BuildCoursesDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Roundedcontainer(
      child: Column(
        spacing: 15.h,
        children: [
          Row(
            spacing: 10,
            children: [
              const BuildIcon(Icons.school),
              Text(
                "اختر الدورة التدريبية",
                style: context.textTheme.labelSmall,
              ),
            ],
          ),
          const BuildCoursesDropdown(),

          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 10,
            children: [
              AddCourseButton(),
              EditCourseButton(),
              DeleteCourseButton(),
            ],
          ),
        ],
      ),
    );
  }
}
