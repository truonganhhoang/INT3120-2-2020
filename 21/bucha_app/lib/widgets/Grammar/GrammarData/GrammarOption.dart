import 'package:bucha_app/widgets/Grammar/GrammarData/GrammarUnit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/UnitPage.dart';

class GrammarOption extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final List<GrammarUnit> units;

  GrammarOption({this.name, this.color, this.units});

  void _navigateToUnitPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return UnitPage(
        name: this.name,
        color: this.color,
        units: this.units,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: InkWell(
        highlightColor: color['highlight'],
        onTap: () {
          _navigateToUnitPage(context);
        },
        child: Center(
          child: Text(
            this.name,
            style: TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue[900],
            ),
          ),
        ),
      ),
    );
  }
}
