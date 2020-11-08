import 'package:flutter/material.dart';
import 'package:quiztest/bloC/topic/topic_bloc.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/views/setting/setting.dart';
import 'views/home/home_page.dart';
import 'views/search/search.dart';
import 'views/activity/activity.dart';
import 'package:quiztest/services/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/challenge/challenge_screen.dart';

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
            scaffoldBackgroundColor: Colors.white,
            backgroundColor: Colors.white),
        home: Challenge());
  }
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final tabs = [HomePageBloc(), Search(), Activity(), Setting()];

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

class HomePageBloc extends StatelessWidget {
  const HomePageBloc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopicBloc(api: API_Manager()),
      child: HomePage(),
    );
  }
}
