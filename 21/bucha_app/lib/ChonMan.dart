import 'package:bucha_app/Man.dart';
import 'package:bucha_app/widgets/options/OptionClass.dart';
import 'package:flutter/material.dart';


class Man extends StatelessWidget {
  final String name;
  final StatefulWidget linkpage;



  Man({this.name, this.linkpage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => linkpage));
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


class ChonMan extends StatefulWidget {
  final String scene;

  ChonMan({this.scene});

  @override
  _ChonManState createState() => _ChonManState();
}

class _ChonManState extends State<ChonMan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
              color: Color(0xff08E6FD),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 50),
                          decoration: BoxDecoration(
                              color: Color(0xffA2FB8F),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Container(
                                margin:
                                const EdgeInsets.only(top: 50, right: 20, left: 20),
                                decoration: BoxDecoration(
                                    color: Color(0xff0A2842),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    new Padding(padding: const EdgeInsets.only(top: 20)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Man(
                                          name: "Bài 1",
                                          linkpage: ManChoi(level: "1",scene: widget.scene,),

                                        ),
                                        Man(
                                          name: "Bài 2",
                                          linkpage: ManChoi(level: "2",scene: widget.scene,),
                                        ),
                                        Man(
                                          name: "Bài 3",
                                          linkpage: ManChoi(level: "3",scene: widget.scene,),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Man(
                                          name: "Bài 4",
                                          linkpage: ManChoi(level: "4",scene: widget.scene,),
                                        ),
                                        Man(
                                          name: "Bài 5",
                                          linkpage: ManChoi(level: "5",scene: widget.scene,),
                                        ),
                                        Man(
                                          name: "Bài 6",
                                          linkpage: ManChoi(level: "6",scene: widget.scene,),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Man(
                                          name: "Bài 7",
                                          linkpage: ManChoi(level: "7",scene: widget.scene,),
                                        ),
                                        Man(
                                          name: "Bài 8",
                                          linkpage: ManChoi(level: "8",scene: widget.scene,),
                                        ),
                                        Man(
                                          name: "Bài 9",
                                          linkpage: ManChoi(level: "9",scene: widget.scene,),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Man(
                                          name: "Bài 10",
                                          linkpage: ManChoi(level: "10",scene: widget.scene,),
                                        ),
                                        Man(
                                          name: "Bài 11",
                                          linkpage: ManChoi(level: "11",scene: widget.scene,),
                                        ),
                                        Man(
                                          name: "Bài 12",
                                          linkpage: ManChoi(level: "12",scene: widget.scene,),
                                        ),
                                      ],
                                    ),
                                    new Padding(padding: const EdgeInsets.only(top: 20)),
                                  ],
                                ),
                              ),
                              Container(
                                width: 50.0,
                                height: 50.0,
                                margin: const EdgeInsets.only(top: 10,bottom: 10),
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
              )
          ),
        ));
  }
}
