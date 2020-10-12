import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Auth.dart';
import 'LoginPage.dart';

class homePage extends StatefulWidget {
  String userName = "name";

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          new SliverList(
            delegate: new SliverChildListDelegate(
              [
                new Header(width: width,height: height,)
              ]
            ),
          ),
          new SliverPadding(
            padding: EdgeInsets.fromLTRB(10,30,10,0),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget>[
                new GestureDetector(
                  onTap: (){print("hoc");},
                    child: new Container(
                          decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: new Column(
                          children: [
                            new Expanded(
                              flex: 6,
                              child: new Container(
                                margin: EdgeInsets.fromLTRB(7,7,7,0),
                                child: new Image.asset(
                                    //"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTBIqev_ymdML-Nns1AnHy2VR08j9To4vJlQ&usqp=CAU",
                                  "assets/tile000.png",
                                  fit: BoxFit.fitHeight
                                ),
                              ),
                            ),
                            new Expanded(
                              flex: 4,
                              child: new Container(
                                margin: EdgeInsets.fromLTRB(7,0,7,7),
                                child: Center(
                                  child: new Text(
                                      "Tự nhiên và xã hội",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        height: 1
                                      ),
                                  ),
                                ),
                              ),
                            )
                          ],
                      ),
                    ),
                ),
                Container(
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
                          child: new Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTBIqev_ymdML-Nns1AnHy2VR08j9To4vJlQ&usqp=CAU",
                          ),
                        ),
                      ),
                      new Expanded(
                        flex: 4,
                        child: new Container(
                          margin: EdgeInsets.fromLTRB(7,0,7,7),
                          child: Center(
                            child: new Text(
                              "Tự nhiên và xã hội",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  height: 1
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
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
                          child: new Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTBIqev_ymdML-Nns1AnHy2VR08j9To4vJlQ&usqp=CAU",
                          ),
                        ),
                      ),
                      new Expanded(
                        flex: 4,
                        child: new Container(
                          margin: EdgeInsets.fromLTRB(7,0,7,7),
                          child: Center(
                            child: new Text(
                              "Tự nhiên và xã hội",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  height: 1
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
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
                          child: new Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTBIqev_ymdML-Nns1AnHy2VR08j9To4vJlQ&usqp=CAU",
                          ),
                        ),
                      ),
                      new Expanded(
                        flex: 4,
                        child: new Container(
                          margin: EdgeInsets.fromLTRB(7,0,7,7),
                          child: Center(
                            child: new Text(
                              "Tự nhiên và xã hội",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  height: 1
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      )
    );
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
