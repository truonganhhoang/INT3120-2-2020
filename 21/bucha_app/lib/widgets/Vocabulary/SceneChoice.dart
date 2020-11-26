import 'file:///E:/INT3120-2-2020/21/bucha_app/lib/widgets/Vocabulary/ScenePlay.dart';
import 'package:bucha_app/widgets/options/OptionClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../animation route/BouncyPageRoute.dart';
import '../../constants.dart';

class Scene extends StatelessWidget {
  final String name;
  final StatefulWidget linkpage;

  Scene({this.name, this.linkpage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: RaisedButton(
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
        color: Color(0xff1E6ADC),
      ),
    );
  }
}

class SceneChoice extends StatefulWidget {
  final String scene;

  SceneChoice({this.scene});

  @override
  _ChonManState createState() => _ChonManState();
}

class _ChonManState extends State<SceneChoice> {
  final nameList = [
    "Bài 1",
    "Bài 2",
    "Bài 3",
    "Bài 4",
    "Bài 5",
    "Bài 6",
  ];
  final levelList = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: Color(0xff08E6FD),
          child: Column(
            children: [
              SizedBox(
                height: height(context)*0.05,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [

                  Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0,top: 50.0),
                      decoration: BoxDecoration(
                          color: Color(0xffA2FB8F),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 50, right: 20, left: 20),
                              decoration: BoxDecoration(
                                  color: Color(0xff0A2842),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height(context)*0.02,
                                    ),
                                    SizedBox(
                                      height: height(context) * 0.5,
                                      child: new GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 1.2),
                                          itemBuilder: (context, index) => Scene(
                                                name: nameList[index],
                                                linkpage: ScenePlay(
                                                  level: levelList[index],
                                                  scene: widget.scene,
                                                ),
                                              ),
                                      itemCount: nameList.length),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
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
                      )),
                  Container(
                    width: 200,
                    height: 50,
                    margin: const EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                        color: Color(0xffF76C57),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Chọn Bài",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
                  ),
                ],
              ),
            ],
          )),
    ));
  }
}
