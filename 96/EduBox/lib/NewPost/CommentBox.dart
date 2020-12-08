import 'package:EduBox/Models/NewPostTemplate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentBox extends StatefulWidget {
  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  TextEditingController _text = TextEditingController();

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).primaryColor;
    var submitForm = Provider.of<SubmitForm>(context);
    var border = OutlineInputBorder(
      borderSide: BorderSide(color: _color, width: 1.5),
      borderRadius: BorderRadius.circular(15),
    );
    return Container(
      child: TextField(
        controller: _text,
        maxLines: 3,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Yêu cầu của bạn \nHãy liệt kê chi tiết nếu có',
          focusedBorder: border,
          enabledBorder: border,
        ),
        onChanged: (String text) {
          submitForm.requirement = text;
        },
      ),
    );
  }
}
