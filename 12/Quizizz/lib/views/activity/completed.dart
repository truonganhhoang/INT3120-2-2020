import 'package:flutter/material.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/views/components/quiz_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quiztest/services/user.dart';

class Completed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListCompleted(size: size);
  }
}

class ListCompleted extends StatefulWidget {
  const ListCompleted({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _ListCompletedState createState() => _ListCompletedState();
}

class _ListCompletedState extends State<ListCompleted> {
  List<DoneQuiz> quizDones = List<DoneQuiz>();
  List<Quiz> quizzes = List<Quiz>();
  var _init = true;
  var _isLoadingQuiz = false;

  @override
  void initState() {
    if (_init) {
      setState(() {
        _isLoadingQuiz = true;
      });
      UserSave().getUserID().then((userID) {
        API_Manager().fetchDoneQuiz(userID).then((value) {
          quizDones = value;
          int i = 0;
          quizDones.forEach((game) async {
            await API_Manager()
                .fetchQuizByID(game.quizID)
                .then((quiz) => quizzes.add(quiz))
                .then((_) => i++)
                .then((_) {
              if (i == quizDones.length) {
                print(i);
                setState(() {
                  _isLoadingQuiz = false;
                });
              }
            });
            print(quizzes.length);
          });
        });
      });
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    return _isLoadingQuiz
        ? SpinKitDualRing(
            color: Colors.blue,
          )
        : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GridView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemCount: quizzes.length,
                itemBuilder: (context, index) => QuizCard(
                      size: widget.size,
                      imagePath: "assets/images/solar.png",
                      quiz: quizzes[index],
                      percent: 0.2 + index * 0.2,
                    )));
  }
}
