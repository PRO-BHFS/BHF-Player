import 'package:bhf_player/bhf_studio/lib/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/widgets/more_options_button.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/setup_app/setup_multi_provider/setup_multi_provider.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_colors/dark_colors.dart';
import 'package:bhf_player/bhf_studio/lib/features/bottom_navigation/presentation/controllers/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:bhf_player/bhf_studio/lib/features/bottom_navigation/presentation/controllers/bottom_navigation/bottom_navigation_states.dart';
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
          appBar: AppBar(
            title: Text(controller.currentTitle),
            actions: [const MoreOptionsButton()],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async => await context.pushRoute(
              const SetupMultiProvider(child: BHFPlayer()),
            ),
            child: const Icon(Icons.play_circle_rounded),
          ),

          body: PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: controller.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,

            onTap: context.read<BottomNavigationCubit>().changeIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: BuildIcon(
                  Icons.vpn_key_off,
                  color: DarkColors.unSelected,
                ),
                activeIcon: BuildIcon(Icons.vpn_key),
                label: 'كلمة مرور ذكية',
              ),
              BottomNavigationBarItem(
                icon: BuildIcon(
                  Icons.video_collection_outlined,
                  color: DarkColors.unSelected,
                ),
                activeIcon: BuildIcon(Icons.video_collection),
                label: 'تشفير الفيديو',
              ),
            ],
          ),
        );
      },
    );
  }
}
