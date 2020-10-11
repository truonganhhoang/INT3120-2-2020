import 'package:flutter/material.dart';
import 'package:quiztest/setting/setting.dart';
import 'home_page.dart';
import 'search.dart';
import 'activity/activity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, backgroundColor: Colors.white),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final tabs = [HomePage(), Search(), Activity(), Setting()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          tabs[_currentIndex],
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: Colors.orangeAccent,
                unselectedItemColor: Colors.black,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/icons/home.png")),
                      title: Text(
                        "Home",
                        style: TextStyle(fontSize: 10),
                      )),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/icons/search.png")),
                      title: Text(
                        "Search",
                        style: TextStyle(fontSize: 10),
                      )),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/icons/activity.png")),
                      title: Text(
                        "Activity",
                        style: TextStyle(fontSize: 10),
                      )),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/icons/settings.png")),
                      title: Text(
                        "Setting",
                        style: TextStyle(fontSize: 10),
                      )),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            bottom: 10,
            left: 10,
            right: 10,
          )
        ],
      ),
    );
  }
}

Widget get _buildBottomNavigationBar {
  return ClipRRect(
    borderRadius: BorderRadius.circular(45),
    child: BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.orangeAccent,
      unselectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icons/home.png")),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 10),
            )),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icons/search.png")),
            title: Text(
              "Search",
              style: TextStyle(fontSize: 10),
            )),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icons/activity.png")),
            title: Text(
              "Activity",
              style: TextStyle(fontSize: 10),
            )),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icons/settings.png")),
            title: Text(
              "Setting",
              style: TextStyle(fontSize: 10),
            )),
      ],
    ),
  );
}
