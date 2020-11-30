import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vietjack_mobile_app/UI/ExamOnline.dart';

// ignore: must_be_immutable
class ExamsCard extends StatefulWidget {
  final QueryDocumentSnapshot testArray;
  final String weekID;
  final String currentSubject;
  ExamsCard({this.testArray, this.weekID, this.currentSubject});
  @override
  _ExamsCardState createState() => _ExamsCardState();
}

class _ExamsCardState extends State<ExamsCard> {
  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width - 20.0;
    return Row(
      children: [
        Expanded(
          child: Container(
              decoration: new BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: ExpansionTile(
                trailing: Icon(Icons.add, color: Colors.orange, size: 40),
                title: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(widget.testArray['title'],
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 150,
                      child: Row(
                        children: [
                          Container(
                              width: cardWidth * 0.7,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(widget.testArray['title'],
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey)),
                              )),
                          Container(
                              width: cardWidth * 0.3,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ExamOnline(
                                              weekID: widget.weekID,
                                              examID: widget.testArray.id,
                                              currentSubject:
                                                  widget.currentSubject)));
                                },
                                child: Text("Bắt đầu",
                                    style: TextStyle(color: Colors.orange)),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
