import 'package:duolingo_demo/screens/lesson2.dart';
import 'package:flutter/material.dart';
import 'package:duolingo_demo/screens/lesson1-FalseResult.dart';
import 'package:duolingo_demo/screens/lesson1-TrueResult.dart';
import 'home.dart';

class Lesson1 extends StatefulWidget {
  @override
  _Lesson1State createState() => _Lesson1State();
}

class _Lesson1State extends State<Lesson1> {
  bool isTapped;
  var numberTapped;
  var isChecked = [false, false, false, false];
  // luu vi tri gan nhat duoc Tap
  var lastChecked;

  @override
  void initState() {
    super.initState();
    isTapped = false;
    numberTapped = 0;
    lastChecked = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 2,
            title: Row(children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Image.asset('assets/images/x_button.png', height: 25)),
              SizedBox(
                width: 20,
              ),
              Container(
                child: Container(
                  height: 15,
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: new Container(
                    height: 15,
                    width: 20,
                    decoration: new BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset('assets/images/heart.png', height: 30),
            ])),
        body: new Container(
          margin: const EdgeInsets.all(10.0),
          // alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(10.0)),
              Container(
                alignment: Alignment.topLeft,
                height: 30,
                child: Text(
                  'Hình nào là "Cà Phê"?',
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Padding(padding: EdgeInsets.all(30.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  answer(
                      'assets/images/multipleChoiceQuestion/lesson1-1/coffee.PNG',
                      1),
                  answer(
                      'assets/images/multipleChoiceQuestion/lesson1-1/bread.PNG',
                      2),
                ],
              ),
              new Padding(padding: EdgeInsets.all(5.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  answer(
                      'assets/images/multipleChoiceQuestion/lesson1-1/rice.PNG',
                      3),
                  answer(
                      'assets/images/multipleChoiceQuestion/lesson1-1/cake.PNG',
                      4),
                ],
              ),
              new Padding(padding: EdgeInsets.all(35.0)),
              MaterialButton(
                minWidth: 350.0,
                color: isTapped ? Colors.green : Colors.grey,
                height: 40.0,
                onPressed: () {
                  if (numberTapped == 1) {
                    debugPrint("true");
                    Navigator.push(
                        // EDIT: lesson1 -> lesson1
                        context,
                        MaterialPageRoute(
                            builder: (context) => Lesson1_TrueResult()));
                  } else {
                    debugPrint("wrong");
                    Navigator.push(
                        // EDIT: lesson1 -> lesson1
                        context,
                        MaterialPageRoute(
                            builder: (context) => Lesson1_FalseResult()));
                  }
                },
                child: new Text(
                  'KIỂM TRA',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }

  Widget answer(String image, var number) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (lastChecked != 0) {
            isChecked[lastChecked - 1] = false;
          }
          isTapped = true;
          numberTapped = number;
          lastChecked = number;
          isChecked[number - 1] = true;
        });
      },
      child: Container(
        height: 190,
        width: 140,
        decoration: new BoxDecoration(
          color: isChecked[number - 1] ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.asset(image, height: 190),
      ),
    );
  }
}
