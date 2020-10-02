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
                Text("Select Language",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
                SizedBox(height: 50),
                Card(
                  color: Colors.white.withOpacity(0.5),
                  elevation: 5.0,
                  child: Container(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/1200px-Flag_of_Vietnam.svg.png')),
                        SizedBox(width: 20),
                        Text("VIET NAM",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  color: Colors.white.withOpacity(0.5),
                  child: Container(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Flag_of_Great_Britain_%281707%E2%80%931800%29.svg/1200px-Flag_of_Great_Britain_%281707%E2%80%931800%29.svg.png')),
                        SizedBox(width: 20),
                        Text("ENGLISH",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
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
