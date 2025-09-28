import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_navigation_states.dart';

class BottomNavigationCubit extends Cubit<BottomNabigationSatates> {
  BottomNavigationCubit() : super(BottomNavigationInitial());
  final _pageController = PageController();
  final _titles = ["import_a_file", "courses"];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;
  String get currentTitle => _titles[_currentIndex];

  void changeIndex(int index) {
    if (index == _currentIndex) return;

    _currentIndex = index;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
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
