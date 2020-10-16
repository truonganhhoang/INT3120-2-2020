import 'package:bucha_app/ButtonBack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  final String name;
  final List<String> rule;
  final List<String> usage;

  InformationPage({this.name, this.rule, this.usage});

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  Widget getTextWidgets(List<String> stringList) {
    List<Widget> widgetList = new List<Widget>();
    for (var i = 0; i < stringList.length; i++) {
      widgetList.add(new Align(
        alignment: Alignment.centerLeft,
        child: Text(
          stringList[i],
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 16.0,
          ),
        ),
      ));
    }
    return new Align(
        alignment: Alignment.centerLeft,
        child: new Column(
          children: widgetList
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.pinkAccent,
        child: new Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
              height: 650.0,
              decoration: BoxDecoration(
                color: Colors.indigo[900],
              ),
              child: new Column(
                children: <Widget>[
                  Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.orange[400],
                    ),
                    child: Center(
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 550.0,
                      child: ListView(
                        children: <Widget>[
                          Text(
                            '1. Công thức',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontSize: 18.0,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          getTextWidgets(widget.rule),
                          Text(
                            '2. Cách dùng',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontSize: 18.0,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          getTextWidgets(widget.usage),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50.0,
              child: Center(
                child: ButtonBack(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
