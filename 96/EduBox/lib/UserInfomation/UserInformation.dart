import 'package:EduBox/UserInfomation/DateOfBirth.dart';
import 'package:EduBox/UserInfomation/UserAddress.dart';
import 'package:EduBox/UserInfomation/UserGender.dart';
import 'package:EduBox/UserInfomation/UserPhoneNumber.dart';
import 'package:EduBox/package/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  var divider = Divider(height: 10, color: Colors.transparent);
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Thông tin cá nhân'),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 2 - 150),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('User')
                    .doc(user.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  return Container(
                    child: ListView(
                      children: [
                        Container(
                          height: 70,
                          margin: EdgeInsets.only(
                              top: 15,
                              bottom: 10,
                              right:
                                  MediaQuery.of(context).size.width / 2 - 150),
                          alignment: Alignment.bottomCenter,
                          child: Text('Ảnh đại diện',
                              style: TextStyle(fontSize: 20)),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right:
                                  MediaQuery.of(context).size.width / 2 - 150),
                          alignment: Alignment.center,
                          //height: 350,
                          decoration: BoxDecoration(),
                          child: ClipOval(
                            child: snapshot.data['Avatar'] != null
                                ? Image.network(
                                    snapshot.data['Avatar'],
                                  )
                                : Text(snapshot.data['Name'][0]),
                          ),
                        ),
                        divider,
                        LabelText(
                          text: 'Tên',
                          size: 17,
                        ),
                        StaticInfoBox(
                          text: snapshot.data['Name'],
                        ),
                        divider,
                        LabelText(text: 'Email', size: 17),
                        StaticInfoBox(text: snapshot.data['Email'] ?? ''),
                        divider,
                        LabelText(text: 'Số điện thoại', size: 17),
                        UserPhoneNumber(text: snapshot.data['PhoneNumber'],),
                        divider,
                        LabelText(text: 'Giới tính', size: 17),
                        UserGender(gender: snapshot.data['Gender'],),
                        divider,
                        LabelText(text: 'Ngày sinh', size: 17),
                        DateOfBirth(dateTime: snapshot.data['Birth'].toDate(),),
                        divider,
                        LabelText(text: 'Địa chỉ', size: 17),
                        UserAddress(text: snapshot.data['Address'],),
                        divider,
                        divider,
                        divider,
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class StaticInfoBox extends StatelessWidget {
  final String text;

  const StaticInfoBox({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 300,

          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(9),
          ),
          // child: Text(widget.text, style: TextStyle(fontSize: 17)),
          child: Text(
            text,
            style: TextStyle(fontSize: 17),
          ),
        ),
      ],
    );
  }
}

