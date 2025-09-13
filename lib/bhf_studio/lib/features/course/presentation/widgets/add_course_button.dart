import 'package:bhf_player/bhf_studio/lib/core/presentation/components/buttons/circle_icon_button.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/components/icons/build_svg_icon.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/assests/icons.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/sheets/add_course_sheet.dart';
import 'package:flutter/material.dart';

class AddCourseButton extends StatelessWidget {
  const AddCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleIconButton(
      onPressed: () async => await AddCourseSheet(
         context,
      ).show(title: 'إضافة دورة جديدة'),
      icon: const BuildSvgIcon(IconsAssets.add),
      circleColor: context.colorScheme.primary,
    );
  }
}
