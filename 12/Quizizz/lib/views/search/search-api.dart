import 'package:flutter/cupertino.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/views/components/quiz_card.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    Key key,
    @required this.size,
    this.quizzes,
  }) : super(key: key);

  final Size size;
  final List<Quiz> quizzes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
          itemCount: quizzes.length,
          itemBuilder: (context, index) => QuizCard(
                size: size,
                imagePath: "assets/images/solar.png",
                quiz: quizzes[index],
              )),
    );
  }
}
