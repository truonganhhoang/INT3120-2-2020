import 'package:flutter/material.dart';

class Lesson1 extends StatefulWidget {
  @override
  _Lesson1State createState() => _Lesson1State();
}

class _Lesson1State extends State<Lesson1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 2,
            title: Row(children: <Widget>[
              Image.asset('assets/images/x_button.png', height: 25),
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
              Container(
                alignment: Alignment.topLeft,
                height: 30,
                child: Text(
                  'Hình nào là "thức ăn"?',
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Padding(padding: EdgeInsets.all(5.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  answer('assets/images/coffee.PNG'),
                  answer('assets/images/coffee.PNG'),
                ],
              ),
              new Padding(padding: EdgeInsets.all(5.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  answer('assets/images/coffee.PNG'),
                  answer('assets/images/coffee.PNG'),
                ],
              ),
              new Padding(padding: EdgeInsets.all(5.0)),
              MaterialButton(
                minWidth: 350.0,
                color: Colors.green,
                height: 40.0,
                onPressed: () {},
                child: new Text(
                  'KIỂM TRA',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }

  Widget answer(String image) {
    return Container(
      height: 190,
      width: 140,
      decoration: new BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Image.asset(image, height: 190),
    );
  }
}
