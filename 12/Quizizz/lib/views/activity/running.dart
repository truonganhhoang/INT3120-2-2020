import 'package:flutter/material.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/views/components/quiz_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  Future<List<Quiz>> _quizzes;

  @override
  void initState() {
    _quizzes = API_Manager().fetchQuizByTopic("2wZYm3a7hLcOyFnB0tEC");
    print("OK runn");
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
                      quiz: quizzes[index],
                      imagePath: "assets/images/solar.png",
                    ));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else
            return SpinKitDualRing(
              color: Colors.blue,
            );
        },
      ),
    );
  }
}
