import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:word_up_application/home/home_screen.dart';
import 'package:word_up_application/introduction_screen/ask_age_screen.dart';
import 'package:word_up_application/introduction_screen/choose_accent_screen.dart';
import 'package:word_up_application/selection_screen/selection_screen.dart';
import 'package:word_up_application/services/authentication_screen.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/study_home_screen/test_question_screen.dart';

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
                child: Image.asset(
                  'assets/sprites/Evocab_Intro.png',
                  width: 300,
                  height: 300,
                ),
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
                      child: AuthenticationScreen(
                        noGuest: true,
                      )));
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
      body: Card(
        child: SafeArea(
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
                        child: Text(
                          'In your opinion, what is your level?',
                          style: TextStyle(
                            fontSize: 2 * SizeConfig.heightMultiplier,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    moveToNextScreen(context);
                  },
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
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    moveToNextScreen(context);
                  },
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
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    moveToNextScreen(context);
                  },
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
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    moveToNextScreen(context);
                  },
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
      ),
    );
  }

  void moveToNextScreen(BuildContext context) {
    Navigator.of(context).push(PageTransition(
        type: PageTransitionType.slideLeft, child: ChooseAccentScreen()));
  }
}

class AskForTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text('Assessment test', style: TextStyle(
                  color: Colors.red,
                  fontSize: 3 * SizeConfig.heightMultiplier,
                  fontWeight: FontWeight.bold
                ),),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Answer 15 specific words, and I will estimate your total vocabulary size!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 2 * SizeConfig.heightMultiplier,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Image.asset(
                'assets/sprites/assessment.png',
                width: 300,
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                onPressed: () {
                //  Navigator.push(context, MaterialPageRoute(
                  //  builder: (context) => SelectionScreen(),
                 // ),);
                  Navigator.of(context).pushAndRemoveUntil(PageTransition(
                      type: PageTransitionType.fadeIn, child: SelectionScreen()), (route) => false);

                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Begin the test',
                    style: TextStyle(color: Colors.white,
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.transparent,
                child: Text(
                  'Skip',
                  style: TextStyle(
                      color: Colors.grey,
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
