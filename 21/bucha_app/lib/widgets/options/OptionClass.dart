import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../animation route/BouncyPageRoute.dart';
import '../Vocabulary/SceneChoice.dart';
import '../../constants.dart';
import '../../main.dart';

class Class extends StatelessWidget {
  final String name;

  final StatefulWidget linkpage;

  Class({this.name, this.linkpage});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: new RaisedButton(
          onPressed: () {
            Navigator.push(context, BouncyPageRoute(widget:linkpage));
          },
          child: Text(
            name,
            style: TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          color: Color(0xff27AE60),
        ));
  }
}

class OptionClass extends StatefulWidget {
  @override
  _OptionClassState createState() => _OptionClassState();
}

class _OptionClassState extends State<OptionClass> {
  final nameList = [
    "Lớp 1",
    "Lớp 2",
    "Lớp 3",
    "Lớp 4",
    "Lớp 5",
    "Lớp 6",

  ];
  final sceneList = [
    "class1",
    "class2",
    "class3",
    "class4",
    "class5",
    "class6",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color(0xff3fe7f1)),
        child: new Column(
          children: <Widget>[
            SizedBox(
              height: height(context) * 0.15,
            ),
            Container(
              height: 50.0,
              margin: const EdgeInsets.only(right: 20.0, left: 20.0),
              decoration: BoxDecoration(
                  color: Color(0xffCFBB24),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0))),
              child: Container(
                child: Center(
                  child: Text(
                    "Chọn Lớp",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                color: Color(0xff9CF5FE),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
              ),
              child: Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Color(0xff0E2D6A),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                  ),
                  child: Container(
                      child: Column(
                    children: [
                      SizedBox(
                        height: height(context) * 0.5,
                        child: new GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 2.5),
                            itemBuilder: (context, index) => Class(
                                name: nameList[index],
                                linkpage: SceneChoice(scene: sceneList[index])),
                            itemCount: nameList.length),
                      ),
                      SizedBox(
                        height: height(context) * 0.07,
                      )
                    ],
                  ))),
            ),
            SizedBox(
              height: height(context) * 0.01,
            ),
            Container(
              width: 50.0,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
