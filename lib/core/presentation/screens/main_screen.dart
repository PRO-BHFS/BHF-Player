import 'package:bhf_player/bhf_studio/lib/core/utils/setup_app/setup_multi_provider/setup_multi_provider.dart';
import 'package:bhf_player/bhf_studio/lib/main.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:flutter/material.dart';
import 'package:bhf_player/features/decrypt_video/presentation/screens/import_and_decrypt_video_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('BHF Player')),

        floatingActionButton: FloatingActionButton(
          onPressed: () async => await context.pushRoute(
            // ignore: prefer_const_constructors
            SetupMultiProvider(child: const BHFStudio())),
          child: const Icon(Icons.settings_suggest_sharp),
        ),
        body: BlocProvider<UserCourseCubit>(
          create: (context) => UserCourseCubit(),
          child: const ImportAndDecryptVideoScreen(),
        ),
      ),
    );
  }
}
