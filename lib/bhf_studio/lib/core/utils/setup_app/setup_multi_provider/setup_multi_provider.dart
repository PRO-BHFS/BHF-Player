import 'package:bhf_player/bhf_studio/lib/features/admin_vip/presentation/controller/admin_vip/admin_vip_controller.dart';
import 'package:bhf_player/bhf_studio/lib/features/bottom_navigation/presentation/controllers/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:bhf_player/bhf_studio/lib/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/bhf_studio/lib/features/device_id/presentation/controller/device_id/device_id.dart';
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
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => BottomNavigationCubit()),
        BlocProvider(create: (_) => AdminCourseCubit()),
        BlocProvider(create: (_) => AdminDeviceIdCubit()),

        BlocProvider(
          create: (context) =>
              AdminVipCubit(context.read<AdminDeviceIdCubit>()),
        ),
      ],
      child: child,
    );
  }
}
