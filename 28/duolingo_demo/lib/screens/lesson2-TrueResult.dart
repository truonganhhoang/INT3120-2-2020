import 'package:flutter/material.dart';
import 'home.dart';

class Lesson2_TrueResult extends StatefulWidget {
  @override
  _Lesson2_TrueResultState createState() => _Lesson2_TrueResultState();
}

class _Lesson2_TrueResultState extends State<Lesson2_TrueResult> {
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
          new Padding(padding: EdgeInsets.all(30.0)),

          // nut thong bao ket qua
          Container(
            width: 400,
            height: 50,
            //padding: EdgeInsets.all(2.0),
            child: Stack(
              children: <Widget>[
                new Positioned(
                    top: -40,
                    child: Container(
                      width: 420.0,
                      height: 120.0,
                      decoration: new BoxDecoration(
                        color: Colors.lightGreenAccent[100],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'TUYỆT VỜI!',
                          style: new TextStyle(
                            color: Colors.lightGreenAccent[700],
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )),
                Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(1.0)),
                    Center(
                      child: MaterialButton(
                        minWidth: 340.0,
                        // color: isTapped ? Colors.green : Colors.grey,
                        color: Colors.lightGreenAccent[700],
                        height: 40.0,
                        onPressed: () {
                          Navigator.push(
                              // EDIT: lesson1 -> lesson1
                              context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: new Text(
                          'TIẾP TỤC',
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              overflow: Overflow.visible,
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
