import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math';
import 'alert_play.dart';

class QuizCard extends StatelessWidget {
  const QuizCard(
      {Key key,
      @required this.size,
      this.title,
      this.questionCount,
      this.imagePath,
      this.percent})
      : super(key: key);

  final Size size;
  final String title;
  final int questionCount;
  final String imagePath;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => PopUp(
                  title: title,
                  questionCount: questionCount,
                  imagePath: "assets/images/solar.png",
                  size: size,
                ));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                  color: Colors.black.withOpacity(0.25))
            ]),
        width: size.width * 0.45,
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              ClipPath(
                child: Container(
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imagePath), fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                ),
              ),
              Positioned(
                top: 80,
                left: 5,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Text(
                    questionCount.toString() + " Qs",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                  top: 100,
                  left: 5,
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )),
              if (percent != null && percent > 0.0)
                Padding(
                  padding: const EdgeInsets.only(top: 140, left: 5, right: 5),
                  child: ClipRRect(
                    child: LinearPercentIndicator(
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2500,
                      percent: percent,
                      center: Text("${(percent * 100).round()}% accuracy"),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.redAccent,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
