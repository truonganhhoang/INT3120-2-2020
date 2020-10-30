import 'package:EduBox/LandingPage.dart';
import 'package:EduBox/NewPost/NewPostTemplate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Empty.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>SubmitForm())
      ],
      child: MaterialApp(
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
        home: LandingPage(),
        //Empty(),
      ),
    );
  }
}
