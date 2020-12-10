import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:word_up_application/introduction_screen/introduction_screen.dart';
import 'package:word_up_application/size_config.dart';

class ChooseAccentScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChooseAccentScreenStage();
}

class _ChooseAccentScreenStage extends State<ChooseAccentScreen>{
  bool britishAccent;
  @override
  void initState(){
    britishAccent = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Preferred Accent',
                style: TextStyle(fontSize: 3 * SizeConfig.heightMultiplier,
                color: Colors.red),),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: (britishAccent) ? HexColor('#68D782'): Colors.transparent,
                        onPressed: (){
                          setState(() {
                            britishAccent = true;
                          });
                        },
                          child: Image.asset(
                            'assets/sprites/UKFlag.png',
                            width: 120,
                          ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: (!britishAccent) ? HexColor('#68D782'): Colors.transparent,
                        onPressed: (){
                          setState(() {
                            britishAccent = false;
                          });
                        },
                          child: Image.asset(
                          'assets/sprites/AmericanFlag.png',
                            width: 120,
                      ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(PageTransition(type: PageTransitionType.slideLeft, child: AskForTestScreen()));
                  },
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text('Next',
                    style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}