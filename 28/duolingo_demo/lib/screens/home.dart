import 'package:flutter/material.dart';

import 'levels.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          navBarItem(
              'assets/images/home.png', 'assets/images/home-clicked.png'),
          navBarItem('assets/images/info.png', 'assets/images/info.png'),
          navBarItem('assets/images/rank.png', 'assets/images/rank.png'),
          navBarItem('assets/images/store.png', 'assets/images/store.png'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Levels(),
    );
  }

  BottomNavigationBarItem navBarItem(String image, String activeImage) {
    return BottomNavigationBarItem(
      icon: Image.asset(image, height: 30),
      title: Container(),
      activeIcon: Image.asset(activeImage),
    );
  }
}
