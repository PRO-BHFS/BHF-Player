import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/decrypt_video/presentation/controller/video_decryption/video_decryption_cubit.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/controller/decrypted_videos/decrypted_video_controller.dart';
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
        BlocProvider<DeviceIdCubit>(
          create: (context) => DeviceIdCubit()..initDeviceId(),
        ),
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<LanguageCubit>(create: (_) => LanguageCubit()),
        BlocProvider<LanguageCubit>(create: (_) => LanguageCubit()),
        BlocProvider<CourseCubit>(create: (_) => CourseCubit()),
        BlocProvider<DecryptedVideoCubit>(
          create: (context) {
            final courseCubit = context.read<CourseCubit>();
            return DecryptedVideoCubit(courseCubit);
          },
        ),
        BlocProvider<VideoDecryptionCubit>(
          create: (context) {
            final decryptedVideoCubit = context.read<DecryptedVideoCubit>();
            final courseCubit = context.read<CourseCubit>();

            return VideoDecryptionCubit(decryptedVideoCubit, courseCubit);
          },
        ),
      ],
      child: child,
    );
  }
}
