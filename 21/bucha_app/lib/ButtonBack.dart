import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  ButtonBack();

  void _backToPreviousPage(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      child: InkWell(
        onTap: () {
          _backToPreviousPage(context);
        },
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/back.png'), fit: BoxFit.fill)),
    );
  }
}