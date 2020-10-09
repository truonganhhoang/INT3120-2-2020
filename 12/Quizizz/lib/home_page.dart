import 'package:flutter/material.dart';
import 'package:quiztest/components/categories.dart';
import 'components/appbar.dart';
import 'components/category_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        namePage: "Home",
        height: size.height,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EnterCode(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Categories(
                    titleTopic: "Science",
                    size: size,
                  ),
                  Categories(
                    titleTopic: "Science",
                    size: size,
                  ),
                  Categories(
                    titleTopic: "Science",
                    size: size,
                  ),
                  Categories(
                    titleTopic: "Science",
                    size: size,
                  ),
                  Categories(
                    titleTopic: "Science",
                    size: size,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EnterCode extends StatelessWidget {
  const EnterCode({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 90,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 0))
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Column(children: [
          Container(
            height: 30,
            margin: EdgeInsets.only(bottom: 10),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5, left: 20),
                  hintText: "Enter a gane code",
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(209, 209, 209, 1)),
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          Container(
            height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromRGBO(146, 61, 199, 1),
                borderRadius: BorderRadius.circular(5)),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Join a game",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
