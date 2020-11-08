import 'package:flutter/material.dart';
import 'package:quiztest/views/play_screen/pauseWhilePlaying.dart';

class EnterChallengeRoom extends StatelessWidget {
  const EnterChallengeRoom({Key key, this.hostCode}) : super(key: key);
  final String hostCode;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        color: Colors.black,
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image(
                        image: AssetImage('assets/icons/play.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 160),
                      width: 107,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(196, 196, 196, 0.24)),
                      child: Text(
                        hostCode,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AlertWhilePlaying();
                            });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 62,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(196, 196, 196, 0.4),
                        ),
                        child: Text(
                          'Exit',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 80),
                child: Text("Enter the code",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    )),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 150,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "123 456",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 162,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(177, 72, 180, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Start game",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                width: 290,
                height: 86,
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(196, 196, 196, 0.4),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Text(
                        "Thanh Dat",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Image(
                        image: AssetImage('assets/icons/officer.png'),
                        width: 45,
                        height: 45,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
