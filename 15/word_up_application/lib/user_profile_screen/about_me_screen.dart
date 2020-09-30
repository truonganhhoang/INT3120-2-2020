import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AboutMe();
}

class _AboutMe extends State<AboutMe>{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 165,
      width: 400,
      margin: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 30),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('About me', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name'),
                  Text('Nguyen Truong', style: TextStyle(color: Colors.blue),),
                ],
              ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your age'),
                Text('SELECT >', style: TextStyle(color: Colors.red),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Native language'),
                Text('Vietnamese', style: TextStyle(color: Colors.blue),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}