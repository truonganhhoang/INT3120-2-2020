import 'package:EduBox/package/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color _color = Color(0xff00854c);
var border = OutlineInputBorder(
  borderSide: BorderSide(color: _color, width: 1.5),
  borderRadius: BorderRadius.circular(15),
);

class InputBox extends StatefulWidget {
  final int maxLine;
  final String hintText;
  final bool initialValue;
  final bool canBeNull;
  final bool multiLineEdit;

  const InputBox({
    Key key,
    this.initialValue = false,
    this.hintText,
    this.maxLine = 1,
    this.canBeNull = true,
    this.multiLineEdit = false,
  }) : super(key: key);

  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  String hintTextTime = DateFormat('HH:00').format(DateTime.now()).toString();
  String hintTextDate =
      DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
  TextEditingController _text = TextEditingController();
  String errorText = 'null';
  bool _validate = false;
  String valueToDatabase;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _text = TextEditingController();
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  // bool canBeSubmit() {
  //   return !_validate;
  // }
  //
  // Future<void> getValue() async {
  //   valueToDatabase = _text.text;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: _text,
        maxLines: widget.maxLine,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          isDense: true,
          hintText: widget.hintText,
          focusedBorder: border,
          enabledBorder: border,
          errorText: _validate ? errorText : null,
        ),
        onChanged: widget.canBeNull == false
            ? (String text) {
                if (text.isEmpty) {
                  _validate = true;
                  errorText = 'Không để trống';
                }
              }
            : widget.initialValue
                ? (String text) {
                    setState(() {
                      try {
                        double num = double.parse(_text.text);
                        print(double);
                        if (num < 1) {
                          errorText = 'Không được nhỏ hơn 1';
                          _validate = true;
                        }
                      } catch (e) {
                        if (_text.text.isEmpty) {
                          errorText = 'Không để trống';
                          _validate = true;
                        } else {
                          errorText = 'Không phải số';
                          _validate = true;
                        }
                      }
                    });
                  }
                : (text) {
                    _validate = false;
                    print(text);
                  },
      ),
    );
  }
}
