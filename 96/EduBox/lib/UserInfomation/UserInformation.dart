import 'package:EduBox/NewPost/LabelText.dart';
import 'package:EduBox/UserInfomation/DateOfBirth.dart';
import 'package:EduBox/UserInfomation/UserAddress.dart';
import 'package:EduBox/UserInfomation/UserGender.dart';
import 'package:EduBox/UserInfomation/UserPhoneNumber.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var divider = Divider(height: 10, color: Colors.transparent);
    var user = FirebaseAuth.instance.currentUser;
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
                  if (!snapshot.hasError)
                    return Container(
                      child: ListView(
                        children: [
                          Container(
                            height: 70,
                            margin: EdgeInsets.only(
                                top: 15,
                                bottom: 10,
                                right: MediaQuery.of(context).size.width / 2 -
                                    150),
                            alignment: Alignment.bottomCenter,
                            child: Text('Ảnh đại diện',
                                style: TextStyle(fontSize: 20)),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 2 -
                                    150),
                            alignment: Alignment.center,
                            //height: 350,
                            decoration: BoxDecoration(),
                            child: ClipOval(
                              child: snapshot.connectionState ==
                                      ConnectionState.active
                                  ? Image.network(
                                      snapshot.data['Avatar'],
                                    )
                                  : Center(child: CircularProgressIndicator()),
                            ),
                          ),
                          divider,
                          LabelText(
                            text: 'Tên',
                            size: 17,
                          ),
                          snapshot.connectionState == ConnectionState.active
                              ? StaticInfoBox(
                                  text: snapshot.data['Name'],
                                )
                              : Center(child: CircularProgressIndicator()),
                          divider,
                          LabelText(text: 'Email', size: 17),
                          snapshot.connectionState == ConnectionState.active
                              ?StaticInfoBox(text: snapshot.data['Email'] ?? ''): Center(child: CircularProgressIndicator()),
                          divider,
                          LabelText(text: 'Số điện thoại', size: 17),
                          UserPhoneNumber(
                            text: snapshot.data['PhoneNumber'],
                          ),
                          divider,
                          LabelText(text: 'Giới tính', size: 17),
                          UserGender(
                            gender: snapshot.data['Gender'],
                          ),
                          divider,
                          LabelText(text: 'Ngày sinh', size: 17),
                          DateOfBirth(
                            dateTime: snapshot.data['Birth'].toDate(),
                          ),
                          divider,
                          LabelText(text: 'Địa chỉ', size: 17),
                          UserAddress(
                            text: snapshot.data['Address'],
                          ),
                          divider,
                          divider,
                          divider,
                        ],
                      ),
                    );
                  else
                    return Text('Error');
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
