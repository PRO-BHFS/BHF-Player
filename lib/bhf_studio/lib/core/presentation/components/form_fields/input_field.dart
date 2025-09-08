import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/light_colors.dart';
import 'package:flutter/material.dart';

class BuildFormInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final int? maxLength;

  final TextEditingController? controller;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final bool readOnly;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final void Function(String)? onFieldSubmitted;
  const BuildFormInputField({
    super.key,
    required this.labelText,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.readOnly = false,
    required this.hintText,
    this.autoFocus = false,
    this.textInputAction,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text("$labelText :"),
        TextFormField(
          readOnly: readOnly,
          autofocus: autoFocus,
          controller: controller,
          maxLength: maxLength,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
            hint: Text(
              "$hintText..",
              style: TextStyle(color: Theme.of(context).hintColor),
            ),

            suffixIcon: suffixIcon,
            hintStyle: const TextStyle(color: Colors.amber),
          ),
          cursorColor: context.isDark()
              ? DarkColors.fontMain
              : LightColors.fontMain,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "يجب أن يتم تعبئة الحقل";
            }
            return null;
          },
          key: key,
        ),
      ],
    );
  }
}
