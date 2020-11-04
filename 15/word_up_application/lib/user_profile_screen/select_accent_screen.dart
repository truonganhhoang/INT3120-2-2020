import 'package:flutter/material.dart';

import '../size_config.dart';

class SelectAccent extends StatefulWidget {
  @override
  _SelectAccentState createState() => _SelectAccentState();
}

class _SelectAccentState extends State<SelectAccent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Accent'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.pop(context, 'British');
              },
              child: Container(
                margin: EdgeInsets.only(top: 5*SizeConfig.heightMultiplier),
                width: 20 * SizeConfig.widthMultiplier,
                  height: 7 * SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blueAccent)
                ),
                child: Center(child: Text('British')))),
          FlatButton(
              onPressed: () {
                Navigator.pop(context, 'American');
              },
              child: Container(
                margin: EdgeInsets.only(top: 5*SizeConfig.heightMultiplier),
                width: 20 * SizeConfig.widthMultiplier,
                height: 7 * SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blueAccent)
                ),
                child: Center(child: Text('American')))),
        ],
      ),
    );
  }
}
