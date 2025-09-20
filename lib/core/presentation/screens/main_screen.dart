import 'package:bhf_player/core/presentation/widgets/more_options_button.dart';
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
        appBar: AppBar(
          title: const Text('BHF Player'),
          actions: [const MoreOptionsButton()],
        ),
        body: BlocProvider<UserCourseCubit>(
          create: (context) => UserCourseCubit(),
          child: const ImportAndDecryptVideoScreen(),
        ),
      ),
    );
  }
}
