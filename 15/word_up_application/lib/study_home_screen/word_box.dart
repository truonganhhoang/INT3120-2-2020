import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:word_up_application/components/star_favorite.dart';
import 'package:word_up_application/favorite_screen/favorite_words_screen.dart';
import 'package:word_up_application/learn_a_word_screen/fake_data.dart';
import 'package:word_up_application/learn_a_word_screen/learn_a_word_screen.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/study_home_screen/test_question_screen.dart';
import 'package:word_up_application/word.dart';

class WordBox extends StatefulWidget {
  final assetsAudioPlayer = AssetsAudioPlayer();
  final Word word;
  WordBox({
    @required this.word,
  }) : assert(word != null);

  @override
  State<StatefulWidget> createState() => WordBoxState();
}

class WordBoxState extends State<WordBox> {
  bool _reminderReview;

  @override
  void initState(){
    _reminderReview = false;
    super.initState();
  }

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
                splashColor: Colors.transparent,
                minWidth: 40,
                onPressed: () {
                  _removeThisWord();
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
                splashColor: Colors.transparent,
                onPressed: () {
                  print(widget.word.pathSoundUK);
                  widget.assetsAudioPlayer.open(Audio('assets/audios/' + widget.word.pathSoundUK));
                },
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if(_reminderReview) Container(
                      width: 51 * SizeConfig.widthMultiplier,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.check,
                          color: Colors.green, size: 5 * SizeConfig.heightMultiplier,),
                          Text(
                          'Review in 3 days', textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 2.5 * SizeConfig.heightMultiplier,
                              color: Colors.green, fontWeight: FontWeight.bold),
                          ),
                        ]
                      ),
                    ),
                    if(!_reminderReview) MaterialButton(
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
                    if(!_reminderReview) MaterialButton(
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

                  ],
                ),
              )),
        ],
      ),
    );
  }

  void userKnewThisWord() {
    // do something
    setState(() {
      _reminderReview = true;
    });
  }

  void userWantToLearnThisWord() {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: LearnAWord(word: word,)));
  }

  void userAnswerWrong() {
    userWantToLearnThisWord();
  }

  void userAnswerCorrect() {
    setState(() {
      _reminderReview = true;
    });
  }

  void userWantToHaveATest() {
    openTestPopup(context);
  }

  void maskThisWordAsFavorite() {
    // to do
  }

  void openTestPopup(context) {
    var alertStyle = AlertStyle(
      alertElevation: 0,
      alertPadding: EdgeInsets.only(
          left: 3 * SizeConfig.heightMultiplier,
          right: 3 * SizeConfig.heightMultiplier,
          top: 0 * SizeConfig.widthMultiplier,
          bottom: 25 * SizeConfig.widthMultiplier),
      animationType: AnimationType.grow,
      isCloseButton: true,
      isOverlayTapDismiss: false,
      overlayColor: Colors.black45,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      descTextAlign: TextAlign.start,
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.blue,
      titleStyle: TextStyle(
        color: Colors.white,
        fontSize: 3 * SizeConfig.heightMultiplier,
      ),
      alertAlignment: Alignment.center,
      buttonAreaPadding: EdgeInsets.only(
          bottom: 5 * SizeConfig.widthMultiplier),
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
        content: TestQuestionScreen(word: widget.word, controller: this,),
        buttons: []).show();
  }

  void _removeThisWord(){
    AlertStyle _style = AlertStyle(
      titleStyle: TextStyle(fontSize: 4 * SizeConfig.heightMultiplier),
    );
    Alert(
      context: context,
      style: _style,
      type: AlertType.warning,
      title: widget.word.word,
      desc: "Are you sure to remove this word?",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.blueGrey,
          onPressed: () => {Navigator.pop(context),
          _deleteThisWord(),},
          width: 120,
        ),
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  void _deleteThisWord(){

  }
}
