import 'dart:ui';

import 'package:EduBox/NewPost/BeginDatePicker.dart';
import 'package:EduBox/NewPost/NewPostTemplate.dart';
import 'package:EduBox/NewPost/TimePicker.dart';
import 'package:provider/provider.dart';

import '../NewPost/DaysOfWeek.dart';
import '../package/widget.dart';

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
  final classType type;
  const NewOrder({Key key, this.type}) : super(key: key);

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
        body: ChangeNotifierProvider(
          create: (context)=>SubmitForm(),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: ListView(
              children: [
                widget.type == classType.findStudent
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
                          ADropDownMenu(
                              listOfItems: List.generate(12,
                                  (index) => 'Lớp ' + (index + 1).toString())),
                        ],
                      ),
                      divider,
                      Column(
                        children: [
                          LabelText(text: 'Môn'),
                          ADropDownMenu(listOfItems: [
                            'Toán',
                            'Lý',
                            'Hóa',
                            'Văn',
                            'Sinh',
                            'Anh',
                            'Tin'
                          ]),
                        ],
                      ),
                      divider,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelText(text: 'Địa chỉ'),
                          InputCommentAddressBox(hintText: 'Địa chỉ học'),
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
                                TimePicker(),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward, size: 32),
                          Container(
                            //height: 80,
                            width: 124,
                            alignment: Alignment.bottomCenter,
                            child: TimePicker(),
                          ),
                        ],
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
                                //BeginDatePicker(),

                              ],
                            ),
                          ),
                        ],
                      ),
                      divider,
                      Column(
                        children: [
                          LabelText(text: 'Giới tính yêu cầu'),
                          ADropDownMenu(
                            listOfItems: ['Nam/Nữ', 'Nam', 'Nữ'],
                          )
                        ],
                      ),
                      divider,
                      Column(
                        children: [
                          LabelText(text: 'Mô tả yêu cầu'),
                          InputCommentAddressBox(
                            hintText:
                                'Nhập mô tả của bạn \nVui lòng nhập chi tiết mô tả (nếu có)',
                          )
                        ],
                      ),
                      divider,
                      Column(
                        children: [
                          LabelText(text: 'Lương/buổi (hệ số của 100.000 VND)'),
                          InputCommentAddressBox(
                            hintText: 'Tối thiểu 1',
                            canBeNull: false,
                          ),
                        ],
                      ),
                      divider,
                      Center(
                        child: InkWell(
                          onTap: () {
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
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Container(
                                      child: Text('Không'),
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
                          },
                          child: Container(
                            height: 60,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).primaryColor.withOpacity(1),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 0,
                                  blurRadius: 3,
                                  offset: Offset(3, 3),
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(1),
                                ),
                                BoxShadow(
                                  blurRadius: 2,
                                  offset: Offset(1.5, 1.5),
                                  color: Colors.black,
                                )
                              ],
                            ),
                            child: Text(
                              'Đăng bài',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
