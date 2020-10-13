import 'package:flutter/material.dart';
import 'package:quiztest/components/category_card.dart';

class Running extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListRunning(size: size);
  }
}

class ListRunning extends StatelessWidget {
  const ListRunning({
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
          itemBuilder: (context, index) => Category(
                size: size,
                title: "Solar system",
                questionCount: 19,
                imagePath: "assets/images/solar.png",
              )),
    );
  }
}
