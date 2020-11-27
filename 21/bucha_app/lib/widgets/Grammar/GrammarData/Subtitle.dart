import 'package:flutter/material.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/Information.dart';

class Subtitle extends StatelessWidget {
  final String name;
  final List<Information> information;

  Subtitle({this.name, this.information});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            this.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: Column(
            children: information,
          ),
        ),
      ],
    );
  }


}