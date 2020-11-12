import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Color _color = Color(0xff00854c);
var _border = OutlineInputBorder(
  borderSide: BorderSide(color: _color, width: 1.5),
  borderRadius: BorderRadius.circular(15),
);

class UserPhoneNumber extends StatefulWidget {
  final text;

  UserPhoneNumber({Key key, this.text}) : super(key: key);

  @override
  _UserPhoneNumberState createState() => _UserPhoneNumberState();
}

class _UserPhoneNumberState extends State<UserPhoneNumber> {
  var textController = TextEditingController();
  String errorText = '';
  bool error = false;

  @override
  void initState() {
    textController.text = widget.text ?? '';
    textController.selection = TextSelection.fromPosition(
        TextPosition(offset: textController.text.length));
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 300,
          // alignment: Alignment.centerLeft,
          // padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
          // decoration: BoxDecoration(
          //   border:
          //   Border.all(color: Theme.of(context).primaryColor, width: 1.5),
          //   borderRadius: BorderRadius.circular(9),
          // ),
          child: TextField(
            controller: textController,
            keyboardType: TextInputType.phone,
            style: TextStyle(fontSize: 17),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: _border,
              enabledBorder: _border,
              disabledBorder: _border,
              errorText: error ? errorText : null,
            ),
            onChanged: (text) {
              if (text[0] != '0') {
                error = true;
                errorText = 'Không phải số điện thoại';
              } else {
                if (text.length < 10) {
                  setState(() {
                    errorText = 'Chiều dài quá ngắn';
                    error = true;
                  });
                } else if (text.length > 10) {
                  setState(() {
                    errorText = 'Chiều dài quá dài';
                    error = true;
                  });
                } else {
                  setState(() {
                    error = false;
                  });
                  FirebaseFirestore.instance
                      .collection('User')
                      .doc(FirebaseAuth.instance.currentUser.uid)
                      .update({'PhoneNumber': text.toString()});
                }
              }
            },
          ),
        ),
        Icon(Icons.edit),
      ],
    );
  }
}
