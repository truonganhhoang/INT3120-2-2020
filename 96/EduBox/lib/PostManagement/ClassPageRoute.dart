import 'package:flutter/material.dart';

import 'ClassList.dart';

class MyPostFilter extends StatelessWidget {
  final Function function;
  final String name;
  final bool clicked;

  const MyPostFilter({Key key, this.function, this.name, this.clicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: function,
      child: Container(
        child: Center(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: clicked ? Colors.red : null,
            ),
          ),
        ),
      ),
    );
  }
}

class AllMyClassPage extends StatefulWidget {
  @override
  _AllMyClassPageState createState() => _AllMyClassPageState();
}

class _AllMyClassPageState extends State<AllMyClassPage> {
  int num = 0;
  int clicked = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bài đăng của tôi'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: List.generate(
                  3,
                      (index) => Expanded(
                    child: MyPostFilter(
                      function: () {
                        setState(() {
                          num = index;
                          clicked = index;
                        });
                      },
                      name: index == 0
                          ? 'Tất cả'
                          : index == 1
                          ? 'Đã được chấp nhận'
                          : 'Chưa được chấp nhận',
                      clicked: clicked == index,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 180,
              child: num == 0
                  ? AllMyClassList()
                  : num == 1
                  ? MyClassAndBeAcceptedList()
                  : MyClassAndNotBeAcceptedList(),
            )
          ],
        ),
      ),
    );
  }
}

class MyOnScheduleClassPage extends StatefulWidget {
  @override
  _MyOnScheduleClassPageState createState() => _MyOnScheduleClassPageState();
}

class _MyOnScheduleClassPageState extends State<MyOnScheduleClassPage> {
  int num = 0;
  int clicked = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Các lớp có lịch'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: List.generate(
                  3,
                      (index) => Expanded(
                    child: MyPostFilter(
                      function: () {
                        setState(() {
                          num = index;
                          clicked = index;
                        });
                      },
                      name: index == 0
                          ? 'Tất cả'
                          : index == 1
                          ? 'Lớp đã nhận'
                          : 'Lớp đã được nhận',
                      clicked: clicked == index,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 175,
              child: num == 0
                  ? MyOnScheduleClassList()
                  : num == 1
                  ? ClassIAcceptedList()
                  : MyClassAndBeAcceptedList(),
            )
          ],
        ),
      ),
    );
  }
}

class OtherUnacceptedClassPage extends StatefulWidget {

  final Axis scrollDirection;

  const OtherUnacceptedClassPage({Key key, this.scrollDirection}) : super(key: key);

  @override
  _OtherUnacceptedClassPageState createState() => _OtherUnacceptedClassPageState();
}

class _OtherUnacceptedClassPageState extends State<OtherUnacceptedClassPage> {
  int num = 0;
  int clicked = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Các lớp mới'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: List.generate(
                  3,
                      (index) => Expanded(
                    child: MyPostFilter(
                      function: () {
                        setState(() {
                          num = index;
                          clicked = index;
                        });
                      },
                      name: index == 0
                          ? 'Tất cả'
                          : index == 1
                          ? 'Tìm học sinh'
                          : 'Tìm gia sư',
                      clicked: clicked == index,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 175,
              child: num == 0
                  ? OtherUnacceptedClassList()
                  : num == 1
                  ? UnacceptedFindStudentClassList()
                  : UnacceptedFindTeacherClassList(),
            )
          ],
        ),
      ),
    );
  }
}