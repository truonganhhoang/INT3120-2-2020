import 'package:flutter/material.dart';


class MnhnhchnhWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator MnhnhchnhWidget - FRAME
    return Container(
        width: 360,
        height: 640,
        decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 15,
                  left: 13,
                  child: Container(
                      width: 347,
                      height: 30,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 347,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color : Color.fromRGBO(255, 255, 255, 1),
                                    )
                                )
                            ),Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color : Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    image : DecorationImage(
                                                        image: AssetImage('images/menu_section.png'),
                                                        fit: BoxFit.fitWidth
                                                    ),
                                                  )
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 0,
                                left: 30,
                                child: Container(
                                    width: 90,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image : DecorationImage(
                                          image: AssetImage('images/icon1.png'),
                                          fit: BoxFit.fitWidth
                                      ),
                                    )
                                )
                            ),Positioned(
                                top: 0,
                                left: 317,
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image : DecorationImage(
                                          image: AssetImage('images/12.png'),
                                          fit: BoxFit.fitWidth
                                      ),
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 59,
                  left: 13,
                  child: Container(
                      width: 347,
                      height: 226,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 1,
                                left: 0,
                                child: Container(
                                    width: 347,
                                    height: 225,
                                    decoration: BoxDecoration(
                                      color : Color.fromRGBO(255, 255, 255, 1),
                                    )
                                )
                            ),Positioned(
                                top: 26,
                                left: 0,
                                child: Container(
                                    width: 340,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image : DecorationImage(
                                          image: AssetImage('images/nav-dexuat.png'),
                                          fit: BoxFit.fitWidth
                                      ),
                                    )
                                )
                            ),Positioned(
                                top: 0,
                                left: 0,
                                child: Text('Thi Thử', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 13,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 296,
                  left: -6,
                  child: null
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
        //  title: Text('Hello Rectangle'),
        //),
        body: MnhnhchnhWidget(),
      ),
    ),
  );
}