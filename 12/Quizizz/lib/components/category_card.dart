import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category(
      {Key key,
      @required this.size,
      this.title,
      this.questionCount,
      this.imagePath,
      this.press})
      : super(key: key);

  final Size size;
  final String title;
  final int questionCount;
  final String imagePath;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.all(10),
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
        width: size.width * 0.4,
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              ClipPath(
                child: Container(
                  height: size.height * 0.14,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imagePath), fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                ),
              ),
              Positioned(
                top: 90,
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
                  top: 120,
                  left: 10,
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
