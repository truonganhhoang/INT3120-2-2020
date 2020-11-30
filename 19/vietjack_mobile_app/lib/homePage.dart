import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Auth.dart';
import 'LoginPage.dart';
import 'UserInfoPage.dart';
import 'API.dart';
import 'DetailSubject.dart';

class homePage extends StatefulWidget {
  String userName = "name";

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String userClass;
  Future<QuerySnapshot> getUserClassInfo() async {
    userClass = await API.getUser().then((value) {
      return "Grade" + value.docs[0]["UserClass"].toString();
    });
    QuerySnapshot userClassInfo = await FirebaseFirestore.instance
        .collection("Class_Subject")
        .doc(userClass)
        .collection("Info")
        .get();
    return userClassInfo;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Trang chủ"),
          centerTitle: true,
        ),
        body: CustomScrollView(
          key: new Key('customScrollView'),
          slivers: <Widget>[
            new SliverList(
              delegate: new SliverChildListDelegate([
                new Header(
                  width: width,
                  height: height,
                )
              ]),
            ),
            new FutureBuilder(
                future: this.getUserClassInfo(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return new SliverList(
                          delegate: new SliverChildListDelegate(
                              [new Text("No connection")]));
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return new SliverList(
                          delegate: new SliverChildListDelegate(
                              [new Text("Loading...")]));
                    case ConnectionState.done:
                      List<Widget> listSubject = [];
                      List data = snapshot.data.docs;
                      for(int i=0;i<data.length;i++) {
                        print(data[i]["nameSubject"]);
                        listSubject.add(
                          new GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return new DetailSubject(grade: this.userClass,nameSubject: data[i].id,translatedNameSubject: data[i]["nameSubject"],);
                              }));
                            },
                            child: new  Container(
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white
                              ),
                              child: new Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  new Expanded(
                                    flex: 6,
                                    child: new Container(
                                      margin: EdgeInsets.fromLTRB(7,7,7,0),
                                      child: new ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                          child: new Image.network(data[i]["linkUrl"]),
                                      ),
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 4,
                                    child: new Container(
                                      decoration: new BoxDecoration(
                                        color: Colors.white
                                      ),
                                      margin: EdgeInsets.fromLTRB(7,0,7,7),
                                      child: Center(
                                        child: new Text(
                                          data[i]["nameSubject"],
                                          textAlign: TextAlign.center,
                                          style: new TextStyle(
                                              fontSize: 15,
                                              //fontWeight: FontWeight.w700,
                                              height: 1
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                      }
                      Widget gridSubject = new SliverPadding(
                        key: new Key('grid view'),
                        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                        sliver: new SliverGrid.count(
                          crossAxisSpacing: 50,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                          children: listSubject,
                        ),
                      );
                      return gridSubject;
                    default:
                      return new SliverList(
                          delegate: new SliverChildListDelegate(
                              [new Text("default")]));
                  }
                }),
          ],
        ));
  }
}

void _onPressed() async {
  FirebaseFirestore.instance.collection("test").get().then((value) {
    value.docs.forEach((element) {
      print(element.data());
    });
  });
}

_onPressed1() async {
  print("asd");
}
