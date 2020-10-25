import 'package:flutter/material.dart';
import 'package:vietjack_mobile_app/Header.dart';

import 'ExamsCard.dart';

class ExamsPicker extends StatefulWidget {
  ExamsPicker({Key key, this.currentSubject});

  final String currentSubject;

  @override
  _ExamsPickerState createState() => _ExamsPickerState(this.currentSubject);
}

class _ExamsPickerState extends State<ExamsPicker> {
  bool _showAppbar = false;
  final String currentSubject;
  ScrollController _scrollBottomController = new ScrollController();
  _ExamsPickerState(this.currentSubject);

  @override
  void dispose() {
    _scrollBottomController.removeListener(() {});
    super.dispose();
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
  void initState() {
    super.initState();
    myScroll();
  }

  Widget body(width, height) {
    return ListView(controller: _scrollBottomController, children: <Widget>[
      Header(
        width: width,
        height: height,
      ),
      ExamsCard(),
      ExamsCard(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    print(this.currentSubject);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: _showAppbar
          ? AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text("Thi Online", style: TextStyle(color: Colors.black)),
            )
          : PreferredSize(
              child: Container(),
              preferredSize: Size(0.0, 0.0),
            ),
      body: body(width, height),
    );
  }
}
