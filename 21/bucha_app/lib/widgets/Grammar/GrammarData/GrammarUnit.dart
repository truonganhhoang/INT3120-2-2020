import 'package:bucha_app/widgets/Grammar/GrammarData/InformationPage.dart';
import 'package:flutter/material.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/InformationTitle.dart';

class GrammarUnit extends StatelessWidget{
  final String name;
  final Color color;
  final List<InformationTitle> title;

  GrammarUnit({this.name, this.color, this.title});

  void _navigateToInformationPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return InformationPage(
        name: this.name,
        title: this.title,
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