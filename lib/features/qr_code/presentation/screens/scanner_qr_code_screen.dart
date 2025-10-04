import 'dart:async';
import 'package:bhf_player/core/presentation/components/buttons/build_icon_button.dart';
import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/styles/app_colors/light_colors.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scanner_overlay/scanner_overlay.dart';

class ScannerQrCodeScreen extends StatefulWidget {
  const ScannerQrCodeScreen({super.key});

  @override
  State<ScannerQrCodeScreen> createState() => _ScannerQrCodeScreenState();
}

class _ScannerQrCodeScreenState extends State<ScannerQrCodeScreen> {
  bool isFlashOn = false;
  bool isFrontCamera = false;
  bool canScan = true;
  MobileScannerController cameraController = MobileScannerController();
  Timer? timerDebounce;

  @override
  void dispose() {
    cameraController.dispose();
    timerDebounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final cameraArea = context.screenWidth * 0.7;
    final scanArea = cameraArea - 60;
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).title_password_scanner)),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.mainPadding),
        children: [
          Text(
            S.of(context).msg_scan_instruction,
            style: textTheme.labelMedium,

            textAlign: TextAlign.center,
          ),

          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: cameraArea,
                  height: cameraArea,
                  child: MobileScanner(
                    controller: cameraController,
                    fit: BoxFit.cover,
                    onDetect: (result) {
                      if (!canScan) return;

                      canScan = false;

                      final rawValue = result.barcodes.first.rawValue;
                      if (rawValue != null) {
                        context.popRoute<String>(rawValue);
                      }

                      timerDebounce?.cancel();
                      timerDebounce = Timer(const Duration(seconds: 2), () {
                        canScan = true;
                      });
                    },
                  ),
                ),
              ),

              // الحد يظهر فوق الكاميرا
              Container(
                width: cameraArea,
                height: cameraArea,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: LightColors.main, width: 0.5),
                ),
              ),

              // ignore: prefer_const_constructors
              ScannerOverlay(
                height: scanArea,
                width: scanArea,
                borderColor: LightColors.main,
                borderRadius: 30,

                borderThickness: 1,
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSizes.spacingSmall,
            children: [
              BuildIconButton(
                onPressed: () async {
                  setState(() => isFlashOn = !isFlashOn);
                  await cameraController.toggleTorch();
                },
                icon: BuildIcon(
                  isFlashOn ? Icons.flash_on_rounded : Icons.flash_off_rounded,
                  size: 35,
                ),
              ),
              BuildIconButton(
                onPressed: () async {
                  setState(() => isFrontCamera = !isFrontCamera);
                  await cameraController.switchCamera();
                },
                icon: const BuildIcon(
                  Icons.flip_camera_android_rounded,
                  size: 35,
                ),
              ),
            ],
          ),
        ].separatedBy(const SizedBox(height: 60)),
      ),
    );
  }
}
