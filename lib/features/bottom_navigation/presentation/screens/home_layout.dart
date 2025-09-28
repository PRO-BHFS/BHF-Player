import 'package:bhf_player/core/presentation/screens/course_setup_screen.dart';
import 'package:bhf_player/core/presentation/widgets/more_options_button.dart';
import 'package:bhf_player/features/bottom_navigation/presentation/controllers/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:bhf_player/features/bottom_navigation/presentation/controllers/bottom_navigation/bottom_navigation_states.dart';
import 'package:bhf_player/features/course/presentation/controller/courses/course_controller.dart';
import 'package:bhf_player/features/db_backup/presentation/controller/backup/backup_controller.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/screens/courses_screen.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  String _getTitle(BuildContext context, String titleKey) {
    switch (titleKey) {
      case "import_a_file":
        return S.of(context).import_a_file;
      case "courses":
        return S.of(context).courses;
      default:
        return titleKey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNabigationSatates>(
      builder: (context, state) {
        final controller = context.watch<BottomNavigationCubit>();
        final controllerRead = context.read<BottomNavigationCubit>();
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                reverseDuration: Duration.zero,
                switchInCurve: Curves.easeInOut,
                child: Text(
                  key: ValueKey(controllerRead.currentIndex),
                  _getTitle(context, controller.currentTitle),
                ),
              ),
              actions: [
                BlocProvider<BackupCubit>(
                  create: (context) => BackupCubit(context.read<CourseCubit>()),
                  child: const MoreOptionsButton(),
                ),
              ],
            ),

            body: PageView(
              controller: controllerRead.pageController,
              onPageChanged: controllerRead.onPageChanged,

              children: [const CourseSetupScreen(), const CoursesScreen()],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex,

              onTap: controllerRead.changeIndex,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.drive_folder_upload_outlined),
                  activeIcon: const Icon(Icons.drive_folder_upload_rounded),
                  label: S.of(context).import,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.video_collection_outlined),
                  activeIcon: const Icon(Icons.video_collection),
                  label: S.of(context).courses,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
