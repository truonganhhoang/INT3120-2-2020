import 'package:flutter/material.dart';
import 'homePage.dart';
import 'TimKiem.dart';
import 'OnThi.dart';
import 'homePage.dart';

void main() {
  runApp(new MaterialApp(home: new VietJackNavigationBar()));
}

class VietJackNavigationBar extends StatefulWidget {
  @override
  _VietJackNavigationBarState createState() => _VietJackNavigationBarState();
}

class _VietJackNavigationBarState extends State<VietJackNavigationBar> {
  int _currentIndex = 0;
  List<Widget> _children = [homePage(), TimKiem(), OnThi()];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
