import 'package:flutter/material.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/Subtitle.dart';

class InformationTitle extends StatelessWidget{
  final String name;
  final List<Subtitle> subtitle;

  InformationTitle({this.name, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            this.name,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Container(
          child: Column(
            children: subtitle,
          )
        )
      ],
    );
  }
}