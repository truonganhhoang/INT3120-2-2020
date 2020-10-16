import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:word_up_application/components/star_favorite.dart';
import 'package:word_up_application/learn_a_word_screen/learn_a_word_screen.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/study_home_screen/test_question_screen.dart';
import 'package:word_up_application/word.dart';

class WordBox extends StatefulWidget {
  final Word word;
  WordBox({
    @required this.word,
  }) : assert(word != null);

  @override
  State<StatefulWidget> createState() => _WordBoxState();
}

class _WordBoxState extends State<WordBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StarFavorite(
                wordId: widget.word.id,
                size: 25,
                isFavorite: false,
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  removeThisWord();
                },
                child: Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Text(
              widget.word.word,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 4 * SizeConfig.heightMultiplier),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Text(
              widget.word.pronounceUK,
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 2.5 * SizeConfig.heightMultiplier),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
              //padding: EdgeInsets.all(0),
              child: MaterialButton(
                onPressed: () {},
                child: ImageIcon(
                  AssetImage('assets/sprites/sound_play_icon.png'),
                  color: Colors.grey,
                  size: 10 * SizeConfig.heightMultiplier,
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    userKnewThisWord();
                  },
                  color: Colors.green,
                  height: 50,
                  minWidth: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'I know',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 2 * SizeConfig.heightMultiplier),
                  ),
                ),
                MaterialButton(
                  elevation: 0,
                  height: 50,
                  onPressed: () {
                    userWantToLearnThisWord();
                  },
                  color: Colors.red,
                  minWidth: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.red)),
                  child: Text(
                    'Learn',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 2 * SizeConfig.heightMultiplier),
                  ),
                ),
                MaterialButton(
                  elevation: 0,
                  height: 50,
                  onPressed: () {
                    userWantToHaveATest();
                  },
                  color: Colors.orange,
                  minWidth: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.orange)),
                  child: Text(
                    'Test me',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 2 * SizeConfig.heightMultiplier),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  void userKnewThisWord() {
    // do something
  }

  void userWantToLearnThisWord() {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: LearnAWord()));
  }

  void userWantToHaveATest() {
    openTestPopup(context);
  }

  void removeThisWord() {
    // to do
  }

  void maskThisWordAsFavorite() {
    // to do
  }

  void openTestPopup(context) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: true,
      isOverlayTapDismiss: false,
      overlayColor: Colors.black38,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      descTextAlign: TextAlign.start,
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: Colors.blue,
        ),
      ),
      backgroundColor: Colors.blue,
      titleStyle: TextStyle(
        color: Colors.white,
        fontSize: 3 * SizeConfig.heightMultiplier,
      ),
      alertAlignment: Alignment.center,
    );

    Alert(
        closeIcon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        type: AlertType.none,
        style: alertStyle,
        context: context,
        title: widget.word.word + '...?',
        content: TestQuestionScreen(widget.word),
        buttons: []).show();
  }
}