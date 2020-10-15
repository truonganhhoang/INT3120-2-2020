import 'package:flutter/material.dart';
import 'category_card.dart';
import 'alert_play.dart';

const List<Map> quizs = [
  {
    "imagePath": "solar",
    "title": "Solar system",
    "questionCount": 19,
    "percent": 0.5
  },
  {
    "imagePath": "solar",
    "title": "Solar system",
    "questionCount": 19,
    "percent": 0.5
  },
  {
    "imagePath": "solar",
    "title": "Solar system",
    "questionCount": 17,
    "percent": 0.0
  },
  {
    "imagePath": "solar",
    "title": "Solar system",
    "questionCount": 17,
    "percent": 0.0
  },
  {
    "imagePath": "solar",
    "title": "Solar system",
    "questionCount": 16,
    "percent": 0.0
  }
];

class Categories extends StatelessWidget {
  const Categories({Key key, @required this.size, this.titleTopic})
      : super(key: key);

  final Size size;
  final String titleTopic;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          TitleTopic(
            title: titleTopic,
            press: () {},
          ),
          ListCategory(size: size),
        ],
      ),
    );
  }
}

class ListCategory extends StatelessWidget {
  const ListCategory({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.5,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: quizs.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Category(
            size: size,
            imagePath: "assets/images/${quizs[index]['imagePath']}.png",
            title: quizs[index]['title'],
            questionCount: quizs[index]['questionCount'],
            percent: quizs[index]['percent'],
          );
        },
      ),
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
