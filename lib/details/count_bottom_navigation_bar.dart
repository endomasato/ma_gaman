import 'package:flutter/material.dart';
import 'package:ma_gaman/models/count_bottom_navigation_bar_model.dart';

import 'bottom_navigation_bar_elements.dart';

class CountBottomNavigationBar extends StatelessWidget {
  const CountBottomNavigationBar({Key? key, required this.countBottomNavigationBarModel}) : super(key: key);

  final CountBottomNavigationBarModel countBottomNavigationBarModel;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) => countBottomNavigationBarModel.onTabTapped(index: index),
        currentIndex: countBottomNavigationBarModel.currentIndex,
        type: BottomNavigationBarType.fixed,
        items: bottomNavigationBarElements);

  }
}
