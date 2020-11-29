import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'TimKiem.dart';
import 'ThiOnline.dart';
import 'homePage.dart';
import 'LoginPage.dart';
import 'UserInfoPage.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primarySwatch: Colors.green,
          buttonColor: Colors.yellow,
          scaffoldBackgroundColor: Colors.brown[50],
          fontFamily: 'Sansation'
      ),
      color: Colors.red,
      home: new LoginPage()));
}

//////////
class VietJackNavigationBar extends StatefulWidget {
  /*User user;
  VietJackNavigationBar({Key key, this.user}) : super(key:key);*/
  @override
  _VietJackNavigationBarState createState() => _VietJackNavigationBarState();
}

class _VietJackNavigationBarState extends State<VietJackNavigationBar> {
  int _currentIndex = 0;

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final PageStorageBucket bucket = PageStorageBucket();

  List<Widget> _children = [
    homePage(),
    TimKiem(),
    ThiOnline(key: PageStorageKey('ThiOnline')),
    UserInfoPage()
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: PageStorage(
        child: _children[_currentIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Trang chủ",
                  style: TextStyle(color: Colors.black.withOpacity(0.6)))),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text("Tìm kiếm",
                style: TextStyle(color: Colors.black.withOpacity(0.6))),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.book),
              title: new Text("Thi Online",
                  style: TextStyle(color: Colors.black.withOpacity(0.6)))),
          BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle),
              title: new Text("Tài khoản",
                  style: TextStyle(color: Colors.black.withOpacity(0.6))))
        ],
      ),
    );
  }
}
