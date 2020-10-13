import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Category extends StatelessWidget {
  const Category(
      {Key key,
      @required this.size,
      this.title,
      this.questionCount,
      this.imagePath,
      this.press,
      this.percent})
      : super(key: key);

  final Size size;
  final String title;
  final int questionCount;
  final String imagePath;
  final Function press;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
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
              if (percent != null)
                Padding(
                  padding: const EdgeInsets.only(top: 140, left: 5, right: 5),
                  child: ClipRRect(
                    child: LinearPercentIndicator(
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2500,
                      percent: percent,
                      center: Text("Accuracy"),
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
