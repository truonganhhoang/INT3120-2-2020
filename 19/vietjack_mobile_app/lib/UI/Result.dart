import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Result extends StatefulWidget {
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
                  percent: 0.8,
                  center: new Icon(
                    Icons.person_pin,
                    size: 50.0,
                    color: Colors.blue,
                  ),
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
                        child: Text('Câu đúng'),
                      ),
                      Container(
                        height: 50,
                        child: Text('Câu sai'),
                      ),
                      Container(
                        height: 50,
                        child: Text('Tổng kết'),
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
