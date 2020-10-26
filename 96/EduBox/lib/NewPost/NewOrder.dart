import 'dart:ui';

import 'package:EduBox/NewPost/BeginDatePicker.dart';
import 'package:EduBox/NewPost/ClassAddress.dart';
import 'package:EduBox/NewPost/CommentBox.dart';
import 'package:EduBox/NewPost/EndDatePicker.dart';
import 'package:EduBox/NewPost/EndTimePicker.dart';
import 'package:EduBox/NewPost/GradePicker.dart';
import 'package:EduBox/NewPost/InputSalaryBox.dart';
import 'package:EduBox/NewPost/NewPostTemplate.dart';
import 'package:EduBox/NewPost/BeginTimePicker.dart';
import 'package:provider/provider.dart';

import '../NewPost/DaysOfWeek.dart';
import '../package/widget.dart';
import 'SubjectPicker.dart';

enum classType { findTeacher, findStudent }

class Label extends StatelessWidget {
  final Image image;
  final String text;

  const Label({Key key, this.image, this.text}) : super(key: key);

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
              // 'Tìm học sinh',
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
    return Label(
        image: Image.asset('lib/assets/student.png', height: 30, width: 30),
        text: 'Tìm học sinh');
  }
}

class FindTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Label(
        image: Image.asset(
          'lib/assets/teacher.png',
          height: 30,
          width: 30,
        ),
        text: 'Tìm gia sư');
  }
}

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
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
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Xác nhận?'),
                          actions: [
                            FlatButton(
                              child: Container(
                                child: Text('Có'),
                                height: 20,
                              ),
                              onPressed: () {

                                Navigator.of(context).popUntil((route) => route.isFirst);
                              },
                            ),
                            FlatButton(
                              child: Container(
                                child: Text('Không'),
                                height: 20,
                              ),
                              onPressed: () {
                                print(Provider.of<SubmitForm>(context, listen: false).type);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        barrierDismissible: true,
                      );
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
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [

              Provider.of<SubmitForm>(context, listen: false).type == 0
                  ? FindStudent()
                  : FindTeacher(),

              Consumer<SubmitForm>(
                builder: (context, form, _) => Column(
                  children: [

                    Text(form.type.toString()),
                    Text(form.grade.toString()),
                    Text(form.subject),
                    Text(form.address ?? 'null'),
                    Text(form.days.toString()),

                    Text(form.salary.toString() ?? ''),
                    Text(form.canBeSubmit.toString()),

                  ],
                ),
              ),
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
