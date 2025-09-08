import 'package:bhf_player/bhf_studio/lib/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/ui_helpers/exports.dart';
import 'package:flutter/material.dart';

class AddCourseButton extends StatelessWidget {
  const AddCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildIconButton(
      icon: const CircleAvatar(
        backgroundColor: Color.fromARGB(255, 5, 10, 154),
        foregroundColor: Color(0xFFFFFFFF),
        child: Icon(Icons.add),
      ),
      onPressed: ()async  => await addCourse(context),
    );
  }
}
