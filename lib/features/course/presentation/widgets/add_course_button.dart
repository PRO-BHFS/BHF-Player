import 'package:bhf_player/core/presentation/components/icons/build_svg_icon.dart';
import 'package:bhf_player/core/presentation/components/icons/circle_icon_button.dart';
import 'package:bhf_player/core/utils/app_constants/app_assests/app_icons_assests.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/features/course/presentation/sheets/exports.dart';
import 'package:flutter/material.dart';

class AddCourseButton extends StatelessWidget {
  const AddCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleIconButton(
      onPressed: () async => await AddCourseSheet(
        context: context,
      ).show(title: 'إضافة دورة جديدة'),
      icon: const BuildSvgIcon(AppIconsAssests.add),
      circleColor: context.colorScheme.primary,
    );
  }
}
