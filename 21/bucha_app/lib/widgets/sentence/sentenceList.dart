import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Database.dart';

class sentenceList extends StatefulWidget {
  String topic;

  sentenceList({Key key, @required this.topic}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _sentenceList();
  }
}

// ignore: camel_case_types
class _sentenceList extends State<sentenceList> {
  int currentSentence;
  bool isShowDetail;

  void initState() {
    super.initState();
    currentSentence = -1;
    isShowDetail = false;
  }

  void handleTap(int index) {
      setState(() {
        if(currentSentence == index){
          isShowDetail = !isShowDetail;
        }else{
          currentSentence = index;
          isShowDetail = true;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder(
            stream: database
                .collection("Sentence")
                .where("topic", isEqualTo: widget.topic)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data.documents.length == 0)
                return Center(
                    child: Text(
                  'LOADING . . .',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ));
              return Container(
                height: MediaQuery.of(context).size.height,
                color: Color(0xff3fe7f1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            decoration: BoxDecoration(
                              color: Color(0xff0A1A52),
                              border: Border.all(
                                  width: 15.0, color: Color(0xff8BF8FF)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          Column(
                            children: [
                              Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(10),
                                        color: Color(0xff3DDAFD)),
                                    margin: EdgeInsets.only(
                                        // left: 0,
                                        // right: 0,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        bottom: 0),
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width *
                                        0.88,
                                    child: Center(
                                        child: Text(
                                      widget.topic,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                child: ListView.builder(
                                    itemCount: snapshot.data.documents.length,
                                    itemBuilder: (context, index) {
                                      if( currentSentence == index && isShowDetail ){
                                        return GestureDetector(
                                          key: Key('expandedItem'),
                                          onTap: (){handleTap(index);},
                                          child: Container(
                                          height: MediaQuery.of(context).size.height * 0.18,
                                          margin: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                                          decoration: BoxDecoration(
                                            color: Color(0xff893080),
                                            borderRadius:
                                            BorderRadius.circular(6),
                                          ),
                                          child: Column(
                                            children: [
                                              Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Text(
                                                      snapshot.data.documents[index]
                                                      ["english"],
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 26,
                                                          fontStyle: FontStyle.italic),
                                                    ),
                                                  )),
                                              Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Color(0xffC4C4C4),
                                                        borderRadius: BorderRadius.circular(6)
                                                      ),
                                                      child: Padding(
                                                          padding: EdgeInsets.only(top: 15, bottom: 15, left: 50, right: 50),
                                                          child: Text(
                                                            snapshot.data.documents[index]
                                                            ["vietnamese"],
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 26,
                                                                fontStyle: FontStyle.italic),
                                                          )
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                      ),
                                        );}
                                      return GestureDetector(
                                          key: Key('initialItem'),
                                          onTap: (){handleTap(index);},
                                        child:Container(
                                            height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                            margin: EdgeInsets.only(
                                                left: 30,
                                                right: 30,
                                                top: 5,
                                                bottom: 5),
                                            decoration: BoxDecoration(
                                              color: Color(0xffC6F2F4),
                                              borderRadius:
                                              BorderRadius.circular(6),
                                            ),
                                            child: Center(
                                                child: Text(
                                                  snapshot.data.documents[index]
                                                  ["vietnamese"],
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 26,
                                                      fontStyle: FontStyle.italic),
                                                )),
                                          ));
                                      }),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: RaisedButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      })),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
