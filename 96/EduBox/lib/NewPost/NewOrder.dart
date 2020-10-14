import 'dart:ui';

import 'package:EduBox/NewPost/DatePicker.dart';
import 'package:EduBox/NewPost/TimePicker.dart';

import '../NewPost/DaysOfWeek.dart';
import '../package/widget.dart';

enum classType { findTeacher, findStudent }

class FindStudent extends StatelessWidget {
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
              child: Image.asset(
                'lib/assets/student.png',
                height: 30,
                width: 30,
              ),
            ),
            Text(
              'Tìm học sinh',
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

class FindTeacher extends StatelessWidget {
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
              child: Image.asset(
                'lib/assets/teacher.png',
                height: 30,
                width: 30,
              ),
            ),
            Text(
              'Tìm gia sư',
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
        body: GestureDetector(
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
                        InputBox(
                          hintText: 'Địa chỉ của bạn',
                          maxLine: 3,
                          canBeNull: false,
                        ),
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
                              DatePicker(),
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
                              DatePicker(),
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
                        InputBox(
                          hintText:
                              'Nhập mô tả của bạn \nVui lòng nhập chi tiết mô tả (nếu có)',
                          maxLine: 4,
                        )
                      ],
                    ),
                    divider,
                    Column(
                      children: [
                        LabelText(text: 'Lương/buổi (hệ số của 100.000 VND)'),
                        InputBox(
                          hintText: 'Tối thiểu 1',
                          initialValue: true,
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
    );
  }
}
