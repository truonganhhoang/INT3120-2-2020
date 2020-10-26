import 'package:EduBox/package/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Color _color = Color(0xff00854c);
var border = OutlineInputBorder(
  borderSide: BorderSide(color: _color, width: 1.5),
  borderRadius: BorderRadius.circular(15),
);

class InputCommentAddressBox extends StatefulWidget {
  final bool canBeNull;
  final String hintText;

  const InputCommentAddressBox({
    this.canBeNull = false,
    this.hintText,
    Key key,
  }) : super(key: key);

  @override
  _InputCommentAddressBoxState createState() => _InputCommentAddressBoxState();
}

class _InputCommentAddressBoxState extends State<InputCommentAddressBox> {
  TextEditingController _text = TextEditingController();
  bool _validate = false;
  String valueToDatabase;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: _text,
        maxLines: 3,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          isDense: true,
          hintText: widget.hintText,
          focusedBorder: border,
          enabledBorder: border,
          errorText: _validate ? 'Không được để trống' : null,
        ),
        onSubmitted: !widget.canBeNull
            ? (String text) {
                if (text.isEmpty || !RegExp('\[a-zA-Z]').hasMatch(text)) {
                  print(text);
                  setState(() {
                    _validate = true;
                  });
                } else
                  setState(() {
                    _validate = false;
                  });

                print(text);
              }
            : (String text) {
                print(text);
                setState(() {
                  _validate = false;
                });
              },
      ),
    );
  }
}
