import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'API.dart';
import 'Auth.dart';
import 'package:intl/intl.dart';
import 'SubjectContent.dart';
class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String concatTitle(String nameSubject, String grade, String titleContent){
    //return auth.currentUser.uid;
    return nameSubject.trim()+" - "+"Lớp "+grade.substring(grade.indexOf('e')+1) +" - "+titleContent.trim();
  }
  String dateConvert(Timestamp date){
    DateFormat formatter = DateFormat('EEEE dd/MM/yyyy - kk:mm');
    String formatted = formatter.format(date.toDate());
    return formatted;
  }
  List sortData(AsyncSnapshot<dynamic> snapshot){
    List list = snapshot.data.docs;
    list.sort((a,b){
      return -a["createAt"].compareTo(b["createAt"]);
    });
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Lịch sử học"),centerTitle: true,),
      body: new FutureBuilder(
        future: API.getHistory(auth.currentUser.uid),
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
                        onTap: (){
                          List l = sortData(snapshot);
                          API.getContent(l[index]["grade"], l[index]["nameSubject"], l[index]["titleContent"])
                              .then((value) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>new SubjectContent(
                                header: l[index]["titleContent"],
                                content: value["content"],
                              )
                            ));
                          });
                        },
                        leading: Icon(Icons.history,size: 30,),
                        title: new Text(
                          this.concatTitle(sortData(snapshot)[index]["translatedNameSubject"], sortData(snapshot)[index]["grade"], sortData(snapshot)[index]["titleContent"]),
                          style: new TextStyle(
                              fontSize: 15,
                              color: Colors.orange,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        subtitle: new Text(
                            this.dateConvert(sortData(snapshot)[index]["createAt"])
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
