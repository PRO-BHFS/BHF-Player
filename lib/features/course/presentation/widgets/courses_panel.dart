import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/core/presentation/components/rounded_container.dart';
import 'package:bhf_player/features/course/presentation/widgets/add_course_button.dart';
import 'package:bhf_player/features/course/presentation/widgets/build_courses_dropdown.dart';
import 'package:bhf_player/features/course/presentation/widgets/delete_course_button.dart';
import 'package:bhf_player/features/course/presentation/widgets/edit_course_button.dart';
import 'package:bhf_player/features/settings/presentation/widgets/title_setting_section.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesPanel extends StatelessWidget {
  const CoursesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      child: Column(
        spacing: 15.h,
        children: [
          TitleSettingSection(
            icon: const BuildIcon(Icons.school),
            title: S.of(context).choose_training_course,
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
