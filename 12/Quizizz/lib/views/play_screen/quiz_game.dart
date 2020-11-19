import 'package:flutter/material.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/services/user.dart';
import 'package:quiztest/views/play_screen/pauseWhilePlaying.dart';
import 'dart:async';
import 'end_quiz.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_image/network.dart';

bool _checkChoose;
int _currentQs;
int _totalQs;
List<Questional> quest;
Topic _topic;
Quiz _quiz;
List<int> answer = new List<int>();
List<int> correctAns = new List<int>();
String _userID;
String _saveGameID;
var _isLoading = false;

class QuizPage extends StatefulWidget {
  QuizPage({this.quiz, this.topic, this.ans, this.saveGameID});

  final Quiz quiz;
  final Topic topic;
  final List<int> ans;
  final String saveGameID;
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var _init = true;

  @override
  void initState() {
    if (_init) {
      setState(() {
        _isLoading = true;
      });
      API_Manager()
          .fetchQuestionByQuiz(widget.quiz.key)
          .then((questional) => quest = questional)
          .then((_) {
        quest.forEach((element) {
          correctAns.add(element.answer);
        });
      }).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
    _totalQs = widget.quiz.numberOfQuestion;
    _currentQs = 0;
    _topic = widget.topic;
    _quiz = widget.quiz;
    if (widget.ans != null) {
      answer = widget.ans;
      _currentQs = widget.ans.length;
      _saveGameID = widget.saveGameID;
    }
    UserSave().getUserID().then((value) => _userID = value);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.ans != null) {
      widget.ans.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return QuizGame(
      quiz: widget.quiz,
    );
  }
}

class QuizGame extends StatefulWidget {
  QuizGame({
    this.totalQs,
    this.quiz,
  });
  final int totalQs;
  final Quiz quiz;
  @override
  _QuizGameState createState() => _QuizGameState();
}

class _QuizGameState extends State<QuizGame> {
  @override
  void initState() {
    _checkChoose = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
          color: Colors.black,
          child: _isLoading
              ? SpinKitHourGlass(color: Colors.white)
              : Column(
                  children: [
                    Pause(
                      key: const Key("pause"),
                      currentQs: _currentQs + 1,
                      totalQs: _totalQs,
                      quizID: widget.quiz.key,
                      answered: answer,
                      userID: _userID,
                    ),
                    Question(
                      size: size,
                      question: quest[_currentQs].question,
                      imagePath:
                          "https://storage.googleapis.com/quiz-010.appspot.com/" +
                              widget.quiz.key +
                              "-$_currentQs",
                    ),
                    ListChoices(
                      size: size,
                      question: quest[_currentQs],
                      quiz: widget.quiz,
                    )
                  ],
                )),
    );
  }
}

class ListChoices extends StatefulWidget {
  const ListChoices({Key key, @required this.size, this.question, this.quiz})
      : super(key: key);

  final Size size;
  final Questional question;
  final Quiz quiz;

  @override
  _ListChoicesState createState() => _ListChoicesState();
}

class _ListChoicesState extends State<ListChoices> {
  var _isCorrect;
  var _isChoose;
  var choices = [];
  var numberOfChoices = 0;
  List<Color> colors = [Colors.blue, Colors.green, Colors.teal, Colors.pink];

  @override
  void initState() {
    _isCorrect = [false, false, false, false];
    _isChoose = [false, false, false, false];
    _isCorrect[widget.question.answer - 1] = true;
    choices.add(widget.question.choice1);
    choices.add(widget.question.choice2);
    choices.add(widget.question.choice3);
    choices.add(widget.question.choice4);
    for (var i = 0; i < 4; i++) {
      if (choices[i] != " ") numberOfChoices++;
    }
    print(numberOfChoices);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void nextQs() {
    if (_currentQs < widget.quiz.numberOfQuestion - 1) {
      setState(() {
        Timer(Duration(seconds: 1), () {
          _currentQs++;
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => QuizGame(
                        quiz: _quiz,
                      )));
        });
      });
    } else {
      setState(() {
        Timer(Duration(seconds: 1), () {
          int correctCount = 0;
          for (int i = 0; i < correctAns.length; i++) {
            if (answer[i] == correctAns[i]) correctCount++;
          }
          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (context) => EndQuiz(
                        key: const Key("endQuiz"),
                        correctAns: correctCount,
                        incorrectAns: _totalQs - correctCount,
                        topic: _topic,
                        saveGameID: _saveGameID,
                        quizID: widget.quiz.key,
                      )));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: numberOfChoices,
      itemBuilder: (context, index) {
        if (choices[index] != "")
          return GestureDetector(
            key: const Key("Choice"),
            onTap: () {
              setState(() {
                _isChoose[index] = true;
                _checkChoose = true;
                answer.add(index);
                nextQs();
              });
            },
            child: Choice(
              size: widget.size,
              choice: choices[index],
              color: colors[index],
              isCorrect: _isCorrect[index],
              isChoose: _isChoose[index],
            ),
          );
      },
    );
  }
}

class Choice extends StatelessWidget {
  const Choice(
      {Key key,
      @required this.size,
      @required this.choice,
      @required this.color,
      @required this.isChoose,
      this.isCorrect})
      : super(key: key);

  final Size size;
  final String choice;
  final Color color;
  final bool isCorrect;
  final bool isChoose;
  Widget choice_quiz(bool _isCorrect, bool _isChoose) {
    if (!_checkChoose) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Container(
          height: size.height * 0.09,
          width: size.width,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
          alignment: Alignment.center,
          child: Text(
            choice,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      );
    } else {
      if (_isCorrect && _isChoose) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            height: size.height * 0.09,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white, width: 3)),
            alignment: Alignment.center,
            child: Text(
              choice,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        );
      }
      if (_isCorrect && !_isChoose) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            height: size.height * 0.09,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: Text(
              choice,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        );
      }
      if (!_isCorrect && !_isChoose) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            height: size.height * 0.09,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
          ),
        );
      }
      if (!_isCorrect && _isChoose) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            height: size.height * 0.09,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white, width: 3)),
            alignment: Alignment.center,
            child: Text(
              choice,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const Key("Choose");
    return choice_quiz(isCorrect, isChoose);
  }
}

class Question extends StatelessWidget {
  const Question(
      {Key key, @required this.size, @required this.question, this.imagePath})
      : super(key: key);

  final Size size;
  final String question;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.4,
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Image.network(imagePath) == null
              ? Container()
              : Container(
                  width: size.width * 0.8,
                  height: size.height * 0.2,
                  child: Image(
                    image: NetworkImageWithRetry(imagePath),
                    fit: BoxFit.cover,
                  )),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Center(
              child: Text(
                question,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Pause extends StatelessWidget {
  const Pause({
    Key key,
    @required this.currentQs,
    @required this.totalQs,
    this.answered,
    this.quizID,
    this.userID,
  }) : super(key: key);

  final int currentQs;
  final int totalQs;
  final List<int> answered;
  final String quizID;
  final String userID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: Row(
        children: [
          GestureDetector(
            key: const Key("pauseButton"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PauseWhilePlaying(
                        key: const Key("pauseScr"),
                            questionsRemaining: currentQs,
                            totalQuestions: totalQs,
                            answered: answered,
                            quizID: quizID,
                            userID: userID,
                            saveGameID: _saveGameID,
                          )));
            },
            child: Image(
              image: AssetImage("assets/icons/pause.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8, left: 10),
            width: 51,
            height: 26,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Text(
              currentQs.toString() + "/" + totalQs.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
