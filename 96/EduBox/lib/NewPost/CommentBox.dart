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
    var submitForm = Provider.of<SubmitForm>(context);
    return Container(
      child: TextField(
        controller: _text,
        maxLines: 3,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Yêu cầu của bạn \n Hãy liệt kê chi tiết nếu có',
          focusedBorder: border,
          enabledBorder: border,
        ),
        onSubmitted: (String text) {
          submitForm.requirement = text;
        },


      ),
    );
  }
}
