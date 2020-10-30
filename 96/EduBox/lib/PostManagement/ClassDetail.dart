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
      onPressed: (){
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Info('Xác nhận?'),
            actions: [
              FlatButton(
                child: Container(
                  child: Info('Có'),
                  height: 30,
                ),
                onPressed: function,
              ),
              FlatButton(
                child: Container(
                  child: Info('Không'),
                  height: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          barrierDismissible: true,
        );
      },
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
      Navigator.of(context).pop();
  }
}

class DeleteButton extends FloatButton {
  final String postId;
  final BuildContext context;

  DeleteButton({this.postId, this.context}) : super(label: 'Xóa lớp');

  @override
  void function() {
    FirebaseFirestore.instance
        .collection('Post')
        .doc(postId)
        .delete();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
}

class CancelButton extends FloatButton{
  final String postId;
  final BuildContext context;

  CancelButton({this.postId, this.context}) : super(label: 'Hủy lớp');

  @override
  void function() {
    FirebaseFirestore.instance
        .collection('Post')
        .doc(postId)
        .update({'Accepted': false, 'Acceptor': ''});
    Navigator.of(context).pop();
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

class Info extends StatelessWidget {
  final String text;

  const Info(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 19),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  final String label;
  final Widget button;
  final Widget content;

  const Detail({
    Key key,
    this.label,
    this.button,
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: content,
      ),
    );
  }
}

class MyClassAndBeAcceptedDetail extends StatelessWidget {
  final Post post;

  const MyClassAndBeAcceptedDetail({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var divider = Divider(height: 10, color: Colors.transparent);
    return Detail(
      button: DeleteButton(postId: post.id,context: context),
      label: 'Chi tiết lớp đã được nhận',
      content: StreamBuilder(
          stream:
              database.collection('User').doc(post.whoAcceptUid).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              return snapshot.connectionState == ConnectionState.active
                  ? ListView(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      children: [
                        LabelText(text: 'Kiểu lớp'),
                        Info(post.type == 0 ? 'Tìm học sinh' : 'Tìm gia sư'),
                        LabelText(text: 'Người nhận lớp'),
                        Info(snapshot.data['Name']),
                        divider,
                        Center(
                            child: ClipOval(
                                child: Image.network(snapshot.data['Avatar']))),
                        divider,
                        LabelText(text: 'Số điện thoại'),
                        Info(snapshot.data['PhoneNumber']),
                        divider,
                        LabelText(text: 'Môn'),
                        Info(post.subject),
                        divider,
                        LabelText(text: 'Địa điểm'),
                        Info(post.address),
                        divider,
                        LabelText(text: 'Các buổi trong tuần'),
                        LearningDaysOfWeek(days: post.days),
                        divider,
                        LabelText(text: 'Thời gian 1 ca học'),
                        Info(post.session),
                        divider,
                        LabelText(text: 'Thời gian một khóa học'),
                        Info(post.course),
                        divider,
                        LabelText(text: 'Giới tính yêu cầu'),
                        Info(post.gender),
                        divider,
                        LabelText(text: 'Yêu cầu khác'),
                        Info(post.requiredComment),
                        divider,
                        LabelText(text: 'Học phí / buổi'),
                        Info('${(post.salary * 10000).toInt()} VND'),
                        Divider(height: 75,color: Colors.transparent,),
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

class ClassIAcceptedDetail extends StatelessWidget {
  final Post post;

  const ClassIAcceptedDetail({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var divider = Divider(height: 10, color: Colors.transparent);
    return Detail(
      button: CancelButton(postId: post.id,context: context),
      label: 'Chi tiết lớp đã nhận',
      content: StreamBuilder(
          stream: database.collection('User').doc(post.whoPostUid).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              return snapshot.connectionState == ConnectionState.active
                  ? ListView(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      children: [
                        LabelText(text: 'Kiểu lớp'),
                        Info(post.type == 0 ? 'Tìm học sinh' : 'Tìm gia sư'),
                        LabelText(text: 'Người tìm lớp'),
                        Info(snapshot.data['Name']),
                        divider,
                        Center(
                            child: ClipOval(
                                child: Image.network(snapshot.data['Avatar']))),
                        divider,
                        LabelText(text: 'Số điện thoại'),
                        Info(snapshot.data['PhoneNumber']),
                        divider,
                        LabelText(text: 'Môn'),
                        Info(post.subject),
                        divider,
                        LabelText(text: 'Địa điểm'),
                        Info(post.address),
                        divider,
                        LabelText(text: 'Các buổi trong tuần'),
                        LearningDaysOfWeek(days: post.days),
                        divider,
                        LabelText(text: 'Thời gian 1 ca học'),
                        Info(post.session),
                        divider,
                        LabelText(text: 'Thời gian một khóa học'),
                        Info(post.course),
                        divider,
                        LabelText(text: 'Giới tính yêu cầu'),
                        Info(post.gender),
                        divider,
                        LabelText(text: 'Yêu cầu khác'),
                        Info(post.requiredComment),
                        divider,
                        LabelText(text: 'Học phí / buổi'),
                        Info('${(post.salary * 10000).toInt()} VND'),
                        Divider(height: 75,color: Colors.transparent,),
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

class MyClassAndBeNotAcceptedDetail extends StatelessWidget {
  final Post post;

  const MyClassAndBeNotAcceptedDetail({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var divider = Divider(height: 10, color: Colors.transparent);
    return Detail(
      label: 'Lớp chưa được nhận',
      button: DeleteButton(
        context: context,
        postId: post.id,
      ),
      content: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        children: [
          LabelText(text: 'Kiểu lớp'),
          Info(post.type == 0 ? 'Tìm học sinh' : 'Tìm gia sư'),
          divider,
          LabelText(text: 'Môn'),
          Info(post.subject),
          divider,
          LabelText(text: 'Địa điểm'),
          Info(post.address),
          divider,
          LabelText(text: 'Các buổi trong tuần'),
          LearningDaysOfWeek(days: post.days),
          divider,
          LabelText(text: 'Thời gian 1 ca học'),
          Info(post.session),
          divider,
          LabelText(text: 'Thời gian một khóa học'),
          Info(post.course),
          divider,
          LabelText(text: 'Giới tính yêu cầu'),
          Info(post.gender),
          divider,
          LabelText(text: 'Yêu cầu khác'),
          Info(post.requiredComment),
          divider,
          LabelText(text: 'Học phí / buổi'),
          Info('${(post.salary * 10000).toInt()} VND'),
          Divider(height: 75,color: Colors.transparent,),
        ],
      ),
    );
  }
}

class OtherUnacceptedClassDetail extends StatelessWidget {
  final Post post;

  const OtherUnacceptedClassDetail({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var divider = Divider(height: 20, color: Colors.transparent);
    return Detail(
      label: 'Nhận lớp',
      button: SubmitButton(context: context, postId: post.id),
      content: StreamBuilder(
          stream: database.collection('User').doc(post.whoPostUid).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              return snapshot.connectionState == ConnectionState.active
                  ? ListView(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      children: [
                        LabelText(text: 'Kiểu lớp'),
                        Info(post.type == 0 ? 'Tìm học sinh' : 'Tìm gia sư'),
                        LabelText(text: 'Người tìm lớp'),
                        Info(snapshot.data['Name']),
                        divider,
                        Center(
                            child: ClipOval(
                                child: Image.network(snapshot.data['Avatar']))),
                        divider,
                        LabelText(text: 'Số điện thoại'),
                        Info(snapshot.data['PhoneNumber']),
                        divider,
                        LabelText(text: 'Môn'),
                        Info(post.subject),
                        divider,
                        LabelText(text: 'Địa điểm'),
                        Info(post.address),
                        divider,
                        LabelText(text: 'Các buổi trong tuần'),
                        LearningDaysOfWeek(days: post.days),
                        divider,
                        LabelText(text: 'Thời gian 1 ca học'),
                        Info(post.session),
                        divider,
                        LabelText(text: 'Thời gian một khóa học'),
                        Info(post.course),
                        divider,
                        LabelText(text: 'Giới tính yêu cầu'),
                        Info(post.gender),
                        divider,
                        LabelText(text: 'Yêu cầu khác'),
                        Info(post.requiredComment),
                        divider,
                        LabelText(text: 'Học phí / buổi'),
                        Info('${(post.salary * 10000).toInt()} VND'),
                        Divider(height: 75, color: Colors.transparent)
                      ],
                    )
                  : Center(child: CircularProgressIndicator());
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

