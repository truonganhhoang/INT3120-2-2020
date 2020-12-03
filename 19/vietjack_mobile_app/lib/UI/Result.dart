import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Result extends StatefulWidget {
  final int totalQuestions;
  final int correctAnswer;

  const Result(
      {Key key, @required this.totalQuestions, @required this.correctAnswer})
      : super(key: key);
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Thống kê", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: <Widget>[
          Text("Kết quả", style: TextStyle(color: Colors.black, fontSize: 20)),
          Container(
            height: 300,
            child: Row(children: <Widget>[
              CircularPercentIndicator(
                  radius: 100.0,
                  lineWidth: 3.0,
                  percent: widget.correctAnswer / widget.totalQuestions,
                  center: new Text(
                      (widget.correctAnswer / widget.totalQuestions)
                          .toString()),
                  backgroundColor: Colors.grey,
                  progressColor: Colors.blue),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Container(
                        height: 50,
                        child:
                            Text(widget.correctAnswer.toString() + ' câu đúng'),
                      ),
                      Container(
                        height: 50,
                        child: Text(
                            (widget.totalQuestions - widget.correctAnswer)
                                    .toString() +
                                ' câu sai'),
                      ),
                      Container(
                        height: 50,
                        child:
                            Text(widget.totalQuestions.toString() + ' câu hỏi'),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
          const Divider(
            color: Colors.black,
            height: 10.0,
            thickness: 1.0,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
