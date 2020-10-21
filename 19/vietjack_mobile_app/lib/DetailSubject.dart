import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'API.dart';

class DetailSubject extends StatefulWidget {
  @override
  _DetailSubjectState createState() => _DetailSubjectState();
  String grade;
  String nameSubject;
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
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>new Text(snapshot.data.docs[index]["content"])));
                              },
                              leading: Icon(
                                Icons.ac_unit,
                                size: 30,
                              ),
                              title: new Text(
                                snapshot.data.docs[index].id,
                                style: new TextStyle(
                                    fontSize: 30,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w600),
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
