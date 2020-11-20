import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ChonMan.dart';
import '../../main.dart';

class Class extends StatelessWidget {
  final String name;

  final StatefulWidget linkpage;

  Class({this.name, this.linkpage});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 90,
        height: 50,
        margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: new RaisedButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => linkpage));
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color(0xff3fe7f1)),
        child: new Column(
          children: <Widget>[
            new Padding(padding: const EdgeInsets.only(top: 150)),
            Container(
              height: 50.0,
              margin: const EdgeInsets.only(right: 20.0,left: 20.0),
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
              margin:
                  const EdgeInsets.only(left: 20.0, right: 20.0),
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
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child:
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Class(
                              name: "Lớp 1",
                              linkpage: ChonMan(scene:"class1",),
                            ),
                            Class(
                              name: "Lớp 2",
                              linkpage: ChonMan(scene:"class2",),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Class(
                              name: "Lớp 3",
                              linkpage: ChonMan(scene:"class3",),
                            ),
                            Class(
                              name: "Lớp 4",
                              linkpage: ChonMan(scene:"class4",),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Class(
                              name: "Lớp 5",
                              linkpage: ChonMan(scene:"class5",),
                            ),
                            Class(
                              name: "Lớp 6",
                              linkpage: ChonMan(scene:"class6",),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Class(
                              name: "Lớp 7",
                              linkpage: ChonMan(scene:"class7",),
                            ),
                            Class(
                              name: "Lớp 8",
                              linkpage: ChonMan(scene:"class8",),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Class(
                              name: "Lớp 9",
                              linkpage: ChonMan(scene:"class9",),
                            ),
                            Class(
                              name: "Lớp 10",
                              linkpage: ChonMan(scene:"class10",),
                            ),
                          ],
                        ),
                      ],
                    ),

                )
              ),
            ),
            Container(
              width: 50.0,
              height: 50.0,
              margin: const EdgeInsets.only(top: 20.0),
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
