import 'package:bucha_app/widgets/Grammar/GrammarGame/Answer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bucha_app/Database.dart';

class GrammarGamePage extends StatefulWidget{
  @override
  _GrammarGamePageState createState() => _GrammarGamePageState();
}

class _GrammarGamePageState extends State<GrammarGamePage> {

  List<String> questions = [];

  void _getQuestionList() {
    try {
      database.collection('Grammar_question').get().then((QuerySnapshot snapshot) => {
        snapshot.docs.forEach((document) => {
          questions.add(document.get('name'))
        })
      });
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Widget _buildAnswerList(String question) {
    List<Answer> answers = new List<Answer>();
    database.collection('Grammar_question').where('name', isEqualTo: question).get().then((snapshot) => {
      snapshot.docs.forEach((document) => {
        for (var answer in document.data()['answer']) {
          answers.add(new Answer(
            name: answer['name'],
            isTrue: answer['isTrue'],
            isChosen: false,
          )),
        }
      })
    });
    return Column(
      children: answers
    );
  }

  @override
  void initState() {
    _getQuestionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: queryData.size.width,
        height: queryData.size.height,
        child: Column(
          children: <Widget>[
            new Container(
              width: queryData.size.width,
              height: queryData.size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background.jpg"),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            new Container(
              width: queryData.size.width,
              height: queryData.size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(7.0),
                    height: queryData.size.height * 0.28 - 7.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.brown[900],
                          Colors.brown[300]
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(7.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Center(
                        child: Text(
                          '____ umbrella',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: queryData.size.height * 0.42 - 21.0,
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
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(7.0),
                      decoration: BoxDecoration(
                        color: Colors.brown[900],
                      ),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Answer(
                              name: 'a',
                              isTrue: false,
                              isChosen: false,
                            ),
                            Padding(padding: EdgeInsets.only(top: 10.0),),
                            Answer(
                              name: 'an',
                              isTrue: true,
                              isChosen: false,
                            )
                          ],
                        ),
                      ),
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}