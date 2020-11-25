import 'package:flutter/material.dart';

class ExamOnline extends StatefulWidget {
  @override
  _ExamOnlineState createState() => _ExamOnlineState();
}

class _ExamOnlineState extends State<ExamOnline> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(minutes: 15));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.orange),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Countdown(
            animation: StepTween(
              begin: 15 * 60, // THIS IS A USER ENTERED NUMBER
              end: 0,
            ).animate(_controller),
          ),
          elevation: 0,
        ),
        body: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20.0),

                DefaultTabController(
                    length: 5, // length of tabs
                    initialIndex: 0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            child: TabBar(
                              isScrollable: true,
                              labelColor: Colors.green,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Tab(text: 'Tab 1'),
                                Tab(text: 'Tab 2'),
                                Tab(text: 'Tab 3'),
                                Tab(text: 'Tab 4'),
                                Tab(text: 'Tab 5'),
                              ],
                            ),
                          ),
                          Container(
                              height: 400, //height of TabBarView
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              child: TabBarView(children: <Widget>[
                                Container(
                                  child: Center(
                                    child: Text('Display Tab 1',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text('Display Tab 2',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text('Display Tab 3',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text('Display Tab 4',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text('Display Tab 4',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ]))
                        ])),
                //create tabs here
              ]),
        ));
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  final Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${(clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}';

    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }
}
