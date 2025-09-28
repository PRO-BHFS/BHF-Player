import 'package:bhf_player/core/presentation/components/rounded_container.dart';
import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/language/presentation/controllers/language/language.dart';
import 'package:bhf_player/features/language/presentation/widgets/language_dropdown.dart';
import 'package:bhf_player/features/settings/presentation/widgets/title_setting_section.dart';
import 'package:bhf_player/features/theme_mode/presentation/controllers/theme/theme.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeCubit>().isDarkMode;
    final language = context.watch<LanguageCubit>().state;
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).settings)),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.mainPadding),
        shrinkWrap: true,

        children: [
          RoundedContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleSettingSection(
                  icon: const BuildIcon(Icons.dark_mode_outlined),
                  title: S.of(context).dark_mode,
                ),
                Switch(
                  value: isDarkMode,
                  onChanged: context.read<ThemeCubit>().selectTheme,
                ),
              ],
            ),
          ),
          RoundedContainer(
            child: Column(
              spacing: AppSizes.spacingMiddle,

              children: [
                TitleSettingSection(
                  icon: const BuildIcon(Icons.language),
                  title: S.of(context).change_language,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: LanguageDropdown(
                    value: language,
                    onChanged: context.read<LanguageCubit>().selectLanguage,
                  ),
                ),
              ],
            ),
          ),
           RoundedContainer(
            child: Row(
              children: [
                TitleSettingSection(
                  icon: const BuildIcon(Icons.info_outline),
                  title: S.of(context).about_us,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
