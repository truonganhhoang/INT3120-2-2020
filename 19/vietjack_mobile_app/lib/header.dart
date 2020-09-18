import 'package:flutter/material.dart';
class header extends StatefulWidget {
  double width;
  double height;
  header({Key key,this.width,this.height}):super(key : key);

  @override
  _headerState createState() => _headerState();

}

class _headerState extends State<header> {
  double left=0,right=0;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1),(){
      setState(() {
        left=widget.width*0.5;
        right=widget.width*0.5;
      });
    });
    return Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new AnimatedContainer(
            duration: Duration(seconds: 2),
            color: Colors.red,
            width: left,
            height: 200,
          ),
          new AnimatedContainer(
            duration: Duration(seconds: 2),
            color: Colors.blue,
            width: right,
            height: 200,
          ),

        ],
      ),
    );
  }
}
