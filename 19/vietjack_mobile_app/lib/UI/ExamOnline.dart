import 'package:flutter/material.dart';

class ExamOnline extends StatefulWidget {
  @override
  _ExamOnlineState createState() => _ExamOnlineState();
}

class _ExamOnlineState extends State<ExamOnline> with TickerProviderStateMixin {
  AnimationController _controller;
  TabController _tabController;
  int _tabIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
    _controller =
        AnimationController(vsync: this, duration: Duration(minutes: 15));
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // custom code here
      }
    });
  }

  void nextTab() {
    if (_tabIndex < 4) {
      this.setState(() {
        _tabIndex = _tabController.index + 1;
      });
      _tabController.animateTo(_tabIndex);
    }
  }

  void previousTab() {
    if (_tabIndex > 0) {
      this.setState(() {
        _tabIndex = _tabController.index - 1;
      });
      _tabController.animateTo(_tabIndex);
    }
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
          actions: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Text("Nộp bài", style: TextStyle(color: Colors.orange)))
          ],
        ),
        body: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20.0),
                DefaultTabController(
                    length: 5,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            child: TabBar(
                              isScrollable: true,
                              labelColor: Colors.orange,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Tab(text: 'Tab 1'),
                                Tab(text: 'Tab 2'),
                                Tab(text: 'Tab 3'),
                                Tab(text: 'Tab 4'),
                                Tab(text: 'Tab 5'),
                              ],
                              controller: _tabController,
                            ),
                          ),
                          Container(
                              height: 400,
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              child: TabBarView(
                                  controller: _tabController,
                                  children: <Widget>[
                                    Container(
                                      child: Center(child: CustomRadio()),
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
                Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _tabIndex > 0
                          ? FlatButton(
                              onPressed: previousTab, child: Text("Previous"))
                          : Container(),
                      _tabIndex < 4
                          ? FlatButton(onPressed: nextTab, child: Text("Next"))
                          : Container(),
                    ],
                  ),
                )
                // FlatButton(onPressed: null, child: Text("Previous")),
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

// ignore: slash_for_doc_comments
/**
 * Radio selection
 * Author: Vu Quang Huy
 * 23/11/2020
 */

class CustomRadio extends StatefulWidget {
  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio>
    with AutomaticKeepAliveClientMixin<CustomRadio> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    sampleData.add(new RadioModel(false, 'A', 'April 18'));
    sampleData.add(new RadioModel(false, 'B', 'April 17'));
    sampleData.add(new RadioModel(false, 'C', 'April 16'));
    sampleData.add(new RadioModel(false, 'D', 'April 15'));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(children: <Widget>[
      Center(
          child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(
                  'Quá trình phát triển của văn học Việt Nam từ cách mạng tháng 8 năm 1945 đến năm 1975 trải qua mấy chặng đường chính?',
                  style: TextStyle(fontSize: 17)))),
      Expanded(
        child: ListView.builder(
          itemCount: sampleData.length,
          itemBuilder: (BuildContext context, int index) {
            return new InkWell(
              //highlightColor: Colors.red,
              splashColor: Colors.orange,
              onTap: () {
                setState(() {
                  sampleData.forEach((element) => element.isSelected = false);
                  sampleData[index].isSelected = true;
                });
              },
              child: new RadioItem(sampleData[index]),
            );
          },
        ),
      )
    ]);
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 50.0,
            width: 50.0,
            child: new Center(
              child: new Text(_item.buttonText,
                  style: new TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected ? Colors.orange : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Colors.orange : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 10.0),
            child: new Text(_item.text),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}
