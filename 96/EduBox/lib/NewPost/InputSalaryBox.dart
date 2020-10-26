import 'package:EduBox/NewPost/NewPostTemplate.dart';
import 'package:EduBox/package/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Color _color = Color(0xff00854c);
var border = OutlineInputBorder(
  borderSide: BorderSide(color: _color, width: 1.5),
  borderRadius: BorderRadius.circular(15),
);

class InputSalaryBox extends StatefulWidget {
  @override
  _InputSalaryBoxState createState() => _InputSalaryBoxState();
}

class _InputSalaryBoxState extends State<InputSalaryBox> {
  TextEditingController _text = TextEditingController();
  bool _validate = false;
  String error;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var submitForm = Provider.of<SubmitForm>(context);
    return Container(
      child: TextField(
        controller: _text,
        maxLines: 3,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Tối thiểu 10',
          focusedBorder: border,
          enabledBorder: border,
          errorText: _validate ? error : null,
        ),
        onSubmitted: (text) {
          if (text.isEmpty) {
            submitForm.canBeSubmit[0] = false;
            setState(() {
              error = 'Không được để trống';
              _validate = true;
            });
          } else {
            try {
              double sal = double.parse(text);
              if (sal < 10) {
                setState(() {
                  _validate = true;
                  error = 'Không nhỏ hơn 10';
                });
                submitForm.canBeSubmit[4] = false;
              } else {
                setState(() {
                  _validate = false;
                });
                submitForm.canBeSubmit[4] = true;
                submitForm.salary = sal;
              }
            } catch (e) {
              submitForm.canBeSubmit[0] = false;
              setState(() {
                _validate = true;
                error = 'Không phải số';
              });
            }
          }
        },
      ),
    );
  }
}
