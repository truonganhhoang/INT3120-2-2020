import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:word_up_application/introduction_screen/introduction_screen.dart';

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
      backgroundColor: HexColor('#E7E8EA'),
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Preferred Accent'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: FlatButton(
                      onPressed: (){
                        setState(() {
                          britishAccent = true;
                        });
                      },
                        child: Text('E')),
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: (){
                        setState(() {
                          britishAccent = false;
                        });
                      },
                        child: Text('A')
                    ),
                  ),
                ],
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: (){
                  Navigator.of(context).push(PageTransition(type: PageTransitionType.slideLeft, child: AskForTestScreen()));
                },
                color: Colors.red,
                child: Text('Next'),
              )
            ],
          ),
        ),
      ),
    );
  }
}