import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/core/utils/styles/app_colors/light_colors.dart';
import 'package:flutter/material.dart';

class BuildFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final bool readOnly;
  final bool autoFocus;
  final int? maxLines = 1;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final void Function(String)? onFieldSubmitted;
  const BuildFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    required this.hintText,
    this.autoFocus = false,
    this.readOnly = false,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      autofocus: autoFocus,
      textCapitalization: TextCapitalization.words,

      textInputAction: textInputAction,
      decoration: InputDecoration(
        label: Text(labelText, style: textTheme.labelSmall),
        hint: Text(
          "$hintText..",
          style: textTheme.labelSmall?.copyWith(
            color: Theme.of(context).hintColor,
          ),
        ),

        suffixIcon: suffixIcon,
      ),
      style: textTheme.labelSmall,
      cursorColor: context.isDark ? DarkColors.fontMain : LightColors.fontMain,
      onChanged: onChanged,
      maxLines: maxLines,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      key: key,
    );
  }
}
