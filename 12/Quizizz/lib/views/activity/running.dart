import 'package:flutter/material.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/views/components/quiz_card.dart';
import 'package:quiztest/services/user.dart';

class Running extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListRunning(size: size);
  }
}

class ListRunning extends StatefulWidget {
  const ListRunning({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _ListRunningState createState() => _ListRunningState();
}

class _ListRunningState extends State<ListRunning> {
  List<SaveGame> games = List<SaveGame>();
  List<Quiz> quizzes = List<Quiz>();
  var _init = true;
  var _isLoadingQuiz = false;

  @override
  void initState() {
    if (_init) {
      setState(() {
        _isLoadingQuiz = true;
      });
      UserSave().getUserID().then((userID) async {
        await API_Manager().fetchSaveGame(userID).then((value) async {
          games = value;
          int i = 0;
          for (int tmp = 0; tmp < games.length; tmp++) {
            await API_Manager()
                .fetchQuizByID(games[tmp].quizID)
                .then((quiz) {
                  quizzes.add(quiz);
                })
                .then((_) => i++)
                .then((_) {
                  if (i == games.length) {
                    setState(() {
                      _isLoadingQuiz = false;
                    });
                  }
                });
          }
        });
      });
    }
    _init = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: _isLoadingQuiz
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemCount: quizzes.length,
                itemBuilder: (context, index) => QuizCard(
                    size: widget.size,
                    quiz: quizzes[index],
                    percent: num.parse((games[index].listAns.length /
                            quizzes[index].numberOfQuestion)
                        .toStringAsFixed(2)),
                    saveGameID: games[index].key,
                    ans: games[index].listAns.cast<int>())));
  }
}
