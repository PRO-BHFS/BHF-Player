import 'package:bhf_player/bhf_studio/lib/core/presentation/components/buttons/circle_icon_button.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/components/rounded_container.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/share/share_whatsup.dart';
import 'package:bhf_player/bhf_studio/lib/features/device_id/presentation/controller/device_id/device_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminIdDashboard extends StatelessWidget {
  const AdminIdDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final userId = context.read<AdminDeviceIdCubit>().adminId;
    final primaryColor = context.colorScheme.primary;

    return RoundedContainer(
      child: Column(
        spacing: 10,
        children: [
          BlocBuilder<AdminDeviceIdCubit, String>(
            builder: (_, id) => FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                spacing: 15,
                children: [
                  Text("ID:", style: textTheme.labelSmall),
                  SelectableText(
                    id.isNotEmpty? id: "XXX-XXX-XXX",
                    maxLines: 1,

                    style: textTheme.labelMedium?.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                    onTap: () => id.copyToClipboard,
                  ),
                ],
              ),
            ),
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
