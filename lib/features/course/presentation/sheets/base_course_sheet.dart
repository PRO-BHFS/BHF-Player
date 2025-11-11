import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/app_constants/app_assests/app_icons_assests.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/course/presentation/sheets/edit_course_sheet.dart';
import 'package:bhf_player/features/qr_code/presentation/screens/scanner_qr_code_screen.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class BaseCourseSheet {
  BaseCourseSheet({required this.context});

  final BuildContext context;

  final keyForm = GlobalKey<FormState>();
  final courseNameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> onSubmit(BuildContext sheetContext);

  Future<void> show({required String title}) async {
    final courses = context.read<CourseCubit>().courses;

    Future<void> future = showModalBottomSheet(
      context: context,
      isScrollControlled: true, // مهم لجعله يأخذ ارتفاعًا كاملاً عند الحاجة
      elevation: 12,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.borderRadiusBig),
        ),
        side: const BorderSide(color: DarkColors.border, width: 0.3),
      ),

      builder: (sheetContext) {
        final textTheme = context.textTheme;
        return Padding(
          padding: sheetContext.mediaViewInsets,
          child: Form(
            key: keyForm,
            child: ListView(
              padding: const EdgeInsets.all(AppSizes.mainPadding),
              shrinkWrap: true,

              children: [
                Text(
                  title,
                  style: textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),

                BuildFormField(
                  labelText: S.of(context).course_name,
                  hintText: S.of(context).enter_course_name,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  autoFocus: true,
                  controller: courseNameController,
                  validator: (courseTitle) {
                    if (this is EditCourseSheet) {
                      return checkFieldEmpty(courseTitle);
                    }
                    final isTitleDublicated = courses.any(
                      (c) => c.courseTitle == courseTitle,
                    );
                    if (isTitleDublicated) {
                      return S.of(context).title_duplicated;
                    }

                    return checkFieldEmpty(courseTitle);
                  },
                ),

                BuildFormField(
                  labelText: S.of(context).password,
                  hintText: S.of(context).enter_password,
                  controller: passwordController,
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BuildIconButton(
                        icon: const BuildIcon(Icons.qr_code_scanner_rounded),
                        onPressed: () async {
                          final password = await context.pushRoute<String>(
                            const ScannerQrCodeScreen(),
                          );
                          if (password?.isEmpty ?? true) return;

                          Notifications.showFlushbar(
                            message: "تم مسح الباسورد بنجاح",
                            iconType: IconType.done,
                          );
                          passwordController.text = password!;
                        },
                      ),
                      BuildIconButton(
                        icon: BuildSvgIcon(
                          AppIconsAssests.paste,
                          color: context.colorScheme.onSecondary,
                        ),
                        onPressed: () async =>
                            await passwordController.pasteFromClipboard(),
                      ),
                    ],
                  ),
                  validator: checkFieldEmpty,
                ),

                Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 45.h,
                        child: BuildButton(
                          text: S.of(context).save,
                          onPress: () async => await onSubmit(sheetContext),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: SizedBox(
                        height: 45.h,
                        child: BuildButton(
                          text: S.of(context).cancel,

                          colorBackground: const Color(0xFFFA3C3F),
                          onPress: sheetContext.popRoute,
                        ),
                      ),
                    ),
                  ],
                ),
              ].separatedBy(const SizedBox(height: 40)),
            ),
          ),
        );
      },
    );

    await future.then(
      (_) => Future.delayed(const Duration(seconds: 5), dispose),
    );
  }

  void dispose() {
    courseNameController.dispose();
    passwordController.dispose();
  }
}
