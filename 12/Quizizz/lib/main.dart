import 'package:flutter/material.dart';
import 'package:quiztest/setting/setting.dart';
import 'home/home_page.dart';
import 'search/search.dart';
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
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              spreadRadius: 0,
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 8),
              blurRadius: 20)
        ]),
        // padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 1.0,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.orangeAccent,
            unselectedLabelStyle: TextStyle(color: Colors.black),
            unselectedItemColor: Colors.black,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: ImageIcon(AssetImage("assets/icons/home.png")),
              ),
              BottomNavigationBarItem(
                label: "Search",
                icon: ImageIcon(AssetImage("assets/icons/search.png")),
              ),
              BottomNavigationBarItem(
                label: "Activities",
                icon: ImageIcon(AssetImage("assets/icons/activity.png")),
              ),
              BottomNavigationBarItem(
                label: "Setting",
                icon: ImageIcon(AssetImage("assets/icons/settings.png")),
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
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
