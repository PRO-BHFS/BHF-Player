
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

ButtonStyle dropdownEntryStyle(BuildContext context) {
  return ButtonStyle(
    textStyle: WidgetStatePropertyAll(context.textTheme.labelSmall),
    foregroundColor: WidgetStatePropertyAll(context.colorScheme.inverseSurface),
  );
}
