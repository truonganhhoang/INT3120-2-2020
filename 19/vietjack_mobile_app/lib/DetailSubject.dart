import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'API.dart';
import 'SubjectContent.dart';

class DetailSubject extends StatefulWidget {
  @override
  _DetailSubjectState createState() => _DetailSubjectState();
  String grade;
  String nameSubject;
  static String getTitle(String fullname){
    int length = (fullname.indexOf('(')!=-1) ? fullname.indexOf('(') : fullname.length;
    return fullname.substring(0,length).trim();
  }
  static String getSubtitle(String fullname){
    int start = (fullname.indexOf('(') != -1) ? fullname.indexOf('(')+1 : 0;
    int end = (fullname.indexOf(')') != -1) ? fullname.indexOf(')') : 0;
    return fullname.substring(start,end).trim();
  }
  DetailSubject({Key key, this.grade, this.nameSubject}) : super(key: key);
}

class _DetailSubjectState extends State<DetailSubject> {
  List<QueryDocumentSnapshot> listContent;

  Future<QuerySnapshot> getListContent() async {
    QuerySnapshot listContent =
        await API.getListContent(widget.grade, widget.nameSubject);
    return listContent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Subject"),
          centerTitle: true,
        ),
        body: new FutureBuilder(
            future: this.getListContent(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return new Text("No Connection");
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return new Text("Loading...");
                case ConnectionState.done:
                  return new SafeArea(
                    child: new ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return new Container(
                          color: (index % 2 == 0)
                              ? Colors.white
                              : Colors.brown[50],
                          height: 80,
                          child: Center(
                            child: new ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        // new Text(snapshot.data.docs[index]["content"])
                                        new SubjectContent(header: snapshot.data.docs[index].id,content: snapshot.data.docs[index]["content"],)
                                    ));
                              },
                              leading: Icon(
                                Icons.ac_unit,
                                size: 30,
                              ),
                              title: new Text(
                                //snapshot.data.docs[index].id,
                                DetailSubject.getTitle(snapshot.data.docs[index].id.toString()),
                                style: new TextStyle(
                                    fontSize: 25,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: new Text(
                                  DetailSubject.getSubtitle(snapshot.data.docs[index].id.toString())
                              ),
                              trailing: Container(
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.brown[100]),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.orange,
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                default:
                  return new Text("default");
              }
            }));
  }
}
