import 'package:flutter/material.dart';

class TuDien1 extends StatefulWidget {
  @override
  _TuDien1State createState() => _TuDien1State();
}

class _TuDien1State extends State<TuDien1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff41A4A1),
        child: Center(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: 60.0, left: 25.0, right: 25.0, bottom: 90.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff27AE60), width: 20.0),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Color(0xff0A1A52)),
                    ),
                    Container(
                      height: 40.0,
                      margin:
                          EdgeInsets.only(top: 30.0, left: 45.0, right: 45.0),
                      decoration: BoxDecoration(
                          color: Color(0xff668EA7),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Tìm Kiếm",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              icon: Icon(Icons.search, color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
