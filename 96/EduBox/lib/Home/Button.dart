import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  final String name;

  final Widget iconData;
  final Widget navigatePage;

  const Button({
    Key key,
    this.name = 'Add later, be patient',
    this.iconData,
    this.navigatePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
      border: Border.all(
        color: Theme.of(context).primaryColor,
        width: 2,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(50),
    );
    return Container(
      height: 130,
      width: 110,
      alignment: Alignment.bottomLeft,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => navigatePage != null
                  ? SafeArea(child: navigatePage)
                  : SafeArea(
                      child: Scaffold(
                        appBar: AppBar(
                          title: Text(name),
                        ),
                        body: Container(),
                      ),
                    )));
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: decoration,
                child: Container(
                  child: iconData,
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
