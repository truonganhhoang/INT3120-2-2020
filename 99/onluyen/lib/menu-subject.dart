import 'package:flutter/material.dart';


class Menutluyn1mnhcWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Menutluyn1mnhcWidget - FRAME
    return Container(
        width: 360,
        height: 640,
        decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: 360,
                      height: 180,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 360,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color : Color.fromRGBO(126, 150, 236, 1),
                                    )
                                )
                            ),Positioned(
                                top: 10,
                                left: 321,
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image : DecorationImage(
                                          image: AssetImage('images/reset1.png'),
                                          fit: BoxFit.fitWidth
                                      ),
                                    )
                                )
                            ),Positioned(
                                top: 10,
                                left: 10,
                                child: null
                            ),Positioned(
                                top: 78,
                                left: 166,
                                child: Container(
                                    width: 194,
                                    height: 102,
                                    decoration: BoxDecoration(
                                      image : DecorationImage(
                                          image: AssetImage('images/study.png'),
                                          fit: BoxFit.fitWidth
                                      ),
                                    )
                                )
                            ),Positioned(
                                top: 40,
                                left: 60,
                                child: Text('Toán', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 180,
                  left: 0,
                  child: Container(
                      width: 360,
                      height: 460,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 360,
                                    height: 460,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 360,
                                                  height: 460,
                                                  decoration: BoxDecoration(
                                                    color : Color.fromRGBO(255, 255, 255, 1),
                                                  )
                                              )
                                          ),Positioned(
                                              top: 0,
                                              left: 0,
                                              child: null
                                          ),Positioned(
                                              top: 75,
                                              left: 0,
                                              child: null
                                          ),Positioned(
                                              top: 150,
                                              left: 0,
                                              child: null
                                          ),Positioned(
                                              top: 225,
                                              left: 0,
                                              child: null
                                          ),Positioned(
                                              top: 300,
                                              left: 0,
                                              child: null
                                          ),Positioned(
                                              top: 375,
                                              left: 0,
                                              child: null
                                          ),
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),
            ]
        )
    );
  }
}


void main() {
  runApp(
    MaterialApp(
      //debugShowCheckedModeBanner: false,
      //title: 'Hello Rectangle',
      home: Scaffold(
        //appBar: AppBar(
        //  title: Text('Hello Rectangle'),,
        //),
        body: Menutluyn1mnhcWidget(),
      ),
    ),
  );
}