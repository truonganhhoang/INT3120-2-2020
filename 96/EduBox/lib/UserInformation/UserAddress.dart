import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAddress extends StatefulWidget {
  final text;

  UserAddress({Key key, this.text}) : super(key: key);

  @override
  _UserAddressState createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  var textController = TextEditingController();

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
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: textController,
            keyboardType: TextInputType.streetAddress,
            style: TextStyle(fontSize: 17),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            onSubmitted: (text) {
              FirebaseFirestore.instance
                  .collection('User')
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({'Address': text});
            },
          ),
        ),
        Icon(Icons.edit),
      ],
    );
  }
}
