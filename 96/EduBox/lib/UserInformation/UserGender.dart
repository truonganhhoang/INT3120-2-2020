import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Color _color = Color(0xff00854c);

class UserGender extends StatefulWidget {
  final String gender;

  const UserGender({Key key, this.gender}) : super(key: key);

  @override
  _UserGenderState createState() => _UserGenderState();
}

class _UserGenderState extends State<UserGender> {
  var listOfGenders = ['(Trống)', 'Nam', 'Nữ'];
  int _value;
  var user = FirebaseAuth.instance.currentUser;
  var db = FirebaseFirestore.instance;
  var gender;

  @override
  void initState() {
    if (widget.gender == 'Nam')
      _value = 1;
    else if (widget.gender == 'Nữ')
      _value = 2;
    else
      _value = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 300,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: _color, width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                isExpanded: true,
                value: _value,
                items: List.generate(
                  listOfGenders.length,
                  (index) => DropdownMenuItem(
                    child: Text(
                      listOfGenders[index],
                      style: TextStyle(
                        color: _value == index ? null : _color,
                      ),
                    ),
                    value: index,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                  db
                      .collection('User')
                      .doc(user.uid)
                      .update({'Gender': listOfGenders[value]});
                }),
          ),
        ),
        Icon(Icons.edit),
      ],
    );
  }
}
