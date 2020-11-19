import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/Example.dart';

class Information extends StatelessWidget{
  final String name;
  final List<Example> example;
  final List<String> note;

  Information({this.name, this.example, this.note});

  Widget getTextWidgets(List<String> stringList) {
    List<Widget> widgetList = new List<Widget>();
    for (String string in stringList) {
      widgetList.add(new Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          string,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.greenAccent,
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
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            this.name,
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 16.0
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            children: example,
          ),
        ),
        getTextWidgets(note),
        Padding(padding: EdgeInsets.only(bottom: 10.0),)
      ],
    );
  }
}