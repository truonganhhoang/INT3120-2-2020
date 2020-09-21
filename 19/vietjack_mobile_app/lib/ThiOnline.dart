import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vietjack_mobile_app/common/Header.dart';
import 'package:vietjack_mobile_app/Header.dart';

import 'homePage.dart';

class ThiOnline extends StatefulWidget {
  bool firstRun;
  @override
  _OnThiState createState() => _OnThiState();
}

class _OnThiState extends State<ThiOnline> {
  bool _showAppbar = false;
  ScrollController _scrollBottomController = new ScrollController();

  @override
  void initState() {
    super.initState();
    myScroll();
  }

  void myScroll() async {
    _scrollBottomController.addListener(() {
      if (_scrollBottomController.position.pixels >= 100) {
        setState(() {
          _showAppbar = true;
        });
      }
      if (_scrollBottomController.position.pixels < 100) {
        setState(() {
          _showAppbar = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollBottomController.removeListener(() {});
    super.dispose();
  }

  Widget containterContent() {
    return Container(
      height: 50.0,
      color: Colors.cyanAccent,
      margin: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width - 100,
      child: Center(
          child: Text(
        'Item 1',
        style: TextStyle(
          fontSize: 14.0,
        ),
      )),
    );
  }

  Widget body(width, height) {
    return ListView(
      controller: _scrollBottomController,
      children: <Widget>[
        Header(
          width: width,
          height: height,
        ),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
        containterContent(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width);
    print(height);
    return new Scaffold(
      appBar: _showAppbar
          ? AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title:
                  new Text("Thi Online", style: TextStyle(color: Colors.black)),
            )
          : PreferredSize(
              child: Container(),
              preferredSize: Size(0.0, 0.0),
            ),
      body: body(width, height),
    );
  }
}
