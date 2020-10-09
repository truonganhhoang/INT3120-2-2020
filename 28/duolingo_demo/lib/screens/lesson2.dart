import 'package:flutter/material.dart';

import 'home.dart';

class Lesson2 extends StatefulWidget {
  @override
  _Lesson2State createState() => _Lesson2State();
}

class _Lesson2State extends State<Lesson2> {
  bool isTapped;
  var numberTapped;
  var isChecked = [false, false, false];
  // luu vi tri gan nhat duoc Tap
  var lastChecked;

  @override
  void initState() {
    super.initState();
    isTapped = false;
    numberTapped = 0;
    lastChecked = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // thanh trạng thái, chứ nút thoát ra trang chủ chọn bài học,
      // tiến độ làm bài và streak
      appBar: AppBar(
         automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 2,
          title: Row(children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Image.asset('assets/images/x_button.png', height: 25)),
            SizedBox(
              width: 20,
            ),
            Container(
              child: Container(
                height: 15,
                width: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: new Container(
                  height: 15,
                  width: 20,
                  decoration: new BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Image.asset('assets/images/heart.png', height: 30),
          ])),
      body: body('Họ thích cà phê hơn.', 'They prefer coffee.',
          'They prefer food.', 'They prefer juice.'),
    );
  }

  Widget body(String question, String answer1, String answer2, String answer3) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      // alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          new Padding(padding: EdgeInsets.all(10.0)),

          // Yêu cầu đề bài
          Container(
            alignment: Alignment.topLeft,
            height: 50,
            child: Text(
              'Chọn bản dịch đúng',
              style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Câu cần dịch
          Container(
            alignment: Alignment.topLeft,
            height: 30,
            child: Text(
              'Họ thích cà phê hơn.',
              style: new TextStyle(
                fontSize: 27.0,
              ),
            ),
          ),
          new Padding(padding: EdgeInsets.all(5.0)),

          // các đáp án
          SizedBox(
            height: 400, // set this
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                answer(answer1, 1),
                new Padding(padding: EdgeInsets.all(5.0)),
                answer(answer2, 2),
                new Padding(padding: EdgeInsets.all(5.0)),
                answer(answer3, 3),
              ],
            ),
          ),
          new Padding(padding: EdgeInsets.all(5.0)),

          // nút kiểm tra
          MaterialButton(
            minWidth: 350.0,
            color: isTapped ? Colors.green : Colors.grey,
            height: 40.0,
            onPressed: () {
              if (numberTapped == 1)
                debugPrint("true");
              else
                debugPrint("wrong");
            },
            child: new Text(
              'KIỂM TRA',
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // tạo nội dung cho các ô đáp án, xử lý sự kiện khi ô được chọn
  Widget answer(String answer, var number) {
    return GestureDetector(
      // hàm xử lý sự kiện chọn ô
      onTap: () {
        setState(() {
          if (lastChecked != 0) {
            isChecked[lastChecked - 1] = false;
          }
          isTapped = true;
          numberTapped = number;
          lastChecked = number;
          isChecked[number - 1] = true;
        });
      },
      child: Container(
        height: 50,
        width: 350,
        decoration: new BoxDecoration(
          color: isChecked[number - 1] ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),

        // thêm nội dung, định dạng text trong các ô đáp án
        child: Center(
          child: new Text(
            answer,
            style: new TextStyle(fontSize: 25.0, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
