import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  final Language value;
  final ValueChanged<Language?> onChanged;
  final double? width;

  const LanguageDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme.labelMedium;
    return DropdownButtonFormField<Language>(
      value: value,
      style: textTheme,
      icon: const BuildIcon(Icons.language),
      decoration: const InputDecoration(
        prefixIcon: BuildIcon(Icons.expand_more_rounded),
      ),

      items: [
        DropdownMenuItem(
          value: Language.en,
          child: Text(S.of(context).english, style: textTheme),
        ),
        DropdownMenuItem(
          value: Language.ar,
          child: Text(S.of(context).arabic, style: textTheme),
        ),
      ],
      onChanged: onChanged,
    );
  }
}
