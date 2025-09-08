import 'package:bhf_player/bhf_studio/lib/features/theme_mode/presentation/controllers/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupMultiProvider extends StatelessWidget {
  final Widget child;

  const SetupMultiProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: child,
    );
  }
}
