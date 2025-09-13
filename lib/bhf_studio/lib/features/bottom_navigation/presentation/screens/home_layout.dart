import 'package:bhf_player/bhf_studio/lib/core/presentation/components/icons/build_svg_icon.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/assests/icons.dart';
import 'package:bhf_player/bhf_studio/lib/features/bottom_navigation/presentation/controllers/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:bhf_player/bhf_studio/lib/features/bottom_navigation/presentation/controllers/bottom_navigation/bottom_navigation_states.dart';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:bhf_player/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNabigationSatates>(
      builder: (context, state) {
        final controller = context.watch<BottomNavigationCubit>();
        return Scaffold(
          appBar: AppBar(title: Text(controller.currentTitle)),
          floatingActionButton: FloatingActionButton(
            onPressed: () async => await context.pushRoute(const BHFPlayer()),
            child: const Icon(Icons.play_circle_rounded),
          ),

          body: PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: controller.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: controller.changeIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: BuildSvgIcon(IconsAssets.password),
                activeIcon: BuildSvgIcon(IconsAssets.passwordFill),
                label: 'كلمة مرور ذكية',
              ),
              BottomNavigationBarItem(
                icon: BuildSvgIcon(IconsAssets.videoLibrary),
                activeIcon: BuildSvgIcon(IconsAssets.videoLibraryFill),
                label: 'تشفير الفيديو',
              ),
            ],
          ),
        );
      },
    );
  }
}
