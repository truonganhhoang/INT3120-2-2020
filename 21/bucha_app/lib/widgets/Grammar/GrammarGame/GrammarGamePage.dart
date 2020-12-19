import 'package:bucha_app/ButtonBack.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bucha_app/Database.dart';

import '../../../constants.dart';

class GrammarGamePage extends StatefulWidget {
  @override
  _GrammarGamePageState createState() => _GrammarGamePageState();
}

class _GrammarGamePageState extends State<GrammarGamePage> {
  var currentQuestion;

  @override
  void initState() {
    super.initState();
    currentQuestion = 0;
    Firebase.initializeApp();
  }

  // ignore: non_constant_identifier_names
  Widget Choice(String name, bool isTrue, bool isChosen, BuildContext context) {
    ColorSwatch colors =
        ColorSwatch(0xFFFFFFFF, {'gradient': Color(0xFF9E9E9E)});
    return Container(
      child: MaterialButton(
          onPressed: () {
            setState(() {
              if (isTrue) {
                final snackbar = SnackBar(
                  duration: Duration(microseconds: 500),
                  backgroundColor: Colors.green,
                  content: Text("Đúng !"),
                );
                Scaffold.of(context).showSnackBar(snackbar);
              } else {
                final snackbar = SnackBar(
                  duration: Duration(milliseconds: 500),
                  backgroundColor: Colors.red,
                  content: Text("Sai !"),
                );
                Scaffold.of(context).showSnackBar(snackbar);
              }
              currentQuestion++;
            });
          },
          child: Container(
            width: width(context) - 50.0,
            height: 40.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colors, colors['gradient']],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
          width: queryData.size.width,
          height: queryData.size.height,
          child: StreamBuilder(
            stream: database.collection('Grammar_question').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: Text(
                    'COMING SOON!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              return Builder(
                builder: (BuildContext context) => Container(
                  child: Column(
                    children: <Widget>[
                      new Expanded(
                        flex: 1,
                        child: Stack(
                          alignment: Alignment.topRight,
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage("assets/background.jpg"),
                                fit: BoxFit.cover,
                              )),
                            ),
                            Positioned(
                              top: 1,
                              left: 1,
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                margin:
                                    const EdgeInsets.only(top: 20, left: 20),
                                child: ButtonBack(),
                              ),
                            )
                          ],
                        ),
                      ),
                      new Expanded(
                        flex: 2,
                        child: Container(
                          width: width(context),
                          height: height(context),
                          decoration: BoxDecoration(
                            color: Colors.brown,
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: height(context) * 0.01,
                              ),
                              Container(
                                height: height(context) * 0.25,
                                margin: EdgeInsets.all(7.0),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.brown[900],
                                      Colors.brown[300]
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(7.0),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(
                                        snapshot.data.documents[currentQuestion]
                                            ['name'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height(context) * 0.01,
                              ),
                              Container(
                                  height: height(context) * 0.35,
                                  margin: EdgeInsets.all(7.0),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.brown[900],
                                        Colors.brown[300]
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(7.0),
                                    decoration: BoxDecoration(
                                      color: Colors.brown[900],
                                    ),
                                    child: Center(
                                      child: Column(
                                        children: <Widget>[
                                          Choice(
                                              snapshot.data.documents[
                                                      currentQuestion]['answer']
                                                  [0]['name'],
                                              snapshot.data.documents[
                                                      currentQuestion]['answer']
                                                  [0]['isTrue'],
                                              false,
                                              context),
                                          Choice(
                                              snapshot.data.documents[
                                                      currentQuestion]['answer']
                                                  [1]['name'],
                                              snapshot.data.documents[
                                                      currentQuestion]['answer']
                                                  [1]['isTrue'],
                                              false,
                                              context),
                                          Choice(
                                              snapshot.data.documents[
                                                      currentQuestion]['answer']
                                                  [2]['name'],
                                              snapshot.data.documents[
                                                      currentQuestion]['answer']
                                                  [2]['isTrue'],
                                              false,
                                              context),
                                          Choice(
                                              snapshot.data.documents[
                                                      currentQuestion]['answer']
                                                  [3]['name'],
                                              snapshot.data.documents[
                                                      currentQuestion]['answer']
                                                  [3]['isTrue'],
                                              false,
                                              context),
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
