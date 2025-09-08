import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/helpers_functions/validators.dart';
import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class BaseCourseSheet {
  BaseCourseSheet({required this.context});

  final BuildContext context;

  final keyForm = GlobalKey<FormState>();
  final courseNameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> onSubmit(BuildContext sheetContext);

  Future<void> show({required String title}) async {
    Future<void> future = showModalBottomSheet(
      context: context,
      isScrollControlled: true, // مهم لجعله يأخذ ارتفاعًا كاملاً عند الحاجة
      elevation: 12,
      backgroundColor: context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.borderRadiusBig),
        ),
        side:  BorderSide(color: DarkColors.border, width: 1.r),
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
                  labelText: 'اسم الدورة',
                  hintText: "اكتب اسم الدورة هنا",
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  autoFocus: true,
                  controller: courseNameController,
                  validator: checkFieldEmpty,
                ),

                BuildFormField(
                  labelText: 'الباسورد',
                  hintText: "اكتب الباسورد هنا",
                  controller: passwordController,
                  suffixIcon: BuildIconButton(
                    icon: const Icon(Icons.paste),
                    onPressed: passwordController.pasteFromClipboard,
                  ),
                  validator: checkFieldEmpty,
                ),

                Row(
                  spacing: 15,
                  children: [
                    SizedBox(
                      width: 100.w,
                      height: 45.h,
                      child: BuildButton(
                        text: 'حفظ',
                        onPress: () async => await onSubmit(sheetContext),
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 45.h,
                      child: BuildButton(
                        text: 'إلغاء',
                        colorBackground: const Color(0xFFC7191C),
                        onPress: sheetContext.popRoute,
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
