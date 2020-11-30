import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vietjack_mobile_app/Header.dart';
import 'package:vietjack_mobile_app/UI/MyCustomCard.dart';

import 'UI/API.dart';

// ignore: must_be_immutable
class ThiOnline extends StatefulWidget {
  int firstRun = 0;

  void notFirstRun() {
    this.firstRun++;
  }

  ThiOnline({Key key}) : super(key: key);
  @override
  _ThiOnlineState createState() => _ThiOnlineState();
}

class _ThiOnlineState extends State<ThiOnline> {
  String currentSubject;
  final GlobalKey<MyCustomCardState> _key = GlobalKey();
  List<String> subjectArray = [];
  bool _isShowingModal = true;
  bool _showAppbar = false;
  ScrollController _scrollBottomController = new ScrollController();

  @override
  void initState() {
    super.initState();
    this.subjectArray = ExamAPI.getListSubject();
    myScroll();

    if (_isShowingModal && widget.firstRun < 1) {
      Future.delayed(Duration(seconds: 1)).then((_) {
        _onButtonPress();
      });
    }
  }

  void changeSubject(BuildContext context, String subject) async {
    _key.currentState.changeSubject(subject);
    Navigator.pop(context);
    this.setState(() {
      this.currentSubject = subject;
    });
  }

  void _onButtonPress() {
    widget.notFirstRun();
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0))),
        builder: (context) {
          return Container(
              height: 800,
              child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  childAspectRatio: (150 / 175),
                  padding: const EdgeInsets.all(20),
                  mainAxisSpacing: 20,
                  children: List.generate(subjectArray.length, (index) {
                    return FlatButton(
                        onPressed: () =>
                            changeSubject(context, subjectArray[index]),
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(children: <Widget>[
                                Icon(Icons.home),
                                Text(subjectArray[index],
                                    style: TextStyle(fontSize: 11),
                                    textAlign: TextAlign.center)
                              ]),
                            ),
                          ],
                        ));
                  })));
        });
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

  void updateSubject(subject) {
    this.setState(() {
      this.currentSubject = subject;
    });
  }

  @override
  void dispose() {
    _scrollBottomController.removeListener(() {});
    super.dispose();
  }

  Widget body(width, height) {
    return ListView(
      controller: _scrollBottomController,
      children: <Widget>[
        Header(
          width: width,
          height: height,
        ),
        MyCustomCard(
          key: _key,
          currentSubject:
              this.currentSubject == null ? 'Ngữ văn' : this.currentSubject,
          function: this.updateSubject,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: _showAppbar
            ? AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title:
                    Text("Thi Online", style: TextStyle(color: Colors.black)),
              )
            : PreferredSize(
                child: Container(),
                preferredSize: Size(0.0, 0.0),
              ),
        body: body(width, height),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onButtonPress();
          },
          child: Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ));
  }
}
