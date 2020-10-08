import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vietjack_mobile_app/Header.dart';
import 'package:vietjack_mobile_app/UI/MyCustomCard.dart';

// ignore: must_be_immutable
class ThiOnline extends StatefulWidget {
  static int firstRun = 0;
  int weeksNumber;
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
  int weeksNumber = 0;
  String currentSubject = "Ngữ Văn";
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
    print(1);
    myScroll();
    if (_isShowingModal && ThiOnline.firstRun < 1) {
      Future.delayed(Duration(seconds: 1)).then((_) {
        _onButtonPress();
      });
    }
    FirebaseFirestore.instance
        .collection("ThiOnline")
        .doc("Class 12")
        .collection("Subject")
        .doc(this.currentSubject)
        .get()
        .then((value) {
      this.setState(() {
        this.weeksNumber = value.data()["weeks"];
      });
    });
  }

  void _changeSubject(BuildContext context, String subject) async {
    this.setState(() {
      this.currentSubject = subject;
      Navigator.pop(context);
    });
    FirebaseFirestore.instance
        .collection("ThiOnline")
        .doc("Class 12")
        .collection("Subject")
        .doc(this.currentSubject)
        .get()
        .then((value) {
      this.setState(() {
        this.weeksNumber = value.data()["weeks"];
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

  Widget body(width, height) {
    return ListView(
      controller: _scrollBottomController,
      children: <Widget>[
        Header(
          width: width,
          height: height,
        ),
        MyCustomCard(
            key: PageStorageKey('MyCustomCard'), weekNumber: this.weeksNumber)
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
