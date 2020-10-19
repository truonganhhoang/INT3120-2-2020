import 'package:flutter/cupertino.dart';
import 'package:quiztest/views/components/quiz_card.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GridView.builder(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
          itemCount: 4,
          itemBuilder: (context, index) => QuizCard(
                size: size,
                title: "Solar system",
                questionCount: 19,
                imagePath: "assets/images/solar.png",
              )),
    );
  }
}
