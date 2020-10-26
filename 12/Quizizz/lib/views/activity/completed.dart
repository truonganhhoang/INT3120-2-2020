import 'package:flutter/material.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/views/components/quiz_card.dart';

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
  Future<List<Quiz>> _quizzes;

  @override
  void initState() {
    _quizzes = API_Manager().fetchQuizByTopic("2wZYm3a7hLcOyFnB0tEC");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: FutureBuilder(
        future: _quizzes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Quiz> quizzes = snapshot.data ?? [];
            return GridView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemCount: quizzes.length,
                itemBuilder: (context, index) => QuizCard(
                      size: widget.size,
                      title: quizzes[index].name,
                      questionCount: quizzes[index].numberOfQuestion,
                      imagePath: "assets/images/solar.png",
                      quizID: quizzes[index].key,
                      percent: 0.2 + index * 0.2,
                    ));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
