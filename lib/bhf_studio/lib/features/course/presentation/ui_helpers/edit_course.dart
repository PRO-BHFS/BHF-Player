import 'package:bhf_player/bhf_studio/lib/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/domain/entities/course.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> editCourse(BuildContext context, CourseEntity? course) async {
  final keyForm = GlobalKey<FormState>();
  TextEditingController newCourseNameController = TextEditingController(
    text: course?.title,
  );
  TextEditingController encryptionCodeController = TextEditingController(
    text: course?.encryptionCode,
  );

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true, // مهم لجعله يأخذ ارتفاعًا كاملاً عند الحاجة
    builder: (sheetContext) {
      return Padding(
        padding: sheetContext.mediaViewInsets,

        child: Form(
          key: keyForm,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(AppSizes.mainPadding),
            children: [
              const Text(
                'تعديل دورة',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),

              BuildFormInputField(
                labelText: 'اسم الدورة',
                hintText: "اكتب اسم الدورة هنا",
                textInputAction: TextInputAction.done,
                controller: newCourseNameController,
              ),

              BuildFormInputField(
                labelText: 'كود التشفير',
                hintText: "اكتب كود التشفير هنا",
                maxLength: AppConsts.encryptionCodeMaxLength,
                controller: encryptionCodeController,
                suffixIcon: BuildIconButton(
                  icon: const Icon(Icons.paste),
                  onPressed: () async =>
                      await encryptionCodeController.pasteFromClipboard(),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BuildAppTextButton(
                    text: 'إلغاء',
                    onPress: sheetContext.popRoute,
                  ),

                  BuildPrimaryButton(
                    text: 'تعديل',
                    onPress: () async {
                      if (keyForm.currentState?.validate() != true) return;
                      if (course == null) return;

                      await context.read<AdminCourseCubit>().updateCourse(
                        course.copyWith(
                          title: newCourseNameController.text,
                          encryptionCode: encryptionCodeController.text,
                        ),
                      );

                      if (sheetContext.mounted) sheetContext.popRoute();
                    },
                  ),
                ].separatedBy(const SizedBox(width: 20)),
              ),
            ].separatedBy(const SizedBox(height: 25)),
          ),
        ),
      );
    },
  );
}
