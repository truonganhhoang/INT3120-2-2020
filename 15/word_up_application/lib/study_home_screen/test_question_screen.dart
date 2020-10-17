import 'package:flutter/material.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/study_home_screen/word_box.dart';
import 'package:word_up_application/word.dart';

class TestQuestionScreen extends StatefulWidget {
  final WordBoxState controller;
  //final _WordBoxState controller;
  final Word word;
  TestQuestionScreen({
    //this.controller,
    this.word,
    this.controller
  });

  @override
  State<StatefulWidget> createState() => _TestQuestionScreen();
}

class _TestQuestionScreen extends State<TestQuestionScreen> with SingleTickerProviderStateMixin{
  int _chosenAnswer = 0;
  int _correctAnswer = 1;
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          answerOption(1),
          answerOption(2),
          answerOption(3),
          answerOption(4)
        ],
      ),
    );
  }

  Widget answerOption(int index) {
    if(index == _chosenAnswer) _controller.forward(from: 0);
    return Container(
      margin: EdgeInsets.only(top: 1.5 * SizeConfig.heightMultiplier),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: FadeTransition(
        opacity: (index == _chosenAnswer) ? _animation : Tween(begin: 1.0, end: 1.0).animate(_controller),
        child: Container(
            child: FlatButton(
              color: (index == _correctAnswer && index == _chosenAnswer) ? Colors.green :
              (index != _correctAnswer && index == _chosenAnswer) ? Colors.red : Colors.white,
              splashColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
              onPressed: () {
                if(_chosenAnswer == 0) {
                  _chosenAnswer = index;
                  checkTheAnswer();
                }
              },
              child: Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 1.3 * SizeConfig.heightMultiplier),
                      child: (index != _chosenAnswer) ? Container(
                        //color: Colors.transparent ,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black45,
                          border: Border.all(
                            color: Colors.black45,
                            width: 15,
                          ),
                        ),
                        child: Text(
                          getStrWithIndex(index),
                          style: TextStyle(color: Colors.white),
                        ),
                      ) : Container(
                        padding: EdgeInsets.symmetric(vertical: 5.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                            width: 5,
                          ),
                        ),
                          child: Icon(
                            (_chosenAnswer == _correctAnswer) ? Icons.check : Icons.close,
                            color:(_chosenAnswer == _correctAnswer) ? Colors.green : Colors.red,
                            size: 25,
                          ),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      'A subject that is discussed, written about, or studied',
                      style: TextStyle(
                          color: (index == _chosenAnswer) ? Colors.white : Colors.black87,
                          fontSize: 2 * SizeConfig.heightMultiplier),
                    ))
                  ],
                ),
              ),
            )),
      ),
    );
  }

  bool answerCorrectly(int index) {
      if (_chosenAnswer == _correctAnswer && index == _chosenAnswer) {
        return true;
      } else
       return false;
  }

  void checkTheAnswer() {
    if(_chosenAnswer == _correctAnswer){
    }

    Future.delayed(const Duration(milliseconds: 600), (){
      Navigator.pop(context);
      if(_chosenAnswer == _correctAnswer) widget.controller.userAnswerCorrect();
      else widget.controller.userAnswerWrong();
    });
    setState(() {});
  }

  String getStrWithIndex(int index) {
    switch (index) {
      case 1:
        return 'A';
      case 2:
        return 'B';
      case 3:
        return 'C';
      case 4:
        return 'D';
    }
    return 'E';
  }
}
