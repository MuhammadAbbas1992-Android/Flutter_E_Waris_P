import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {

  final PageController pageController = PageController();

  int currentIndex = 0;

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void nextPage() {

    if (currentIndex < 2) {

      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );

    }
  }
}
