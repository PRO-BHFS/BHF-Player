import 'package:bhf_player/bhf_studio/lib/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/components/rounded_container.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/bhf_studio/lib/features/settings/presentation/widgets/title_setting_section.dart';
import 'package:bhf_player/bhf_studio/lib/features/theme_mode/presentation/controllers/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeCubit>().isDarkMode;
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.mainPadding),
        shrinkWrap: true,
        itemExtent: 100,

        children: [
          RoundedContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleSettingSection(
                  icon: BuildIcon(Icons.dark_mode_outlined),
                  title: "Dark Mode",
                ),
                Switch(
                  value: isDarkMode,
                  onChanged: context.read<ThemeCubit>().selectTheme,
                ),
              ],
            ),
          ),
          const RoundedContainer(
            child: Row(
              children: [
                TitleSettingSection(
                  icon: BuildIcon(Icons.language),
                  title: "Change Language",
                ),
              ],
            ),
          ),
          const RoundedContainer(
            child: Row(
              children: [
                TitleSettingSection(
                  icon: BuildIcon(Icons.info_outline),
                  title: "About Us",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
