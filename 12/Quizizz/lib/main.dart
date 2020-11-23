import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quiztest/services/redux/reducer.dart';
import 'package:quiztest/views/setting/setting.dart';
import 'package:redux/redux.dart';
import 'views/home/home_page.dart';
import 'views/search/search.dart';
import 'views/activity/activity.dart';
import 'package:quiztest/services/user.dart';

const userName = "User Name";

void main() {
  final store =
      Store<String>(AppReducer().changeUserName, initialState: userName);
  runApp(StoreProvider(
    store: store,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            backgroundColor: Colors.white),
        home: Home());
  }
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final tabs = [HomePage(), Search(), Activity(), Setting()];

  @override
  void initState() {
    super.initState();
    UserSave().saveId("User Name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0.0
          ? null
          : Container(
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
