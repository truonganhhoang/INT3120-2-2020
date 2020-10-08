import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SELECT YOUR LEVEL",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 50),
            Card(
              color: Color(0xff5ca4a7),
              elevation: 5.0,
              child: Container(
                width: 300,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Text("BEGINNER 1",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Card(
              color: Color(0xff5ca4a7),
              elevation: 5.0,
              child: Container(
                width: 300,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Text("BEGINNER 2",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Card(
              color: Color(0xff5ca4a7),
              elevation: 5.0,
              child: Container(
                width: 300,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Text("PRE-INTERMEDIATE 1",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Card(
              color: Color(0xff5ca4a7),
              elevation: 5.0,
              child: Container(
                width: 300,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Text("PRE-INTERMEDIATE 1",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

