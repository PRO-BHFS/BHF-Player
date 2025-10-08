import 'package:bhf_player/core/utils/styles/app_themes/dark_theme/dark_theme.dart';
import 'package:bhf_player/core/utils/styles/app_themes/light_theme/light_theme.dart';
import 'package:bhf_player/features/bottom_navigation/presentation/controllers/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:bhf_player/features/bottom_navigation/presentation/screens/home_layout.dart';
import 'package:bhf_player/features/language/presentation/controllers/language/language.dart';
import 'package:bhf_player/features/theme_mode/presentation/controllers/theme/theme.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flashy_flushbar/flashy_flushbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BHFPlayer extends StatelessWidget {
  const BHFPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = context.watch<LanguageCubit>().language.code;
    return MaterialApp(
      title: 'BHF Player',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(languageCode),
      supportedLocales: S.delegate.supportedLocales,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
      ),
      themeMode: context.watch<ThemeCubit>().themeMode,
      theme: lightThemeData(),
      darkTheme: darkThemeData(),
      home: BlocProvider(
        create: (context) => BottomNavigationCubit(),
        child: const HomeLayout(),
      ),
      builder: FlashyFlushbarProvider.init(),
    );
  }
}
