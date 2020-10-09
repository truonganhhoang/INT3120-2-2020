import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_kanji/word-choose.dart';

class LevelCard extends StatelessWidget {
  final String level;
  LevelCard(this.level);
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color(0xff5ca4a7),
        elevation: 5.0,
        child: InkWell(
          onTap: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => WordChoose()))
          },
          child: Container(
            width: 300,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                Text(level,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ));
  }
}
