import 'package:flutter/material.dart';
import 'package:learn_kanji/level-choose.dart';

class WordChoose extends StatelessWidget {
  const WordChoose({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                color: Color(0xff006265),
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                child: Column(children: <Widget>[
                  Container(
                    height: 100.0,
                    color: Color(0xff006265),
                    width: 100.0,
                    child: Align(
                      child: Image.asset(
                        'assets/logo.png',
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    elevation: 5.0,
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LevelChoose(),
                          ),
                        ),
                      },
                      child: Container(
                        width: 150,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'BEGINNER',
                              style: TextStyle(
                                  color: Color(0xff006465),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
