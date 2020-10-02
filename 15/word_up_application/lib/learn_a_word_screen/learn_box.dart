import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/word.dart';

class LearnBox extends StatelessWidget {
  final Word word;
  LearnBox({this.word});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 340,
      height: 470,
      margin: EdgeInsets.only(top:15.0,left: 15, right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          new Container(
              width: 320,
              height: 450,
              margin: EdgeInsets.fromLTRB(10, 00, 10, 0),
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(word.type, style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,),
                        ),
                        Icon(Icons.star_border,
                          color: Colors.black, size: 35,),
                      ],),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(word.word, style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,),
                      ),
                    ],
                  ),
                  Container(
                    width: 180,
                    height: 30,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.only(left: 48),
                    decoration: BoxDecoration(
                      color: Colors.yellow[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(word.pronounUK,textAlign: TextAlign.center, style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,),
                        ),
                        Icon(Icons.volume_up,
                          color: Colors.grey[600],),
                      ],),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(word.definition,textAlign: TextAlign.center, style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,),
                    ),
                  ),

                  Container(
                    width: 350,
                    height: 80,
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text(word.example1,textAlign: TextAlign.left, style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,),
                        ),
                        Text(word.example2, style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 30,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(word.mean,textAlign: TextAlign.center, style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 250,
                    height: 120,
                   // child: Image(image: AssetImage(word.pathImage)),
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}
