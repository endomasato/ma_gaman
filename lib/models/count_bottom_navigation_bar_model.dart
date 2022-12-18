
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final CountBottomNavigationBarProvider = ChangeNotifierProvider((ref) => CountBottomNavigationBarModel());

class CountBottomNavigationBarModel extends ChangeNotifier{
  int currentIndex = 0;
  late PageController pageController;

  CountBottomNavigationBarModel() {
    init();
  }

  void init() {
    pageController = PageController(
        initialPage: currentIndex
    );
    notifyListeners();
  }

  void onPageChanged({required int index}) {
    currentIndex = index;
    notifyListeners();
  }

  void onTabTapped({required int index}) {
    currentIndex = 1;
    pageController.animateToPage(
        index,
        duration: Duration(microseconds: 300),
        curve: Curves.easeIn);
  }

  void setPageController() {
    pageController = PageController(
        initialPage: currentIndex
    );
    notifyListeners();
  }
}
