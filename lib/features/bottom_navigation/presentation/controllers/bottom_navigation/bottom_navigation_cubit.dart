import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(0);
  final _pageController = PageController();

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;

  void changeIndex(int index) {
    if (index == _currentIndex) return;

    _currentIndex = index;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    );
    emit(_currentIndex);
  }

  void onPageChanged(int index) {
    if (index == _currentIndex) return;

    _currentIndex = index;

    emit(_currentIndex);
  }

  @override
  Future<void> close() {
    _pageController.dispose();
    return super.close();
  }
}
