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
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8 * SizeConfig.heightMultiplier),
              child: Text(
                'Accent',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0*SizeConfig.heightMultiplier),
              child: MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.blue[400],
                  color: Colors.blue[200],
                  minWidth: 80*SizeConfig.widthMultiplier,
                  height: 10*SizeConfig.heightMultiplier,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.grey)),
                  onPressed: () {
                    Navigator.pop(context, 'British');
                  },
                  child: Column(
                    children: <Widget>[
                      Text('British',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.0*SizeConfig.heightMultiplier),
              child: MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.blue[400],
                  color: Colors.blue[200],
                  minWidth: 80*SizeConfig.widthMultiplier,
                  height: 10*SizeConfig.heightMultiplier,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.grey)),
                  onPressed: () {
                    Navigator.pop(context, 'American');
                  },
                  child: Column(  
                    children: <Widget>[
                      Text('American',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
