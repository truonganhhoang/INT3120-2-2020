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
  var user = FirebaseAuth.instance.currentUser;
  var db = FirebaseFirestore.instance.collection('User');
  DateTime bufferedDate;

  @override
  void initState() {
    bufferedDate = widget.dateTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BoxShadow> boxShadow = [
      BoxShadow(
        spreadRadius: 3,
        blurRadius: 10,
        offset: Offset(2, 2),
        color: Colors.black54,
      ),
      BoxShadow(
        spreadRadius: 3,
        blurRadius: 10,
        offset: Offset(-2, -2),
        color: Colors.white54,
      ),
    ];
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: boxShadow,
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: widget.dateTime,
                      onDateTimeChanged: (DateTime newDateTime) {
                        setState(() {
                          bufferedDate = newDateTime;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: boxShadow,
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            db.doc(user.uid).update({
                              'Birth': bufferedDate,
                            });
                          },
                          child: Text(
                            'Xong',
                            style:
                                TextStyle(color: Color.fromRGBO(0, 0, 255, 1)),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: boxShadow,
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Thoát',
                            style:
                                TextStyle(color: Color.fromRGBO(0, 0, 255, 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 300,
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(color: _color, width: 1.5),
              borderRadius: BorderRadius.circular(10),
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
