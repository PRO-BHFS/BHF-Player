import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/decrypt_video/presentation/controller/video_decryption/video_decryption_cubit.dart';
import 'package:bhf_player/features/device_id/presentation/controller/device_id/device_id.dart';
import 'package:bhf_player/features/language/presentation/controllers/language/language.dart';
import 'package:bhf_player/features/theme_mode/presentation/controllers/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupMultiBlocProvider extends StatelessWidget {
  final Widget child;

  const SetupMultiBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<LanguageCubit>(create: (_) => LanguageCubit()),
        BlocProvider<LanguageCubit>(create: (_) => LanguageCubit()),
        BlocProvider<CourseCubit>(create: (_) => CourseCubit()),
        BlocProvider<DeviceIdCubit>(
          create: (context) => DeviceIdCubit()..initDeviceId(),
        ),
        BlocProvider<VideoDecryptionCubit>(
          create: (context) => VideoDecryptionCubit(),
        ),
      ],
      child: child,
    );
  }
}
