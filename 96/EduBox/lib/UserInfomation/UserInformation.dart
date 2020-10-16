import 'package:EduBox/package/widget.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  var divider = Divider(height: 10, color: Colors.transparent);

  // var data = value.data();
  // user.address = data['Address'];
  // user.avatarUrl = data['Avatar'];
  // user.birth = data['Birth'].toDate();
  // user.email = data['Email'];

  @override
  Widget build(BuildContext context) {
    //var a = StreamBuilder(builder: null);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Thông tin cá nhân'),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 2 - 150),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('User')
                  .doc('SA8TXV76TtA48bvaDLNd')
                  .snapshots(),
              builder: (context, snapshot) {
                return ListView(
                  children: [
                    Container(
                      height: 70,
                      margin: EdgeInsets.only(top: 15, bottom: 10, right: MediaQuery.of(context).size.width / 2 - 150),
                      alignment: Alignment.bottomCenter,
                      child:
                          Text('Ảnh đại diện', style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 2 - 150),
                      alignment: Alignment.center,
                      child: ClayContainer(
                        borderRadius: 56,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 60,
                            child: Text(
                              snapshot.data['Avatar'],
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 30),
                            )),
                      ),
                    ),
                    divider,
                    LabelText(text: 'Số điện thoại', size: 17),
                    InfoBox(
                        field: 'PhoneNumber',
                        text: snapshot.data['PhoneNumber'] ?? ''),
                    divider,
                    LabelText(text: 'Giới tính', size: 17),
                    InfoBox(
                        field: 'Gender',
                        text: snapshot.data['Gender']['Female']
                            ? 'Nữ'
                            : 'Nam' ?? ''),
                    divider,
                    LabelText(text: 'Ngày sinh', size: 17),
                    InfoBox(
                        field: 'Birth',
                        text: DateFormat('dd-MM-yyyy')
                                .format(snapshot.data['Birth'].toDate()) ??
                            ''),
                    divider,
                    LabelText(text: 'Địa chỉ', size: 17),
                    InfoBox(
                        field: 'Address', text: snapshot.data['Address'] ?? ''),
                    divider,
                    LabelText(text: 'Email', size: 17),
                    InfoBox(field: 'Email', text: snapshot.data['Email'] ?? ''),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class InfoBox extends StatefulWidget {
  final text;
  final field;

  InfoBox({Key key, this.text, this.field}) : super(key: key);

  @override
  _InfoBoxState createState() => _InfoBoxState();

  _InfoBoxState of(BuildContext context) {
    final _InfoBoxState navigator =
        context.findAncestorStateOfType<_InfoBoxState>();
    return navigator;
  }
}

class _InfoBoxState extends State<InfoBox> {
  //final globalKey = GlobalKey<_InfoBoxState>();
  var textController = TextEditingController();
  @override
  void initState() {
    textController.text = widget.text;
    textController.selection = TextSelection.fromPosition(TextPosition(offset: textController.text.length));
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
          //height: 45,
          width: 300,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(9),
          ),
          // child: Text(widget.text, style: TextStyle(fontSize: 17)),
          child: TextField(
            controller: textController,
            onSubmitted: (text) {
              FirebaseFirestore.instance
                  .collection('User')
                  .doc('SA8TXV76TtA48bvaDLNd')
                  .update({widget.field: text});
            },
          ),
        ),
      ],
    );
  }
}
