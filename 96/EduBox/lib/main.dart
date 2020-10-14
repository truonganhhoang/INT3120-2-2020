import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package/widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduBox',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.red,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        primaryColor: Color(0xff00854c),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeInterface(),
      //Empty(),
    );
  }
}
