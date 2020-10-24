import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vietjack_mobile_app/Header.dart';
import 'package:vietjack_mobile_app/UI/MyCustomCard.dart';

// ignore: must_be_immutable
class ThiOnline extends StatefulWidget {
  static int firstRun = 0;
  static int weeksNumber = 0;
  static dynamic detailArray;
  ThiOnline({Key key}) : super(key: key) {
    FirebaseFirestore.instance
        .collection("ThiOnline")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {});
    });
  }
  @override
  _ThiOnlineState createState() => _ThiOnlineState();
}

class _ThiOnlineState extends State<ThiOnline> {
  static String currentSubject = "Ngữ văn";
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
  bool _isShowingModal = true;
  bool _showAppbar = false;
  ScrollController _scrollBottomController = new ScrollController();

  @override
  void initState() {
    super.initState();
    myScroll();
    if (_isShowingModal && ThiOnline.firstRun < 1) {
      Future.delayed(Duration(seconds: 1)).then((_) {
        _onButtonPress();
      });
    }
    if (ThiOnline.firstRun < 1) {
      FirebaseFirestore.instance
          .collection("ThiOnline")
          .doc("Class 12")
          .collection("Subject")
          .doc(currentSubject)
          .get()
          .then((value) {
        this.setState(() {
          ThiOnline.weeksNumber = value.data()["weeks"];
        });
      });
      FirebaseFirestore.instance
          .collection("ThiOnline")
          .doc("Class 12")
          .collection("Subject")
          .doc(currentSubject)
          .collection("Detail")
          .orderBy("id")
          .get()
          .then((data) => {
                this.setState(() {
                  ThiOnline.detailArray = data.docs;
                })
              });
    }
  }

  void _changeSubject(BuildContext context, String subject) async {
    this.setState(() {
      currentSubject = subject;
      Navigator.pop(context);
    });
    FirebaseFirestore.instance
        .collection("ThiOnline")
        .doc("Class 12")
        .collection("Subject")
        .doc(currentSubject)
        .get()
        .then((value) {
      this.setState(() {
        ThiOnline.weeksNumber = value.data()["weeks"];
      });
    });
  }

  void _onButtonPress() {
    ThiOnline.firstRun++;
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
                            _changeSubject(context, subjectArray[index]),
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
        MyCustomCard(
            key: PageStorageKey('MyCustomCard'),
            weekNumber: ThiOnline.weeksNumber,
            snapshot: ThiOnline.detailArray),
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
        body: ThiOnline.detailArray == null ? Scaffold() : body(width, height),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onButtonPress();
          },
          child: Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ));
  }
}
