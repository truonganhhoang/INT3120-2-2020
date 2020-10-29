import 'package:EduBox/Models/Post.dart';
import 'package:EduBox/NewPost/LabelText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

String uid = FirebaseAuth.instance.currentUser.uid;
var database = FirebaseFirestore.instance;

abstract class FloatButton extends StatelessWidget {
  final String label;

  const FloatButton({Key key, this.label}) : super(key: key);

  void function();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: function,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}

class SubmitButton extends FloatButton {
  final String postId;
  final BuildContext context;

  SubmitButton({this.postId, this.context}) : super(label: 'Nhận lớp');

  @override
  void function() {
    FirebaseFirestore.instance
        .collection('Post')
        .doc(postId)
        .update({'Accepted': true, 'Acceptor': uid});
    Navigator.of(context).pop();
  }
}

class DeleteButton extends FloatButton {
  final String postId;
  final BuildContext context;

  DeleteButton({this.postId, this.context}) : super(label: 'Xóa lớp');

  @override
  void function() {
    FirebaseFirestore.instance.collection('Post').doc(postId).delete();
    Navigator.of(context).pop();
  }
}

class LearningDaysOfWeek extends StatelessWidget {
  final List<bool> days;

  const LearningDaysOfWeek({Key key, this.days}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color = Color.fromRGBO(0, 133, 76, 1);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        days.length,
        (index) => Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(
            color: days[index] == true ? _color : null,
            border: Border.all(color: _color, width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            index + 2 != 8 ? (index + 2).toString() : 'CN',
            style: TextStyle(
                color: days[index] ? Colors.white : _color, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  final String label;
  final Post post;
  final Widget button;
  final FloatingActionButtonLocation location;
  final Widget content;

  const Detail({
    Key key,
    this.label,
    this.post,
    this.button,
    this.location,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(label),
        ),
        floatingActionButton: button,
        floatingActionButtonLocation: location,
        body: content,
      ),
    );
  }
}

class MyAcceptedClassDetail extends StatelessWidget {
  final Post post;

  const MyAcceptedClassDetail({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var divider = Divider(height: 10, color: Colors.transparent);
    return Detail(
      label: 'Chi tiết lớp đã được nhận',
      content: StreamBuilder(
          stream:
              database.collection('User').doc(post.whoAcceptUid).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              return snapshot.connectionState == ConnectionState.active
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LabelText(text: 'Kiểu lớp'),
                        Text(post.type == 0 ? 'Tìm học sinh' : 'Tìm gia sư'),
                        LabelText(text: 'Người nhận lớp'),
                        Text(snapshot.data['Name']),
                        divider,
                        ClipOval(child: Image.network(snapshot.data['Avatar'])),
                        divider,
                        LabelText(text: 'Số điện thoại'),
                        Text(snapshot.data['PhoneNumber']),
                        divider,
                        LabelText(text: 'Môn'),
                        Text(post.subject),
                        divider,
                        LabelText(text: 'Địa điểm'),
                        Text(post.address),
                        divider,
                        LabelText(text: 'Các buổi trong tuần'),
                        LearningDaysOfWeek(days: post.days),
                        divider,
                        LabelText(text: 'Thời gian 1 ca học'),
                        Text(post.session),
                        divider,
                        LabelText(text: 'Thời gian một khóa học'),
                        Text(post.course),
                        divider,
                        LabelText(text: 'Học phí / buổi'),
                        Text('${(post.salary * 10000).toInt()} VND'),
                      ],
                    )
                  : CircularProgressIndicator();
            } else
              return Center(
                  child: Text(
                'Lỗi',
                style: TextStyle(color: Colors.red),
              ));
          }),
    );
  }
}

class AcceptedClass extends StatelessWidget {
  final Post post;

  const AcceptedClass({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var divider = Divider(height: 10, color: Colors.transparent);
    return Detail(
      label: 'Chi tiết lớp đã nhận',
      content: StreamBuilder(
          stream:
              database.collection('User').doc(post.whoPostUid).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              return snapshot.connectionState == ConnectionState.active
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LabelText(text: 'Kiểu lớp'),
                        Text(post.type == 0 ? 'Tìm học sinh' : 'Tìm gia sư'),
                        LabelText(text: 'Người tìm lớp'),
                        Text(snapshot.data['Name']),
                        divider,
                        ClipOval(child: Image.network(snapshot.data['Avatar'])),
                        divider,
                        LabelText(text: 'Số điện thoại'),
                        Text(snapshot.data['PhoneNumber']),
                        divider,
                        LabelText(text: 'Môn'),
                        Text(post.subject),
                        divider,
                        LabelText(text: 'Địa điểm'),
                        Text(post.address),
                        divider,
                        LabelText(text: 'Các buổi trong tuần'),
                        LearningDaysOfWeek(days: post.days),
                        divider,
                        LabelText(text: 'Thời gian 1 ca học'),
                        Text(post.session),
                        divider,
                        LabelText(text: 'Thời gian một khóa học'),
                        Text(post.course),
                        divider,
                        LabelText(text: 'Học phí / buổi'),
                        Text('${(post.salary * 10000).toInt()} VND'),
                      ],
                    )
                  : CircularProgressIndicator();
            } else
              return Center(
                  child: Text(
                'Lỗi',
                style: TextStyle(color: Colors.red),
              ));
          }),
    );
  }
}
