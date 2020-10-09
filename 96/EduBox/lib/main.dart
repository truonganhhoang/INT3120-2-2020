import 'package:flutter/material.dart';

import 'package/widget.dart';

Color _color = Color(0xff00854c);

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
        primaryColor: Color(0xff00854c),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeInterface(),
    );
  }
}






