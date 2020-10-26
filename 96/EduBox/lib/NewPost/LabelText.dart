import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;
  final double size;


  const LabelText({Key key, this.text, this.size = 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.red,
          fontSize: size,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
