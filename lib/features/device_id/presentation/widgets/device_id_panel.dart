import 'package:bhf_player/core/presentation/components/rounded_container.dart';
import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/features/device_id/presentation/controller/device_id/device_id.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceIdPanel extends StatelessWidget {
  const DeviceIdPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final userId = context.read<DeviceIdCubit>().userId;
    final primaryColor = context.colorScheme.primary;
    return RoundedContainer(
      child: Column(
        spacing: 10,
        children: [
          BlocBuilder<DeviceIdCubit, String>(
            builder: (_, id) {
              return FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  spacing: 15,
                  children: [
                    Text(S.of(context).id, style: textTheme.labelMedium),
                    SelectableText(
                      id.isEmpty ? S.of(context).device_id_placeholder : id,
                      maxLines: 1,

                      style: textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.onSurface,
                      ),
                      onTap: () => id.copyToClipboard,
                    ),
                  ],
                ),
              );
            },
          ),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleIconButton(
                icon: const Icon(Icons.share),
                onPressed: () async => await shareOnWhatsApp(userId),
                circleColor: primaryColor,
              ),
              CircleIconButton(
                icon: const Icon(Icons.copy_rounded),
                onPressed: userId.copyToClipboard,
                circleColor: primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
