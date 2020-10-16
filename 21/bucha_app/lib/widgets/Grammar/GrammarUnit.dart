import 'package:bucha_app/widgets/Grammar/InformationPage.dart';
import 'package:flutter/material.dart';

class GrammarUnit extends StatelessWidget{
  final String name;
  final Color color;
  final List<String> rule;
  final List<String> usage;

  GrammarUnit({this.name, this.color, this.rule, this.usage});

  void _navigateToInformationPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return InformationPage(
        name: this.name,
        rule: this.rule,
        usage: this.usage,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.0),
      width: 320.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: this.color,
      ),
      child: InkWell(
        onTap: () {
          _navigateToInformationPage(context);
        },
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, top: 6.0),
          child: Text(
            this.name,
          ),
        ),
      ),
    );
  }
}