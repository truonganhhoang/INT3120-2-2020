import 'dart:ui';
import 'package:EduBox/IntermediateWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../NewPost/DaysOfWeek.dart';
import 'BeginAndEndDatePicker.dart';
import 'BeginAndEndTimePicker.dart';
import 'ClassAddress.dart';
import 'CommentBox.dart';
import 'GradePicker.dart';
import 'InputSalaryBox.dart';
import 'LabelText.dart';
import '../Models/NewPostTemplate.dart';
import 'RequiredGender.dart';
import 'SubjectPicker.dart';

enum classType { findTeacher, findStudent }

class ClassTypeLabel extends StatelessWidget {
  final Image image;
  final String text;

  const ClassTypeLabel({Key key, this.image, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 300,
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                offset: Offset(3, 3),
                color: Colors.black54,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: image,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FindStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassTypeLabel(
        image: Image.asset(
          'lib/assets/student.png',
          height: 30,
          width: 30,
        ),
        text: 'Tìm học sinh');
  }
}

class FindTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassTypeLabel(
        image: Image.asset(
          'lib/assets/teacher.png',
          height: 30,
          width: 30,
        ),
        text: 'Tìm gia sư');
  }
}

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  static var divider = Divider(height: 10, color: Colors.transparent);
  double width = 0;

  @override
  Widget build(BuildContext context) {
    setState(() {
      width = MediaQuery.of(context).size.width;
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Thêm yêu cầu mới'),
        ),
        floatingActionButton: Consumer<SubmitForm>(
          builder: (context, form, _) => Container(
            height: 50,
            width: 300,
            child: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9)),
              onPressed: !form.canBeSubmit.contains(false)
                  ? () {
                      submitYesOrNo(context, function: () {
                        FirebaseFirestore.instance.collection('Post').add(
                            Provider.of<SubmitForm>(context, listen: false)
                                .toJson());
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      });
                    }
                  : () {},
              backgroundColor: !form.canBeSubmit.contains(false)
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              label: Text(
                'Đăng bài',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Provider.of<SubmitForm>(context, listen: false).type == 0
                  ? FindStudent()
                  : FindTeacher(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 2 - 150),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        LabelText(text: 'Lớp'),
                        GradePicker(),
                      ],
                    ),
                    divider,
                    Column(
                      children: [
                        LabelText(text: 'Môn'),
                        SubjectPicker(),
                      ],
                    ),
                    divider,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelText(text: 'Địa chỉ'),
                        ClassAddress(),
                      ],
                    ),
                    divider,
                    Column(
                      children: [
                        LabelText(text: 'Ngày học trong tuần'),
                        DaysOfWeek(),
                      ],
                    ),
                    divider,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          //height: 80,
                          width: 124,
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              LabelText(text: 'Thời gian'),
                              BeginTimePicker(),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward, size: 32),
                        Container(
                          //height: 80,
                          width: 124,
                          alignment: Alignment.bottomCenter,
                          child: EndTimePicker(),
                        ),
                      ],
                    ),
                    divider,
                    Consumer<SubmitForm>(
                      builder: (context, form, _) => Visibility(
                        child: Text(
                          'Tối thiểu 1 tiếng ( 60 phút )',
                          style: TextStyle(color: Colors.red),
                        ),
                        visible: !form.canBeSubmit[2],
                      ),
                    ),
                    divider,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 124,
                          child: Column(
                            children: [
                              LabelText(text: 'Thời gian bắt đầu'),
                              BeginDatePicker(),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward, size: 32),
                        Container(
                          height: 80,
                          width: 124,
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              LabelText(text: 'Thời gian kết thúc'),
                              EndDatePicker(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Consumer<SubmitForm>(
                      builder: (context, form, _) => Visibility(
                        child: Text(
                          'Tối thiểu 30 ngày',
                          style: TextStyle(color: Colors.red),
                        ),
                        visible: !form.canBeSubmit[3],
                      ),
                    ),
                    divider,
                    Column(
                      children: [
                        LabelText(text: 'Giới tính yêu cầu'),
                        RequiredGender(),
                      ],
                    ),
                    divider,
                    Column(
                      children: [
                        LabelText(text: 'Mô tả yêu cầu'),
                        CommentBox(),
                      ],
                    ),
                    divider,
                    //Consumer<SubmitForm>(builder: (context, form,_)=>Text(form.requirement??'')),
                    Column(
                      children: [
                        LabelText(text: 'Lương/buổi ( hệ số 10.000 VND)'),
                        InputSalaryBox(),
                      ],
                    ),
                    divider,
                    Divider(
                      height: 60,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
