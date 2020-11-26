import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ExamsPicker.dart';

// ignore: must_be_immutable
class MyCustomCard extends StatefulWidget {
  MyCustomCard({Key key, this.currentSubject, this.function}) : super(key: key);

  String currentSubject;
  final Function function;

  updateCurrentSubject(subject) {
    this.currentSubject = subject;
  }

  @override
  MyCustomCardState createState() =>
      MyCustomCardState(currentSubject: this.currentSubject);
}

class MyCustomCardState extends State<MyCustomCard> {
  String currentSubject;
  List<dynamic> docs = [];
  MyCustomCardState({@required this.currentSubject});

  changeSubject(String subject) async {
    FirebaseFirestore.instance
        .collection("ThiOnline")
        .doc("Class 12")
        .collection("Subject")
        .doc(subject)
        .collection("Detail")
        .orderBy("id")
        .get()
        .then((data) => {
              this.setState(() {
                print(this.docs.length);
                this.docs = data.docs;
                this.currentSubject = subject;
                widget.updateCurrentSubject(subject);
                widget.function(subject);
              }),
            });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey('MyCustomCard'),
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: this.docs.length,
      itemBuilder: (BuildContext context, int index) {
        return Material(
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExamsPicker(
                              currentSubject: currentSubject, id: index + 1)));
                },
                child: Container(
                  height: 75,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.black)),
                  ),
                  child: ListTile(
                    // contentPadding:
                    //     EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: new BoxDecoration(
                        border: Border.all(width: 2.5, color: Colors.grey[300]),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text((index + 1).toString(),
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.orange, fontSize: 25)),
                      ),
                    ),
                    title: Text(
                      this.docs[index]['title'].toString(),
                      style: TextStyle(
                          color: Colors.blue[600], fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.book, size: 20),
                        Text(this.docs[index]["exams"].toString() + " Bộ đề",
                            style: TextStyle(color: Colors.grey[500]))
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}

// class MyCustomCard extends StatelessWidget {
//   MyCustomCard(
//       {Key key,
//       @required this.weekNumber,
//       @required this.snapshot,
//       this.currentSubject})
//       : super(key: key);

//   final int weekNumber;
//   final List<dynamic> snapshot;
//   final String currentSubject;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       key: PageStorageKey('MyCustomCard'),
//       shrinkWrap: true,
//       physics: ScrollPhysics(),
//       itemCount: snapshot.length,
//       itemBuilder: (BuildContext context, int index) {
//         return MakeCard(index, snapshot, currentSubject);
//       },
//     );
//   }
// }

// class MakeCard extends StatelessWidget {
//   final int index;
//   final dynamic snapshot;
//   final String currentSubject;
//   MakeCard(this.index, this.snapshot, this.currentSubject);
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
