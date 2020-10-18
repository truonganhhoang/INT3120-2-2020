import 'package:flutter/material.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/models/models.dart';

class QuizGame extends StatefulWidget {
  QuizGame({@required this.quizID, this.totalQs});

  final String quizID;
  final int totalQs;
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
    print(widget.quizID);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        color: Colors.black,
        child: FutureBuilder<List<Questional>>(
            future: _questional,
            builder: (context, snapshot) {
              print("questions.length");
              if (snapshot.hasData) {
                List<Questional> questions = snapshot.data ?? [];
                print(questions.length);
                Questional question = questions[_currentQs];
                return Column(
                  children: [
                    Pause(currentQs: _currentQs + 1, totalQs: widget.totalQs,),
                    Question(
                      size: size,
                      question: question.question,
                      imagePath: "assets/images/solar.png",
                    ),
                    ListChoices(
                      size: size,
                      question: question,
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
  const ListChoices({Key key, @required this.size, this.question})
      : super(key: key);

  final Size size;
  final Questional question;

  @override
  _ListChoicesState createState() => _ListChoicesState();
}

class _ListChoicesState extends State<ListChoices> {
  var status;

  void check(int chooseAns) {
    if (chooseAns == widget.question.answer) {
    } else {}
  }

  @override
  void initState() {
    status = [0, 0, 0, 0];
    status[widget.question.answer] = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            status[1]--;
            status[2]--;
            status[3]--;
          },
          child: Choice(
            size: widget.size,
            choice: widget.question.choice1,
            color: Colors.blue,
            status: status[0],
          ),
        ),
        GestureDetector(
          onTap: () {
            status[0]--;
            status[2]--;
            status[3]--;
          },
          child: Choice(
            size: widget.size,
            choice: widget.question.choice2,
            color: Colors.green,
            status: status[1],
          ),
        ),
        GestureDetector(
          onTap: () {
            status[0]--;
            status[1]--;
            status[3]--;
          },
          child: Choice(
            size: widget.size,
            choice: widget.question.choice3,
            color: Colors.teal,
            status: status[2],
          ),
        ),
        GestureDetector(
          onTap: () {
            status[0]--;
            status[1]--;
            status[2]--;
          },
          child: Choice(
            size: widget.size,
            choice: widget.question.choice4,
            color: Colors.pink,
            status: status[3],
          ),
        ),
      ],
    );
  }
}

class Choice extends StatefulWidget {
  const Choice(
      {Key key,
      @required this.size,
      @required this.choice,
      @required this.color,
      this.status})
      : super(key: key);

  final Size size;
  final String choice;
  final Color color;
  final int status;

  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  bool _visible;

  @override
  void initState() {
    _visible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Container(
          height: widget.size.height * 0.09,
          width: widget.size.width,
          decoration: BoxDecoration(
              color: widget.color, borderRadius: BorderRadius.circular(5)),
          alignment: Alignment.center,
          child: Text(
            widget.choice,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
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
