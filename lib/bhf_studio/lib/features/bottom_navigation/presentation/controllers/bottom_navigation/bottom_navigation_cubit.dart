import 'package:bhf_player/bhf_studio/lib/features/bottom_navigation/presentation/controllers/bottom_navigation/bottom_navigation_states.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/controllers/encryption_process/encryption_process_cubit.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/screens/video_encryption_screen.dart';
import 'package:bhf_player/bhf_studio/lib/features/generate_smart_password/presentation/controller/generate_smart_password/generate_smart_password_cubit.dart';
import 'package:bhf_player/bhf_studio/lib/features/generate_smart_password/presentation/screens/smart_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<BottomNabigationSatates> {
  BottomNavigationCubit() : super(BottomNavigationInitial());
  final _pageController = PageController();
  final _titles = ['توليد الباسورد', 'تشفير الفيديوهات'];

  final _screens = <Widget>[
    BlocProvider(
      create: (context) => GenerateSmartPasswordCubit(),
      child: const SmartPasswordScreen(),
    ),
    BlocProvider(
      create: (context) => EncryptionProcessCubit(),
      child: const VideoEncryptionScreen(),
    ),
  ];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;
  List<Widget> get screens => _screens;
  String get currentTitle => _titles[_currentIndex];

  void changeIndex(int index) {
    if (index == _currentIndex) return;

    _currentIndex = index;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
    emit(BottomNavigationChanged());
  }

  void onPageChanged(int index) {
    if (index == _currentIndex) return;

    _currentIndex = index;

    emit(BottomNavigationChanged());
  }

  @override
  Future<void> close() {
    _pageController.dispose();
    return super.close();
  }
}
