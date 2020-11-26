import 'package:flutter/cupertino.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'Auth.dart';

class Header extends StatefulWidget {
  double width;
  double height;
  String userName;
  bool runAnimation = true;
  Header({Key key, this.width, this.height, bool runAnimation = true})
      : super(key: key) {
    this.runAnimation = runAnimation;
  }
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
    if (widget.runAnimation) {
      left = widget.width / 2;
      animationController =
          new AnimationController(vsync: this, duration: Duration(seconds: 1));
      animationController.forward();
      animationController.addListener(() {
        setState(() {
          myOpacity = animationController.value;
          right = widget.width * 0.5 * animationController.value;
        });
      });
    } else {
      left = right = widget.width / 2;
      myOpacity = 1;
    }
  }

  @override
  void dispose() {
    if (widget.runAnimation) animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: new Key('contain'),
      decoration: BoxDecoration(
        color: Colors.brown[50],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Opacity(
              opacity: myOpacity,
              child: new Container(
                  key: new Key('name'),
                  width: left,
                  height: 200,
                  child: Center(
                    child: new Text(
                      auth.currentUser.displayName,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GoodDog',
                          fontSize: 45,
                          color: Colors.green[400]),
                    ),
                  )),
            ),
            new Container(
              width: right,
              height: 200,
              child: new Opacity(
                opacity: myOpacity,
                child: new ClipRRect(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(20)),
                  child: new Image(
                    image: AssetImage('assets/idea.jpg'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            // new Container(
            //   width: right,
            //   height: 200,
            //   child: new Stack(),
            // )
          ]),
    );
  }
}
