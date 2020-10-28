import 'package:flutter/material.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/views/play_screen/pauseWhilePlaying.dart';
import 'dart:async';
import 'end_quiz.dart';

bool _checkChoose;
int _currentQs;
int _totalQs;
int _correctChoose;
Future<List<Questional>> quest;

class QuizPage extends StatefulWidget {
  QuizPage({@required this.quizID, this.totalQs});

  final String quizID;
  final int totalQs;
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    quest = API_Manager().fetchQuestionByQuiz(widget.quizID);
    _totalQs = widget.totalQs;
    _currentQs = 0;
    _correctChoose = 0;
    _correctChoose = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return QuizGame();
  }
}

class QuizGame extends StatefulWidget {
  QuizGame({this.totalQs});
  final int totalQs;
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
        child: FutureBuilder<List<Questional>>(
            future: quest,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Questional> questions = snapshot.data ?? [];
                Questional question = questions[_currentQs];
                return Column(
                  children: [
                    Pause(
                      currentQs: _currentQs + 1,
                      totalQs: _totalQs,
                    ),
                    Question(
                      size: size,
                      question: question.question,
                      imagePath: "assets/images/solar.png",
                    ),
                    ListChoices(
                      size: size,
                      question: question,
                      qsCount: _totalQs,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      alignment: Alignment.topLeft,
                      child: Image.asset("assets/icons/music.png"),
                    )
                  ],
                );
              } else if (snapshot.hasError)
                return Text("${snapshot.error}");
              else
                return CircularProgressIndicator();
            }),
      ),
    );
  }
}

class ListChoices extends StatefulWidget {
  const ListChoices({Key key, @required this.size, this.question, this.qsCount})
      : super(key: key);

  final Size size;
  final Questional question;
  final int qsCount;

  @override
  _ListChoicesState createState() => _ListChoicesState();
}

class _ListChoicesState extends State<ListChoices> {
  var _isCorrect;
  var _isChoose;

  @override
  void initState() {
    _isCorrect = [false, false, false, false];
    _isChoose = [false, false, false, false];
    _isCorrect[widget.question.answer - 1] = true;
    super.initState();
    print("Tong cau hoi" + _totalQs.toString());
  }

  @override
  void dispose() {
    super.dispose();
  }

  void nextQs() {
    if (_currentQs < widget.qsCount - 1) {
      setState(() {
        Timer(Duration(seconds: 1), () {
          _currentQs++;
          print("Cau hoi hien tai" + _currentQs.toString());
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => QuizGame()));
        });
      });
    } else {
      setState(() {
        Timer(Duration(seconds: 1), () {
          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (context) => EndQuiz(
                        correctAns: _correctChoose,
                        incorrectAns: _totalQs - _correctChoose,
                      )));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isChoose[0] = true;
              _checkChoose = true;
              nextQs();
            });
          },
          child: Choice(
            size: widget.size,
            choice: widget.question.choice1,
            color: Colors.blue,
            isCorrect: _isCorrect[0],
            isChoose: _isChoose[0],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isChoose[1] = true;
              _checkChoose = true;
              nextQs();
            });
          },
          child: Choice(
            size: widget.size,
            choice: widget.question.choice2,
            color: Colors.green,
            isCorrect: _isCorrect[1],
            isChoose: _isChoose[1],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isChoose[2] = true;
              _checkChoose = true;
              nextQs();
            });
          },
          child: Choice(
            size: widget.size,
            choice: widget.question.choice3,
            color: Colors.teal,
            isCorrect: _isCorrect[2],
            isChoose: _isChoose[2],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isChoose[3] = true;
              _checkChoose = true;
              nextQs();
            });
          },
          child: Choice(
            size: widget.size,
            choice: widget.question.choice4,
            color: Colors.pink,
            isCorrect: _isCorrect[3],
            isChoose: _isChoose[3],
          ),
        ),
      ],
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
        _correctChoose++;
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
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
              constraints: BoxConstraints(
                  maxWidth: size.width * 2 / 3, maxHeight: size.height * 4),
              child: Image(image: AssetImage(imagePath))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Text(
              question,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class Pause extends StatelessWidget {
  const Pause({Key key, @required this.currentQs, @required this.totalQs})
      : super(key: key);

  final int currentQs;
  final int totalQs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PauseWhilePlaying(
                            questionsRemaining: currentQs,
                            totalQuestions: totalQs,
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
