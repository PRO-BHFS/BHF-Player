import 'package:bhf_player/bhf_studio/lib/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/screens/nothing_screen.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/ui_helpers/add_course.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/widgets/build_courses_dashboard.dart';
import 'package:bhf_player/bhf_studio/lib/features/generate_smart_password/presentation/controller/generate_smart_password/generate_smart_password_cubit.dart';
import 'package:bhf_player/bhf_studio/lib/features/generate_smart_password/presentation/widgets/build_password_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmartPasswordScreen extends StatefulWidget {
  const SmartPasswordScreen({super.key});

  @override
  State<SmartPasswordScreen> createState() => _SmartPasswordScreenState();
}

class _SmartPasswordScreenState extends State<SmartPasswordScreen> {
  final _idController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final courseCubit = context.watch<AdminCourseCubit>();

    if (courseCubit.courses.isEmpty) {
      return NothingScreen(
        textButton: "إضافة دورة",
              textNote: "لم يتم اضافة دورات بعد",

        imagePath: Images.tutorial,
        onPress: () async => await addCourse(context),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(AppSizes.mainPadding),
      shrinkWrap: true,

      children: [
        const BuildCoursesDashboard(),

        Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: [
              BuildFormInputField(
                labelText: 'ID',
                hintText: "اكتب معرف جهاز المشتري هنا",
                controller: _idController,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.paste),
                  onPressed: _idController.pasteFromClipboard,
                ),
                textCapitalization: TextCapitalization.characters,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => onSubmit(),
              ),

              BuildPrimaryButton(text: 'إنشاء كلمة مرور', onPress: onSubmit),
            ].separatedBy(const SizedBox(height: 25)),
          ),
        ),

        const BuildPasswordText(),
      ].separatedBy(const SizedBox(height: 50)),
    );
  }

  Future<void> onSubmit() async {
    final controllerPassword = context.read<GenerateSmartPasswordCubit>();
    final selectedCourse = context.read<AdminCourseCubit>().currentCourse;

    if (selectedCourse == null) return;
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    controllerPassword.generateSmartPassword(
      encryptionCode: selectedCourse.encryptionCode,
      deviceUserId: _idController.text,
    );
  }
}
