import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduBox',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Danh sách yêu cầu gia sư'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Container(
          decoration: new BoxDecoration(
              border: Border(
            bottom: BorderSide(
                color: Colors.lightGreen, width: 2, style: BorderStyle.solid),
          )),
          child: Row(children: [
            Expanded(
              child: new FlatButton(
                onPressed: null,
                child: Text('Đang học',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center),
                textColor: Colors.black,
              ),
            ),
            Expanded(
              child: new FlatButton(
                onPressed: null,
                child: Text('Đang tìm gia sư',
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center),
                textColor: Colors.black,
              ),
            ),
            Expanded(
              child: new FlatButton(
                  onPressed: null,
                  child: Text('Đã kết thúc',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center),
                  textColor: Colors.black),
            ),
            Expanded(
              child: new FlatButton(
                  onPressed: null,
                  child: Text('Đã xóa',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center)),
            ),
          ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 30, bottom: MediaQuery.of(context).size.height*1/4),
          decoration:
              new BoxDecoration(border: Border.all(color: Colors.green)),
          child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: Text(
                    'Môn học:',
                    style: TextStyle(color: Colors.red),
                  ),
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
              ]),
              Row(children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text('Lớp dạy: ', style: TextStyle(color: Colors.red))),
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
                        style:
                            new TextStyle(color: Colors.white, fontSize: 20.0),
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
                        style:
                            new TextStyle(color: Colors.green, fontSize: 20.0),
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
                        style:
                            new TextStyle(color: Colors.green, fontSize: 20.0),
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
                        style:
                            new TextStyle(color: Colors.green, fontSize: 20.0),
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
                        style:
                            new TextStyle(color: Colors.green, fontSize: 20.0),
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
                        style:
                            new TextStyle(color: Colors.green, fontSize: 20.0),
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
                        style:
                            new TextStyle(color: Colors.green, fontSize: 15.0),
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
                    child:
                        Text('Học phí: ', style: TextStyle(color: Colors.red))),
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
                    child:
                        Text('Tại nhà', style: TextStyle(color: Colors.black))),
              ]),
              Row(children: [
                new InkWell(
                  onTap: null,
                  child: new Container(
                      margin: EdgeInsets.only(left: 7, right: 45),
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        border: Border.all(color: Colors.green, style: BorderStyle.solid),
                      ),
                      child: Text(
                        'HỦY BỎ',
                        style:
                        new TextStyle(color: Colors.green, fontSize: 15.0),
                      )),
                ),
                new InkWell(
                  onTap: null,
                  child: new Container(
                      margin: EdgeInsets.only(left: 10, right: 2),
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.green,
                        border: Border.all(color: Colors.green, style: BorderStyle.solid),
                      ),
                      child: Text(
                        'CHỈNH SỬA',
                        style:
                        new TextStyle(color: Colors.white, fontSize: 15.0),
                      )),
                ),
              ],)
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.white),
            onPressed: null,
          ),
        ),
      ]),
    );
  }
}
