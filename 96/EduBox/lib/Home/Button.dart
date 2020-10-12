import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Color _color = Color(0xff00854c);

BoxDecoration decoration = BoxDecoration(
  border: Border.all(
    color: _color,
    width: 2,
    style: BorderStyle.solid,
  ),
  borderRadius: BorderRadius.circular(50),
);

class Button extends StatelessWidget {
  final String name;

  final IconData icondata;
  final Widget navigatePage;

  const Button({
    Key key,
    this.name = 'Add later, be patient',
    this.icondata = Icons.face,
    this.navigatePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 130,
      width: 110,
      alignment: Alignment.bottomLeft,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => navigatePage != null
                  ? navigatePage
                  : Scaffold(
                      appBar: AppBar(
                        title: Text(name),
                      ),
                      body: Container(),
                    )));
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: decoration,
                child: Icon(
                  icondata,
                  size: 55,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
