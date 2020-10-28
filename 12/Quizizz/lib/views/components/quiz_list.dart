import 'package:flutter/material.dart';
import 'quiz_card.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quiztest/views/home/see_all_quiz.dart';

class ListQuiz extends StatelessWidget {
  const ListQuiz({Key key, @required this.size, this.topic}) : super(key: key);

  final Size size;
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          TitleTopic(
            title: topic.name,
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllQuiz(topic: topic)));
            },
          ),
          ListCategory(
            size: size,
            topic: topic,
          ),
        ],
      ),
    );
  }
}

class ListCategory extends StatefulWidget {
  const ListCategory({Key key, @required this.size, @required this.topic})
      : super(key: key);

  final Size size;
  final Topic topic;

  @override
  _ListCategoryState createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  Future<List<Quiz>> _quizzes;

  @override
  void initState() {
    _quizzes = API_Manager().fetchQuizByTopic(widget.topic.key);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.width * 0.5,
      child: FutureBuilder(
          future: _quizzes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Quiz> quizzes = snapshot.data ?? [];
              return ListView.builder(
                shrinkWrap: true,
                itemCount: quizzes.length > 5 ? 5 : quizzes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Quiz quiz = quizzes[index];
                  return QuizCard(
                    size: widget.size,
                    imagePath: "assets/images/solar.png",
                    quiz: quiz,
                    topic: widget.topic,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else
              return SpinKitDualRing(
                color: Colors.blue,
              );
          }),
    );
  }
}

class TitleTopic extends StatelessWidget {
  const TitleTopic({Key key, this.title, this.press}) : super(key: key);
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 25,
            width: 80,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Color.fromRGBO(244, 233, 210, 1),
              onPressed: press,
              child: Text("See all"),
            ),
          )
        ],
      ),
    );
  }
}
