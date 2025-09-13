import 'package:bhf_player/bhf_studio/lib/core/utils/setup_app/setup_app.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/setup_app/setup_multi_provider/setup_multi_provider.dart';
import 'package:bhf_player/bhf_studio/lib/features/bottom_navigation/presentation/screens/home_layout.dart';
import 'package:bhf_player/features/theme_mode/presentation/controllers/theme/theme.dart';
import 'package:flashy_flushbar/flashy_flushbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/styles/app_themes/dark_theme/dark_theme.dart';
import 'core/utils/styles/app_themes/light_theme/light_theme.dart';

// BHF Studio App

void main() async {
  await setupBhfStudioApp();

  runApp(const SetupMultiProvider(child: BHFStudio()));
}

class BHFStudio extends StatelessWidget {
  const BHFStudio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BHF Studio',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
      ),
      themeMode: context.watch<ThemePlayerCubit>().themeMode,
      theme: lightThemeData(),
      darkTheme: darkThemeData(),
      home: const HomeLayout(),
      builder: FlashyFlushbarProvider.init(),
    );
  }
}
