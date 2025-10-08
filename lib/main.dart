import 'package:flashy_flushbar/flashy_flushbar_provider.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'core/exceptions/device_security/device_security_exception.dart';
import 'core/utils/setup_app/setup_app.dart';
import 'core/utils/setup_app/responsive_initializer/responsive_initializer.dart';
import 'core/utils/setup_app/setup_multi_bloc_provider/setup_multi_bloc_provider.dart';

import 'features/device_security/domain/usecases/get_device_security_status.dart';
import 'features/device_security/domain/entities/entities/security_checker.dart';
import 'features/device_security/presentation/screens/security_screen.dart';

import 'core/presentation/screens/bhf_player_screen.dart';

void main() async {
  await setupApp();
  await _runApp();
}

/// Runs the app depending on device security check.
Future<void> _runApp() async {
  String? reason;
  try {
    reason = await _checkSecurity();
  } catch (e) {
    reason = e is DeviceSecurityException ? e.message : null;
  } finally {
    runApp(_buildEntryPoint(reason));
  }
}

/// Checks if the device is secure (root/jailbreak/emulator/debugging).
Future<String?> _checkSecurity() async {
  final deviceStatus = await GetIt.I<GetDeviceSecurityStatusUseCase>().call();
  final securityChecker = SecurityChecker(deviceStatus);
  return await securityChecker.checkDeviceSecure();
}

/// Builds the main app entry point with BlocProviders and Responsive setup.
Widget _buildEntryPoint(String? reason) {
  if (reason != null) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "BHF Player",
      home: SecurityScreen(reason: reason),
      builder: FlashyFlushbarProvider.init(),
    );
  }

  return const SetupMultiBlocProvider(
    child: ResponsiveInitializer(child: BHFPlayer()),
  );
}
