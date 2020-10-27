import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:word_up_application/introduction_screen/ask_age_screen.dart';
import 'package:word_up_application/introduction_screen/choose_accent_screen.dart';
import 'package:word_up_application/introduction_screen/login_screen.dart';
import 'package:word_up_application/size_config.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IntroductionScreenStage();
}

class _IntroductionScreenStage extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: _screenFirst(),
        backgroundColor: HexColor('#E7E8EA'),
      ),
    );
  }

  Widget _screenFirst() {
    return SafeArea(
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: Image.asset('assets/sprites/Evocab_Intro.png',
                width: 300, height: 300,),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                color: Colors.lightGreen,
                splashColor: Colors.white30,
                onPressed: () {
                  Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.slideLeft,
                      child: AskAgeScreen()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: 250,
                  child: Center(
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 2.5 * SizeConfig.heightMultiplier,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                color: Colors.blueGrey,
                splashColor: Colors.white30,
                onPressed: () {
                  Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.slideLeft,
                      child: LoginScreen()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: 250,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 2.5 * SizeConfig.heightMultiplier,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AskLevelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(
                        'Your level?',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 3 * SizeConfig.heightMultiplier),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Text('In your opinion, what is your level?',
                      style: TextStyle(
                        fontSize: 2 * SizeConfig.heightMultiplier,
                      ),),
                    )
                  ],
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
                color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 250,
                  child: Text(
                    'Native English speaker',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 2 * SizeConfig.heightMultiplier,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
                color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 250,
                  child: Text(
                    'Fluent',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 2 * SizeConfig.heightMultiplier,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
                color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 250,
                  child: Text(
                    'Intermediate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 2 * SizeConfig.heightMultiplier,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
                color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 250,
                  child: Text(
                    'Basic',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 2 * SizeConfig.heightMultiplier,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AskForTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('Assessment test'),
            Text(
                'Answer 15 specific words, and I will estimate your total vocabulary size!'),
            FlatButton(
              onPressed: () {},
              child: Text('Begin the test'),
            )
          ],
        ),
      ),
    );
  }
}
