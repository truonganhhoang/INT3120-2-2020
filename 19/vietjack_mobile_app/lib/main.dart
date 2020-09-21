import 'package:flutter/material.dart';
import 'homePage.dart';
import 'TimKiem.dart';
import 'ThiOnline.dart';
import 'homePage.dart';

void main() {
  runApp(new MaterialApp(home: new VietJackNavigationBar()));
}

class VietJackNavigationBar extends StatefulWidget {
  @override
  _VietJackNavigationBarState createState() => _VietJackNavigationBarState();
}

class _VietJackNavigationBarState extends State<VietJackNavigationBar> {
  bool _isThiOnlineRun = true;
  int _currentIndex = 0;

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [homePage(), TimKiem(), ThiOnline()];
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
