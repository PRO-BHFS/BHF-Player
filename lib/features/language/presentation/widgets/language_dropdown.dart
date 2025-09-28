import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/styles/app_themes/sub_themes/dropdown_menu_entry.dart';
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
    return DropdownMenu<Language>(
      initialSelection: value,
      trailingIcon: const BuildIcon(Icons.expand_more),
      width: width,
      selectedTrailingIcon: const BuildIcon(Icons.expand_less_rounded),
      textStyle: context.textTheme.labelMedium,
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: Language.en,
          label: S.of(context).english,

          style: dropdownEntryStyle(context),
        ),
        DropdownMenuEntry(
          value: Language.ar,
          label: S.of(context).arabic,
          style: dropdownEntryStyle(context),
        ),
      ],
      onSelected: onChanged,
    );
  }
}
