import 'package:flutter/material.dart';

class dictionary extends StatefulWidget {
  @override
  _dictionaryState createState() => _dictionaryState();
}

// ignore: camel_case_types
class _dictionaryState extends State<dictionary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Color(0xff41A4A1),
          child: Center(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: 60.0, left: 25.0, right: 25.0, bottom: 90.0),
                  child: Stack(
                    children: <Widget>[
                      // Container(
                      //   child: Column(
                      //     children: [
                      //       SizedBox(
                      //         height: 600,
                      //         width: 400,
                      //         child: DecoratedBox(
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Color(0xff27AE60),width: 20,),
                      //             borderRadius: BorderRadius.all(Radius.circular(30),),
                      //             color: Color(0xff0A1A52),
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),

                      // Ô kết quả
                      Container(
                        height: 800,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff27AE60), width: 20.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            color: Color(0xff0A1A52)),
                      ),
                      // Search box
                      Container(
                        height: 40.0,
                        margin:
                            EdgeInsets.only(top: 30.0, left: 45.0, right: 45.0),
                        decoration: BoxDecoration(
                            color: Color(0xff668EA7),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Tìm Kiếm",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                ),
                                icon: Icon(Icons.search, color: Colors.amber,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
