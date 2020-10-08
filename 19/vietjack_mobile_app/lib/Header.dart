import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Auth.dart';

class Header extends StatefulWidget {
  double width;
  double height;
  String userName;
  Header({Key key, this.width, this.height}) : super(key: key);
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  double left = 0, right = 0;
  double myOpacity = 0;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    left = widget.width / 2;
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    animationController.forward();

    animationController.addListener(() {
      setState(() {
        //left=widget.width * 0.5*animationController.value;
        myOpacity = animationController.value;
        right = widget.width * 0.5 * animationController.value;
      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Opacity(
            opacity: myOpacity,
            child: new Container(
                width: left,
                height: 200,
                child: Center(
                  child: new Text(
                    auth.currentUser.displayName,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'GoodDog',
                        fontSize: 45,
                        color: Colors.pink[200]),
                  ),
                )),
          ),
          new Container(
            width: right,
            height: 200,
            child: new Opacity(
              opacity: myOpacity,
              child: new Image(
                  image: AssetImage('assets/idea.jpg'), fit: BoxFit.fitHeight),
            ),
          ),
        ]);
  }
}
