import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:word_up_application/introduction_screen/introduction_screen.dart';
import 'package:word_up_application/size_config.dart';

class AskAgeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AskAgeScreenStage();
}

class _AskAgeScreenStage extends State<AskAgeScreen> {
  bool isJunior;

  @override
  void initState() {
    // TODO: implement initState
    isJunior = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Your age?',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 3 * SizeConfig.heightMultiplier,
                        ),
                  ),
                ),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      setState(() {
                        isJunior = true;
                      });
                    },
                    color: (isJunior) ? Colors.cyan : Colors.white24,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: SizeConfig.screenWidth / 5 * 4,
                      child: Column(
                        children: [
                          Text(
                            'Junior',
                            style: TextStyle(color: (!isJunior) ? Colors.black : Colors.white,
                            fontSize: 3 * SizeConfig.heightMultiplier),
                          ),
                          SizedBox(height: 0.5 * SizeConfig.heightMultiplier,),
                          Text(
                            'Suitable for children under 16',
                            style: TextStyle(color: (!isJunior) ? Colors.black : HexColor('#FFF8F8'),
                              fontWeight: FontWeight.w400,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                //  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      setState(() {
                        isJunior = false;
                      });
                    },
                    color: (!isJunior) ? Colors.cyan : Colors.white,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: SizeConfig.screenWidth / 5 * 4,
                      child: Column(
                        children: [
                          Text(
                            'Adult',
                            style: TextStyle(color: (isJunior) ? Colors.black : Colors.white,
                                fontSize: 3 * SizeConfig.heightMultiplier),
                          ),
                          SizedBox(height: 0.5 * SizeConfig.heightMultiplier,),
                          Text(
                            'Full content, suitable for grown-ups',
                            style: TextStyle(color: (isJunior) ? Colors.black : HexColor('#FFF8F8',)
                              ,fontWeight: FontWeight.w400,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      _nextScreen();
                    },
                    child: Container(
                      width: 150,
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _nextScreen() {
    Navigator.of(context).push(PageTransition(
        type: PageTransitionType.slideLeft, child: AskLevelScreen()));
  }
}
