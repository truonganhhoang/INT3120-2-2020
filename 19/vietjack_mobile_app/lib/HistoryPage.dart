import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'API.dart';
import 'Auth.dart';
class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String concatTitle(String nameSubject, String grade, String titleContent){
    return nameSubject.trim()+" - "+"Lớp "+grade.substring(grade.indexOf('Grade'))+" - "+titleContent.trim();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Lịch sử học"),centerTitle: true,),
      body: new FutureBuilder(
        future: API.getHistory(auth.currentUser.uid.toString()),
        builder: (context,snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return new Text("No connection");
            case ConnectionState.active:
            case ConnectionState.waiting:
              return new Text("Loading ...");
            case ConnectionState.done:
            return new SafeArea(
              child: new ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context,index){
                  return new Container(
                    color: (index % 2 == 0) ? Colors.white : Colors.brown[50],
                    height: 80,
                    child: new Center(
                      child: new ListTile(
                        leading: Icon(Icons.history,size: 30,),
                        title: new Text(
                          this.concatTitle(snapshot.data.docs[index]["nameSubject"], snapshot.data.docs[index]["grade"], snapshot.data.docs[index]["titleContent"]),
                          style: new TextStyle(
                              fontSize: 25,
                              color: Colors.orange,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        subtitle: new Text(snapshot.data.docs[index]["createAt"].toString()),
                        trailing: Container(
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2, color: Colors.brown[100]),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.orange,
                            )
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
            default:
              return new Text("default");
          }
        },
      ),
    );
  }
}
