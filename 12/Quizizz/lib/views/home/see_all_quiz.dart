import 'package:flutter/material.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/views/components/appbar.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/views/components/quiz_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllQuiz extends StatelessWidget {
  AllQuiz({@required this.topic});
  final Topic topic;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(namePage: "Home", height: size.height),
      body: ListAllQuiz(topic: topic, size: size,),
    );
  }
}

class ListAllQuiz extends StatefulWidget {
  ListAllQuiz({@required this.topic, this.size});
  final Topic topic;
  final Size size;

  @override
  _ListAllQuizState createState() => _ListAllQuizState();
}

class _ListAllQuizState extends State<ListAllQuiz> {
  Future<List<Quiz>> _quizzes;
  @override
  void initState() {
    _quizzes = API_Manager().fetchQuizByTopic(widget.topic.key);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                      imagePath: "assets/images/solar.png",
                      quiz: quizzes[index],
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
