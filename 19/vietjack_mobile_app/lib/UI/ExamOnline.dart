import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vietjack_mobile_app/UI/Result.dart';

class ExamOnline extends StatefulWidget {
  static num correctAnswer = 0;
  static Map _answers = new Map<int, int>();
  final String weekID;
  final String examID;
  final String currentSubject;

  const ExamOnline({Key key, this.weekID, this.examID, this.currentSubject})
      : super(key: key);

  @override
  _ExamOnlineState createState() => _ExamOnlineState();
}

class _ExamOnlineState extends State<ExamOnline> with TickerProviderStateMixin {
  AnimationController _controller;
  TabController _tabController;
  int _tabIndex = 0;
  List<Widget> listTab;
  List<Widget> listCustomRadio;
  bool loading = true;

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    List<Widget> tempListTab = [];
    List<Widget> tempListCustomRadio = [];

    FirebaseFirestore.instance
        .collection("ThiOnline")
        .doc("Class 12")
        .collection("Subject")
        .doc(widget.currentSubject)
        .collection("Detail/")
        .doc(widget.weekID)
        .collection("Exam")
        .doc(widget.examID)
        .collection("DetailQuestion")
        .get()
        .then((value) {
      value.docs.asMap().forEach((index, element) {
        ExamOnline._answers[index] = 0;
        tempListTab.add(Tab(text: (index + 1).toString()));
        List<RadioModel> tempRadioModel = [];
        element['answer'].forEach((key, value) {
          tempRadioModel
              .add(RadioModel(false, key, value['text'], value['point']));
        });
        tempListCustomRadio.add(
          Container(
            child: Center(
                child: CustomRadio(
                    id: index,
                    radioData: tempRadioModel,
                    question: element['question'])),
          ),
        );

        this.setState(() {
          this.listTab = tempListTab;
          this.listCustomRadio = tempListCustomRadio;
          _tabController =
              TabController(vsync: this, length: this.listTab.length);
        });
      });
    });

    _controller =
        AnimationController(vsync: this, duration: Duration(minutes: 15));
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // custom code here
      }
    });
  }

  Map<List<CustomRadio>, List<RadioModel>> testData;

  Future<dynamic> getExam() async {
    var finalData = {};
    List<Widget> tempListCustomRadio = [];
    QuerySnapshot data = await FirebaseFirestore.instance
        .collection("ThiOnline")
        .doc("Class 12")
        .collection("Subject")
        .doc(widget.currentSubject)
        .collection("Detail/")
        .doc(widget.weekID)
        .collection("Exam")
        .doc(widget.examID)
        .collection("DetailQuestion")
        .get();
    data.docs.asMap().forEach((index, element) async {
      List<RadioModel> listRadio = [];
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
            RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Result()));
                  print(ExamOnline._answers);
                },
                child: Text("Nộp bài", style: TextStyle(color: Colors.orange)))
          ],
        ),
        body: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20.0),
                DefaultTabController(
                    length: this.listTab == null ? 0 : this.listTab.length,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            child: TabBar(
                              isScrollable: true,
                              labelColor: Colors.orange,
                              unselectedLabelColor: Colors.black,
                              tabs: this.listTab == null ? [] : this.listTab,
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
                                  children: this.listTab == null
                                      ? []
                                      : listCustomRadio))
                        ])),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _tabIndex > 0
                              ? FlatButton(
                                  onPressed: previousTab,
                                  child: Text("Previous"))
                              : Container(),
                          _tabIndex < 4
                              ? FlatButton(
                                  onPressed: nextTab, child: Text("Next"))
                              : Container(),
                        ],
                      ),
                    ),
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

// ignore: must_be_immutable
class CustomRadio extends StatefulWidget {
  final num id;
  num point = 0;
  List<RadioModel> radioData;
  final String question;

  CustomRadio({Key key, @required this.id, this.radioData, this.question})
      : super(key: key) {
    print(this.radioData);
    ExamOnline._answers[this.id] = this.point;
  }
  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio>
    with AutomaticKeepAliveClientMixin<CustomRadio> {
  List<RadioModel> sampleData = new List<RadioModel>();
  String correctAnswer = "A";

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(children: <Widget>[
      Center(
          child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(widget.question, style: TextStyle(fontSize: 17)))),
      Expanded(
        child: ListView.builder(
          itemCount: widget.radioData.length,
          itemBuilder: (BuildContext context, int index) {
            return new InkWell(
              //highlightColor: Colors.red,
              splashColor: Colors.orange,
              onTap: () {
                widget.point = widget.radioData[index].point;
                ExamOnline._answers[widget.id] = widget.radioData[index].point;
                setState(() {
                  widget.radioData
                      .forEach((element) => element.isSelected = false);
                  widget.radioData[index].isSelected = true;
                });
              },
              child: new RadioItem(widget.radioData[index]),
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
          Expanded(
            child: new Container(
              margin: new EdgeInsets.only(left: 10.0),
              child: new Text(_item.text),
            ),
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
  final num point;

  RadioModel(this.isSelected, this.buttonText, this.text, this.point);
}
