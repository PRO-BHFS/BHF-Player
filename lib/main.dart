import 'package:bhf_player/bhf_studio/lib/core/utils/setup_app/setup_app.dart';
import 'package:bhf_player/core/presentation/screens/main_screen.dart';
import 'package:bhf_player/core/utils/setup_app/responsive_initializer/responsive_initializer.dart';
import 'package:bhf_player/core/utils/setup_app/setup_app.dart';
import 'package:bhf_player/core/utils/styles/app_themes/dark_theme/dark_theme.dart';
import 'package:bhf_player/core/utils/styles/app_themes/light_theme/light_theme.dart';
import 'package:flashy_flushbar/flashy_flushbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'core/utils/setup_app/setup_multi_bloc_provider/setup_multi_bloc_provider.dart';
import 'features/theme_mode/presentation/controllers/theme/theme.dart';

// BHF Player App
void main() async {
  await setupBhfPLayerApp();
  await setupBhfStudioApp();
  FlutterNativeSplash.remove();

  runApp(
    const SetupMultiBlocProvider(
      child: ResponsiveInitializer(child: BHFPlayer()),
    ),
  );
}

class BHFPlayer extends StatelessWidget {
  const BHFPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BHF Player',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
      ),
      themeMode: context.watch<ThemePlayerCubit>().themeMode,
      theme: lightThemeData(),
      darkTheme: darkThemeData(),
      home: const MainScreen(),
      builder: FlashyFlushbarProvider.init(),
    );
  }
}
