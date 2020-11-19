import 'package:flutter/material.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/views/components/appbar.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/views/components/quiz_card.dart';

class AllQuiz extends StatelessWidget {
  AllQuiz({@required this.topic});
  final Topic topic;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(namePage: "Home", height: size.height),
      body: ListAllQuiz(
        topic: topic,
        size: size,
      ),
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
  var _init = true;
  var _isLoading = false;
  List<Quiz> quizzes;
  @override
  void initState() {
    super.initState();
    if (_init) {
      setState(() {
        _isLoading = true;
      });
    }
    API_Manager()
        .fetchQuizByTopic(widget.topic.key)
        .then((value) => quizzes = value)
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemCount: quizzes.length,
                itemBuilder: (context, index) => QuizCard(
                      size: widget.size,
                      imagePath: "assets/images/solar.png",
                      quiz: quizzes[index],
                    )));
  }
}
