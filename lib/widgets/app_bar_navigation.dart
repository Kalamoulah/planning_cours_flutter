import 'package:flutter/material.dart';

import 'app_config.dart';

class AppBarNavigation extends StatelessWidget {
  const AppBarNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTabTapped,
    required this.items,
  });

  final int currentIndex;
  final Function(int) onTabTapped;
  final List<BottomNavigationBarItem> items;


  @override

 Widget build(BuildContext context) {
    return BottomNavigationBar(
         items: items,
        currentIndex: currentIndex,
        onTap: onTabTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color(0xFF141414),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
    );
  }

 /* Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      margin:  const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24))
      ),
      child:  BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          items: bottomNavigationBarItems,
          currentIndex: currentIndex,
          onTap: onTabTapped,

          unselectedItemColor: Colors.blue,
          showSelectedLabels: true,
          showUnselectedLabels: true
      ),
    );
  }*/

  }



