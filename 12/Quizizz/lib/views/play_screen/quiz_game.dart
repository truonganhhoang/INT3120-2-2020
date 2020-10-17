import 'package:flutter/material.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/models/models.dart';

class QuizGame extends StatefulWidget {
  QuizGame({this.quizID});

  final String quizID;
  @override
  _QuizGameState createState() => _QuizGameState();
}

class _QuizGameState extends State<QuizGame> {
  Future<List<Questional>> _questional;
  int _currentQs;

  @override
  void initState() {
    _questional = API_Manager().fetchQuestionByQuiz(widget.quizID);
    _currentQs = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        color: Colors.black,
        child: Column(
          children: [
            Pause(),
            Question(
              size: size,
              question: "What is the largest planet in solar system?",
              imagePath: "assets/images/solar.png",
            ),
            ListChoices(size: size),
            Container(
              padding: EdgeInsets.only(left: 20, top: 10),
              alignment: Alignment.topLeft,
              child: Image.asset("assets/icons/music.png"),
            )
          ],
        ),
      ),
    );
  }
}

class ListChoices extends StatelessWidget {
  const ListChoices({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Choice(
          size: size,
          choice: "Sun",
          color: Colors.blue,
        ),
        Choice(
          size: size,
          choice: "Earth",
          color: Colors.green,
        ),
        Choice(
          size: size,
          choice: "Venus",
          color: Colors.teal,
        ),
        Choice(
          size: size,
          choice: "Jupiter",
          color: Colors.pink,
        ),
      ],
    );
  }
}

class Choice extends StatelessWidget {
  const Choice(
      {Key key, @required this.size, @required this.choice, this.color})
      : super(key: key);

  final Size size;
  final String choice;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        height: size.height * 0.09,
        width: size.width,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
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
  const Pause({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: Row(
        children: [
          Image(
            image: AssetImage("assets/icons/pause.png"),
          ),
          Container(
            margin: EdgeInsets.only(top: 8, left: 10),
            width: 51,
            height: 26,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Text(
              "1/20",
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
