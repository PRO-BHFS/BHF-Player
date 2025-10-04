import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class GenerateQrCodeScreen extends StatelessWidget {
  const GenerateQrCodeScreen({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(S.of(context).generate_qr_code),
        ),
      ),
      body: Center(
        child: Container(
          width: context.screenWidth * 0.5,
          height: context.screenWidth * 0.5,
          clipBehavior: Clip.antiAliasWithSaveLayer,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: DarkColors.border),
          ),
          child: PrettyQrView.data(
            data: data,
            errorBuilder: (_, _, _) =>
                Text(S.of(context).error_generate_qr_code),
            decoration: const PrettyQrDecoration(
              background: DarkColors.onPrimary,
              quietZone: PrettyQrPixelsQuietZone(10),
            ),
          ),
        ),
      ),
    );
  }
}
