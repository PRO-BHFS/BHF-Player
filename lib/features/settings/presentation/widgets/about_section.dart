import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/core/presentation/components/rounded_container.dart';
import 'package:bhf_player/core/utils/app_constants/app_constants.dart';
import 'package:bhf_player/core/utils/helpers_functions/share/share_whatsup.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'info_row.dart';
import 'title_setting_section.dart';

class BuildAboutSection extends StatelessWidget {
  const BuildAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => shareOnWhatsApp(phoneNumber: AppConsts.supportWhatsApp),
      child: RoundedContainer(
        child: Column(
          spacing: 10,
          children: [
            TitleSettingSection(
              icon: const BuildIcon(Icons.info_outline),
              title: S.of(context).about_us,
            ),
            const SizedBox(height: 2),

            const InfoRow(label: "App Name:", value: AppConsts.appName),

            const InfoRow(label: "Version:", value: "v${AppConsts.appVersion}"),

            const InfoRow(label: "Build:", value: "1"),

            const InfoRow(
              label: "Our WhatsApp:",
              value: AppConsts.supportWhatsApp,
            ),
          ],
        ),
      ),
    );
  }
}
