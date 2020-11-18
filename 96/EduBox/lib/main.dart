import 'package:EduBox/LandingPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Models/NewPostTemplate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var prefs = await SharedPreferences.getInstance();
  runApp(MyApp(data: prefs));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final SharedPreferences data;

  const MyApp({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Color> color = [
      Colors.pink,
      Colors.blue[600],
      Colors.green[600],
      Colors.purple[400]
    ];
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SubmitForm()),
      ],
      child:MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WaitingWisdom',
          theme: ThemeData(
            textTheme: TextTheme(
              headline1: TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            primaryColor: color[data.getInt('backgroundColor')??2],//Color(0xff00854c),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LandingPage(background:data.getInt('backgroundColor')),
        ),
      );
  }
}
