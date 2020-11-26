import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Models/Post.dart';

List<BoxShadow> _boxShadow = [
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

Future submitYesOrNo(BuildContext context, {Function function}) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Xác nhận?'),
      actions: [
        FlatButton(
          color: Theme.of(context).primaryColor,
          child: Container(
            child: Text('Có'),
            height: 20,
          ),
          onPressed: function,
        ),
        FlatButton(
          color: Colors.grey[200],
          child: Container(
            child: Text(
              'Không',
              style: TextStyle(color: Colors.black),
            ),
            height: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
    barrierDismissible: true,
  );
}

enum PickerType { date, time }

class SubmitOrExit extends StatelessWidget {
  final Function function;

  const SubmitOrExit({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: _boxShadow,
          ),
          child: FlatButton(
            onPressed: function,
            child: Text(
              'Xong',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: _boxShadow,
          ),
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Thoát',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class MyDateTimePicker extends StatefulWidget {
  final DateTime dateTime;
  final Function(DateTime val) onChange;
  final Function onSubmit;
  final PickerType mode;
  final Widget child;

  const MyDateTimePicker(
      {Key key,
      this.dateTime,
      this.onChange,
      this.onSubmit,
      this.mode = PickerType.date,
      this.child})
      : super(key: key);

  @override
  _MyDateTimePickerState createState() => _MyDateTimePickerState();
}

class _MyDateTimePickerState extends State<MyDateTimePicker> {
  @override
  Widget build(BuildContext context) {
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
                      boxShadow: _boxShadow,
                    ),
                    child: CupertinoDatePicker(
                      mode: widget.mode == PickerType.date
                          ? CupertinoDatePickerMode.date
                          : CupertinoDatePickerMode.time,
                      initialDateTime: widget.dateTime,
                      onDateTimeChanged: (DateTime time) {
                        widget.onChange(time);
                      },
                    ),
                  ),
                  SubmitOrExit(function: widget.onSubmit),
                ],
              )),
      child: widget.child,
    );
  }
}

class IntermediateClassList extends StatelessWidget {
  final Function(dynamic element) function;
  final Function(Post post) widget;
  final Axis scrollDirection;

  const IntermediateClassList(
      {Key key,
      this.function,
      this.widget,
      this.scrollDirection = Axis.vertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Post').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasError) {
            if (snapshot.connectionState != ConnectionState.active)
              return CircularProgressIndicator();
            List list = (snapshot.data.docs
                  ..sort((a, b) => a['PostDate'].compareTo(b['PostDate'])))
                .where((element) => function(element))
                .map((DocumentSnapshot document) {
                  Map<String, dynamic> map = document.data();
                  map['DocumentID'] = document.id ?? '';
                  Post post = Post.fromJson(map);
                  return post;
                })
                .map((e) => widget(e))
                .toList()
                .cast<Widget>();
            return list.length != 0
                ? ListView(
                    scrollDirection: scrollDirection,
                    shrinkWrap: true,
                    reverse: true,
                    children: list,
                  )
                : Center(
                    child: Text(
                    'Không có bài nào',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ));
          } else
            return Text('Error');
        });
  }
}

class BoxRecord extends StatelessWidget {
  final String label, info;

  const BoxRecord({Key key, this.label, this.info})
      : assert(label != null),
        assert(info != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 40),
          width: 180,
          child: Text(
            label + ' : ',
            style: TextStyle(
              color: Colors.red,
              fontSize: 17,
            ),
          ),
        ),
        Text(
          info,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ],
    );
  }
}

class IntermediateClassBox extends StatelessWidget {
  final Post post;
  final Widget toClassDetail;

  const IntermediateClassBox({Key key, this.post, this.toClassDetail})
      : super(key: key);

  void _navigateTo(BuildContext context, Post post) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => toClassDetail),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _divider = Divider(height: 5, color: Colors.transparent);
    var _color = Theme.of(context).primaryColor;
    String uid = FirebaseAuth.instance.currentUser.uid;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: ClayContainer(
        width: 350,
        height: 400,
        child: Column(
          children: [
            Container(
              color: _color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '${post.subject} - Lớp ${post.grade}',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.info,
                        color: _color,
                        size: 30,
                      ),
                    ),
                    onPressed: () => _navigateTo(context, post),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _navigateTo(context, post),
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _divider,
                      BoxRecord(
                          label: 'Đang tìm',
                          info: post.type == 0 ? 'Học sinh' : 'Gia sư'),
                      _divider,
                      BoxRecord(label: 'Môn', info: post.subject),
                      _divider,
                      BoxRecord(label: 'Lớp', info: post.grade.toString()),
                      _divider,
                      BoxRecord(
                          label: 'Trạng thái',
                          info: post.whoPostUid != uid
                              ? post.accepted
                                  ? 'Đã nhận'
                                  : 'Chưa nhận'
                              : post.accepted
                                  ? 'Đã được nhận'
                                  : 'Chưa được nhận'),
                      _divider,
                      BoxRecord(label: 'Địa chỉ', info: post.address),
                      _divider,
                      BoxRecord(
                        label: 'Lương',
                        info: '${post.salary.toInt() * 10000}',
                      ),
                      _divider,
                      BoxRecord(label: 'Giới tính yêu cầu', info: post.gender),
                      _divider,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
