import 'package:flutter/material.dart';

import 'lesson1.dart';
import 'lesson2.dart';

class Levels extends StatefulWidget {
  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 2,
            title: Row(children: <Widget>[
              Image.asset('assets/images/america.png', height: 25),
              SizedBox(
                width: 35,
              ),
              appBarItem('assets/images/crown.png', '0', Colors.grey),
              SizedBox(
                width: 35,
              ),
              appBarItem('assets/images/streak.png', '0', Colors.grey),
              SizedBox(
                width: 30,
              ),
              Image.asset('assets/images/heart.png', height: 30),
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: <Widget>[
              //     Image.asset('assets/images/crown.png', height: 30),
              //     Text('12'),
              //   ],
              // )
            ])),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(
        //     Icons.directions_bike,
        //     color: Colors.blue[300],
        //     size: 30,
        //   ),
        //   backgroundColor: Colors.white,
        //   onPressed: () {},
        // ),
        body: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                lesson(
                  'assets/images/easter-egg.png',
                  'Cơ bản 1',
                  Colors.purple,
                ),
                SizedBox(
                  height: 20,
                ),
                twoLesson(
                    lesson('assets/images/easter-egg-blocked.png', 'Cơ bản 2',
                        Colors.grey[400]),
                    lesson('assets/images/easter-egg-blocked.png', 'Cơ bản 3',
                        Colors.grey[400])),
                SizedBox(
                  height: 20,
                ),
                lesson('assets/images/easter-egg-blocked.png', 'Cơ bản 4',
                    Colors.grey[400]),
                SizedBox(
                  height: 20,
                ),
                twoLesson(
                    lesson('assets/images/easter-egg-blocked.png', 'Cơ bản 5',
                        Colors.grey[400]),
                    lesson('assets/images/easter-egg-blocked.png', 'Cơ bản 6',
                        Colors.grey[400])),
                SizedBox(
                  height: 20,
                ),
                lesson('assets/images/easter-egg-blocked.png', 'Về đích',
                    Colors.grey[400]),
                SizedBox(
                  height: 20,
                ),
                // Divider(
                //   thickness: 2,
                // )
              ],
            )
          ],
        ));
  }

  // func return the app bar item for saving time and make code organized and short
  Widget appBarItem(String image, String num, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(image, height: 30),
        Text(
          num,
          style: TextStyle(color: color, fontSize: 16),
        ),
      ],
    );
  }

  Widget lesson(String image, String title, Color color) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              // EDIT: lesson1 -> lesson1
              context,
              MaterialPageRoute(builder: (context) => Lesson1()));
        },
        child: Column(
          children: <Widget>[
            // biểu tượng bài học đầu
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // Transform.rotate(
                //   angle: 0,
                //   child: CircularProgressIndicator(
                //     backgroundColor: Colors.grey[300],
                //     valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[600]),
                //     value: .2,
                //     strokeWidth: 45,
                //   ),
                // ),
                CircleAvatar(
                  backgroundColor: Colors.grey[350],
                  radius: 40,
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 35,
                ),
                CircleAvatar(
                  child: Image.asset(
                    image,
                    height: 50,
                  ),
                  radius: 30,
                  backgroundColor: color,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
          ],
        ));
  }

  Widget twoLesson(Widget lesson1, Widget lesson2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        lesson1,
        SizedBox(
          width: 30,
        ),
        lesson2
      ],
    );
  }
}
