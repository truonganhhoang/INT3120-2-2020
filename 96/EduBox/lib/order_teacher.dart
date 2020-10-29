import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package/widget.dart';

Color _color = Color(0xff00854c);

class ClassFilterName extends StatefulWidget {
  @override
  _ClassFilterNameState createState() => _ClassFilterNameState();
}

class _ClassFilterNameState extends State<ClassFilterName> {
  int selected = 1;
  var name = ['Đang học', 'Đang tìm', 'Đã xóa'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: List.generate(
            name.length,
            (index) => Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = index;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        name[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: index == selected ? Colors.red : Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}

class OrderTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Bài đăng của bạn',
          ),
        ),
        body: ListView(
          children: [
            Container(
              child: ClassFilterName(),
            ),
            Divider(
              thickness: 2,
              height: 0,
              color: Colors.lightGreen,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: _color),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Môn học:',
                          style: TextStyle(color: Colors.red),
                        ),
                        Expanded(
                          child: Text(
                            'Toán',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '||   Mã lớp: ',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '3000',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Row(children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Lớp dạy: ',
                              style: TextStyle(color: Colors.red))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Lớp 1',
                            style: TextStyle(color: Colors.black),
                          )),
                    ]),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Ngày học trong tuần: ',
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.left)),
                    Row(children: [
                      // Create list circle button.
                      new InkWell(
                        onTap: null,
                        child: new Container(
                            padding: const EdgeInsets.all(14.0),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: Text(
                              '2',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            )),
                      ),
                      new InkWell(
                        onTap: null,
                        child: new Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.green),
                            ),
                            child: Text(
                              '3',
                              style: new TextStyle(
                                  color: Colors.green, fontSize: 20.0),
                            )),
                      ),
                      new InkWell(
                        onTap: null,
                        child: new Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.green),
                            ),
                            child: Text(
                              '4',
                              style: new TextStyle(
                                  color: Colors.green, fontSize: 20.0),
                            )),
                      ),
                      new InkWell(
                        onTap: null,
                        child: new Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.green),
                            ),
                            child: Text(
                              '5',
                              style: new TextStyle(
                                  color: Colors.green, fontSize: 20.0),
                            )),
                      ),
                      new InkWell(
                        onTap: null,
                        child: new Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.green),
                            ),
                            child: Text(
                              '6',
                              style: new TextStyle(
                                  color: Colors.green, fontSize: 20.0),
                            )),
                      ),
                      new InkWell(
                        onTap: null,
                        child: new Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.green),
                            ),
                            child: Text(
                              '7',
                              style: new TextStyle(
                                  color: Colors.green, fontSize: 20.0),
                            )),
                      ),
                      new InkWell(
                        onTap: null,
                        child: new Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.green),
                            ),
                            child: Text(
                              'CN',
                              style: new TextStyle(
                                  color: Colors.green, fontSize: 15.0),
                            )),
                      ),
                    ]),
                    Row(children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Thời gian: ',
                              style: TextStyle(color: Colors.red))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('08:00 - 10:00',
                              style: TextStyle(color: Colors.black))),
                    ]),
                    Row(children: [
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(),
                            labelText: '10-10-2020',
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(),
                            labelText: '12-12-2020',
                          ),
                        ),
                      )
                    ]),
                    Row(children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Học phí: ',
                              style: TextStyle(color: Colors.red))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('600,000đ',
                              style: TextStyle(color: Colors.black))),
                    ]),
                    Row(children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Trạng thái: ',
                              style: TextStyle(color: Colors.red))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Chờ gia sư đăng ký',
                              style: TextStyle(color: Colors.black))),
                    ]),
                    Row(children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Hình thức: ',
                              style: TextStyle(color: Colors.red))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Tại nhà',
                              style: TextStyle(color: Colors.black))),
                    ]),
                    Row(
                      children: [
                        new InkWell(
                          onTap: null,
                          child: new Container(
                              margin: EdgeInsets.only(left: 7, right: 45),
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 5, bottom: 5),
                              decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.green,
                                    style: BorderStyle.solid),
                              ),
                              child: Text(
                                'HỦY BỎ',
                                style: new TextStyle(
                                    color: Colors.green, fontSize: 15.0),
                              )),
                        ),
                        new InkWell(
                          onTap: null,
                          child: new Container(
                              margin: EdgeInsets.only(left: 10, right: 2),
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 5, bottom: 5),
                              decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.green,
                                border: Border.all(
                                    color: Colors.green,
                                    style: BorderStyle.solid),
                              ),
                              child: Text(
                                'CHỈNH SỬA',
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  backgroundColor: _color,
                  child: Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPost()),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
