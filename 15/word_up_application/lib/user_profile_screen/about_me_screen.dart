import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/size_config.dart';

class AboutMe extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AboutMe();
}

class _AboutMe extends State<AboutMe>{
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: Text('About me', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 3*SizeConfig.heightMultiplier),),
          ),
          Padding(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name', style: TextStyle(fontSize: 2*SizeConfig.heightMultiplier),),
                  Text('Nguyen Truong', style: TextStyle(color: Colors.blue, fontSize: 2*SizeConfig.heightMultiplier),),
                ],
              ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your age', style: TextStyle(fontSize: 2*SizeConfig.heightMultiplier),),
                Text('SELECT >', style: TextStyle(color: Colors.red, fontSize: 2*SizeConfig.heightMultiplier),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Native language', style: TextStyle(fontSize: 2*SizeConfig.heightMultiplier),),
                Text('Vietnamese', style: TextStyle(color: Colors.blue, fontSize: 2*SizeConfig.heightMultiplier),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}