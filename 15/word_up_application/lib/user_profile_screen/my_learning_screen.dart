import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/size_config.dart';

class MyLearning extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyLearning();
}

class _MyLearning extends State<MyLearning>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: Text('My learning', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 3*SizeConfig.heightMultiplier),),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Accent', style: TextStyle(fontSize: 2*SizeConfig.heightMultiplier)),
                Text('British >', style: TextStyle(color: Colors.blue, fontSize: 2*SizeConfig.heightMultiplier),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Practice goal', style: TextStyle(fontSize: 2*SizeConfig.heightMultiplier)),
                Text('20min/day', style: TextStyle(color: Colors.blue, fontSize: 2*SizeConfig.heightMultiplier),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Translation', style: TextStyle(fontSize: 2*SizeConfig.heightMultiplier)),
                Text('Per english definition >', style: TextStyle(color: Colors.blue, fontSize: 2*SizeConfig.heightMultiplier),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Reminder', style: TextStyle(fontSize: 2*SizeConfig.heightMultiplier)),
                Text('06am...', style: TextStyle(color: Colors.blue, fontSize: 2*SizeConfig.heightMultiplier),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}