import 'package:bhf_player/core/presentation/components/rounded_container.dart';
import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/features/device_id/presentation/controller/device_id/device_id.dart';
import 'package:bhf_player/features/qr_code/presentation/screens/generate_qr_code_screen.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceIdPanel extends StatelessWidget {
  const DeviceIdPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceIdCubit, String>(
      builder: (_, userId) {
        final textTheme = context.textTheme;
        final primaryColor = context.colorScheme.primary;

        return RoundedContainer(
          child: Column(
            spacing: 15,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  spacing: 15,
                  children: [
                    Text("ID:", style: textTheme.labelMedium),
                    SelectableText(
                      userId.isEmpty
                          ? S.of(context).device_id_placeholder
                          : userId,
                      maxLines: 1,

                      style: textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.onSurface,
                      ),
                      onTap: () async => userId.copyToClipboard(),
                    ),
                  ],
                ),
              ),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleIconButton(
                    icon: const Icon(Icons.qr_code_2_rounded),
                    onPressed: () async => await context.pushRoute(
                      GenerateQrCodeScreen(data: userId),
                    ),
                    circleColor: primaryColor,
                  ),
                  CircleIconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () async =>
                        await shareOnWhatsApp(message: userId),
                    circleColor: primaryColor,
                  ),
                  CircleIconButton(
                    icon: const Icon(Icons.copy_rounded),
                    onPressed: () async => userId.copyToClipboard(),
                    circleColor: primaryColor,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
