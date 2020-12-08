import 'package:EduBox/Models/NewPostTemplate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassAddress extends StatefulWidget {
  @override
  _ClassAddressState createState() => _ClassAddressState();
}

class _ClassAddressState extends State<ClassAddress> {
  TextEditingController _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var submitForm = Provider.of<SubmitForm>(context);
    var _color = Theme.of(context).primaryColor;
    var _border = OutlineInputBorder(
      borderSide: BorderSide(color: _color, width: 1.5),
      borderRadius: BorderRadius.circular(15),
    );
    return Container(
      child: TextField(
        controller: _text,
        maxLines: 3,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Địa chỉ lớp học\n*Không được để trống',
          focusedBorder: _border,
          enabledBorder: _border,
          errorText: _validate ? 'Không được để trống' : null,
        ),
        onChanged: (String text) {
          if (text.isEmpty || !RegExp('\[a-zA-Z]').hasMatch(text)) {
            submitForm.canBeSubmit[0] = false;
            setState(() {
              _validate = true;
            });
          } else {
            submitForm.canBeSubmit[0] = true;
            submitForm.address = text;
            setState(() {
              _validate = false;
            });
          }
        },
      ),
    );
  }
}
