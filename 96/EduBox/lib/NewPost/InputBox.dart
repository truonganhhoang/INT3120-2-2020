import 'package:flutter/material.dart';

Color _color = Color(0xff00854c);

class InputBox extends StatelessWidget {
  final String hintText;
  final int maxLine;
  final bool dateTime;
  static var border = OutlineInputBorder(
    borderSide: BorderSide(color: _color, width: 1.5),
    borderRadius: BorderRadius.circular(15),
  );

  const InputBox(
      {Key key, this.hintText, this.maxLine = 1, this.dateTime = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        maxLines: maxLine,
        keyboardType: dateTime ? TextInputType.datetime : TextInputType.text,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          focusedBorder: border,
          enabledBorder: border,
        ),
      ),
    );
  }
}
