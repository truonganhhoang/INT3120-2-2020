import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vietjack_mobile_app/Header.dart';

// ignore: must_be_immutable
class ThiOnline extends StatefulWidget {
  int firstRun;
  ThiOnline(firstRun) {
    this.firstRun = firstRun;
  }
  @override
  _OnThiState createState() => _OnThiState(firstRun);
}

class _OnThiState extends State<ThiOnline> {
  int firstRun;
  final List<String> subjectArray = [
    'Ngữ văn',
    'Toán',
    'Vật lí',
    'Hóa học',
    'Sinh học',
    'Địa lí',
    'Tiếng Anh',
    'Lịch sử',
    'Tin học',
    'Giáo dục công dân',
    'Công nghệ'
  ];
  _OnThiState(firstRun) {
    this.firstRun = firstRun;
  }
  bool _isShowingModal = true;
  bool _showAppbar = false;
  ScrollController _scrollBottomController = new ScrollController();

  @override
  void initState() {
    super.initState();
    myScroll();
    if (_isShowingModal && this.firstRun <= 1) {
      Future.delayed(Duration(seconds: 1)).then((_) {
        _onButtonPress();
      });
    }
  }

  void _onButtonPress() {
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
                        onPressed: null,
                        padding: EdgeInsets.all(10.0),
                        child: Expanded(
                          child: Column(children: <Widget>[
                            Icon(Icons.home),
                            Text(subjectArray[index],
                                style: TextStyle(fontSize: 11),
                                textAlign: TextAlign.center)
                          ]),
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
