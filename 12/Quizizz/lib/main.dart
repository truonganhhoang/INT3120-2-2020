import 'package:flutter/material.dart';
import 'package:quiztest/views/play_screen/end_quiz.dart';
import 'package:quiztest/views/setting/setting.dart';
import 'views/home/home_page.dart';
import 'views/search/search.dart';
import 'views/activity/activity.dart';

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
      floatingActionButton: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                spreadRadius: 0,
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 2),
                blurRadius: 8)
          ],
        ),
        // padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 10, left: 14, right: 14),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
