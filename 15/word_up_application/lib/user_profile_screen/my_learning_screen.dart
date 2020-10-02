import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLearning extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyLearning();
}

class _MyLearning extends State<MyLearning>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 400,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('My learning', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Accent'),
                Text('British >', style: TextStyle(color: Colors.blue),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Practice goal'),
                Text('20min/day', style: TextStyle(color: Colors.blue),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Translation'),
                Text('Per english definition >', style: TextStyle(color: Colors.blue),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Reminder'),
                Text('06am...', style: TextStyle(color: Colors.blue),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}