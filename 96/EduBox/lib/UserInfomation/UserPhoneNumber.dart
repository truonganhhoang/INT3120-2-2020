import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPhoneNumber extends StatefulWidget {
  final text;

  UserPhoneNumber({Key key, this.text}) : super(key: key);

  @override
  _UserPhoneNumberState createState() => _UserPhoneNumberState();
}

class _UserPhoneNumberState extends State<UserPhoneNumber> {
  var textController = TextEditingController();
  String errorText ='';
  bool error = false;

  @override
  void initState() {
    textController.text = widget.text;
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
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
          decoration: BoxDecoration(
            border:
            Border.all(color: Theme.of(context).primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(9),
          ),
          child: TextField(
            controller: textController,
            keyboardType: TextInputType.phone,
            style: TextStyle(fontSize: 17),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorText: error? errorText:null,
            ),

            onSubmitted: (text) {
              if(text.length!=10){
                setState(() {
                  errorText = 'Chiều dài không hợp lệ';
                  error = true;
                });
              } else {
                if(text.substring(0,1) != '0'){
                  error = true;
                  errorText = 'Không phải số điện thoại';
                }else{
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