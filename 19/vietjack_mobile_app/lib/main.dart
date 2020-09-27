import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'homePage.dart';
import 'TimKiem.dart';
import 'ThiOnline.dart';
import 'homePage.dart';
import 'LoginPage.dart';

void main() {
  runApp(new MaterialApp(home: new LoginPage()));
}

//////////
class VietJackNavigationBar extends StatefulWidget {
  /*User user;
  VietJackNavigationBar({Key key, this.user}) : super(key:key);*/
  @override
  _VietJackNavigationBarState createState() => _VietJackNavigationBarState();
}

class _VietJackNavigationBarState extends State<VietJackNavigationBar> {
  int _isThiOnlineFirstRun = 0;
  int _currentIndex = 0;
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 2) {
      _isThiOnlineFirstRun++;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [
      homePage(userName: FirebaseAuth.instance.currentUser.displayName),
      TimKiem(),
      ThiOnline(_isThiOnlineFirstRun)
    ];
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text("Trang chủ")),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text("Tìm kiếm"),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.book), title: new Text("Thi Online"))
        ],
      ),
    );
  }
}