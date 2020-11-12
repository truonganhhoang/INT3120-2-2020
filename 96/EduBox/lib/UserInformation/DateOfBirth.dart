import 'package:EduBox/IntermediateWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color _color = Color(0xff00854c);

class DateOfBirth extends StatefulWidget {
  final DateTime dateTime;

  const DateOfBirth({Key key, this.dateTime}) : super(key: key);

  @override
  _DateOfBirthState createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    var db = FirebaseFirestore.instance.collection('User');
    DateTime bufferedDate = widget.dateTime;
    return MyDateTimePicker(
      dateTime: widget.dateTime,
      onChange: (time) {
        bufferedDate = time;
      },
      onSubmit: () {
        Navigator.of(context).pop();
        db.doc(user.uid).update({
          'Birth': bufferedDate,
        });
      },
      child: Row(
        children: [
          Container(
            height: 50,
            width: 300,
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(color: _color, width: 1.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              DateFormat('dd-MM-yyyy').format(widget.dateTime),
              style: TextStyle(fontSize: 17),
            ),
          ),
          Icon(Icons.edit),
        ],
      ),
    );
  }
}
