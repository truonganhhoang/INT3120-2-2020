
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:word_up_application/components/star_favorite.dart';
import 'package:word_up_application/firebase/firebase_handler.dart';
import 'package:word_up_application/home/home_screen.dart';
import 'package:word_up_application/learn_a_word_screen/learn_a_word_screen.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/selection_screen/selection_screen.dart';
import 'package:word_up_application/services/database_server_handler.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/study_home_screen/study_home_screen.dart';
import 'package:word_up_application/study_home_screen/test_question_screen.dart';
import 'package:word_up_application/word.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class WordBox extends StatefulWidget {
  bool isWord = true;
  final assetsAudioPlayer = AssetsAudioPlayer();
  int reminderReviewDays = 0;
  final bool isLearningWord;
  final Word word;

  WordBox({
    this.word,
    this.isLearningWord,
    this.isWord,
  });

  @override
  State<StatefulWidget> createState() => WordBoxState();
}

class WordBoxState extends State<WordBox> {
  int _reminderReviewDays;
  bool _isLearningWord;
  int daysReviewLater;

  @override
  void initState() {
    if(widget.isWord == null) widget.isWord = true;
    if(widget.isWord) {
      daysReviewLater = widget.reminderReviewDays;
      _isLearningWord = widget.isLearningWord;
      _reminderReviewDays = widget.reminderReviewDays;
    }
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
      child: (widget.isWord) ? Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StarFavorite(
                wordId: widget.word.id,
                size: 25,
                isFavorite: false,
              ),
              _status(),
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                onPressed: () {
                  print(widget.word.pathSoundUK);
                  widget.assetsAudioPlayer
                      .open(Audio('assets/audios/' + widget.word.pathSoundUK));
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
                if (_reminderReviewDays != 0)
                  Container(
                    width: 51 * SizeConfig.widthMultiplier,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 5 * SizeConfig.heightMultiplier,
                          ),
                          Text(
                            (daysReviewLater == 1) ? 'Review Tomorrow' : ((daysReviewLater != 1000) ? ('Review in ' + daysReviewLater.toString()  + ' days')
                            : 'Excellent! You remember this word forever!'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 2.5 * SizeConfig.heightMultiplier,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                if (_reminderReviewDays == 0)
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
                if (_reminderReviewDays == 0)
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
      )
      : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Padding(
           padding: const EdgeInsets.all(20),
           child: MaterialButton(
             color: Colors.red,
             padding: EdgeInsets.all(0),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10),
             ),
             onPressed: (){
               Navigator.push(context,
                   PageTransition(type: PageTransitionType.fade, child: SelectionScreen()));
             },
             child: Container(
               width:  30 * SizeConfig.heightMultiplier,
               child: Text('Continue',
               style: TextStyle(color: Colors.white),
               textAlign: TextAlign.center,),
             ),
           ),
         )
        ],
      ),
    );
  }

  Widget _status() {
    int _reviewTimes =  widget.word.reviewTimes;

    if (_reviewTimes == null || _reviewTimes == 0) {
      return Text(
        'New!',
        style: TextStyle(color: Colors.red,
        fontSize: 2 * SizeConfig.heightMultiplier,),
      );
    } else
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < _reviewTimes; i++) _barStatus(true),
          for (int i = _reviewTimes; i < 5; i++) _barStatus(false),
        ],
      );
  }

  Widget _barStatus(bool value) {
    return SizedBox(
      height: 10,
      width: 15,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          color: (value) ? Colors.green : Colors.grey,
        ),
      ),
    );
  }

  void userKnewThisWord() {
    int reviewT;
    if(widget.word.reviewTimes != null) reviewT = widget.word.reviewTimes;
    else reviewT = 0;
    daysReviewLater = 1000;
    reviewT ++;
    switch(reviewT){
      case 1:
        daysReviewLater = 1;
        break;
      case 2:
        daysReviewLater = 3;
        break;
      case 3:
        daysReviewLater = 7;
        break;
      case 4:
        daysReviewLater = 30;
        break;
    }
    setReviewThisWord(daysReviewLater, reviewT);
  }

  void setReviewThisWord(int days, int times) {
    if(widget.word.reviewTimes != null) if(widget.word.reviewTimes > 0) {
      StudyHomeScreen.instance.updateReviewNumber();
      if(StudyHomeScreen.instance.numberReviewedWordsRemainToday > 0)
        Home.titleHome.changeHomeTitle('Review ' + StudyHomeScreen.instance.numberReviewedWordsRemainToday.toString());
      else Home.titleHome.changeHomeTitle('Learning');
    }

    StudyHomeScreen.instance.updateBoxWord(days);
    if(days != 1000) {
      DateTime now = new DateTime.now();
      DateTime dateReview = now.add(Duration(days: days));
      var formatter = new DateFormat('yyyy-MM-dd');
      String formattedDate = formatter.format(dateReview);
      print(formattedDate);
      DatabaseLocalHelper.instance
          .updateReviewWord(widget.word.id, formattedDate, times);
      setState(() {
        daysReviewLater = days;
        _reminderReviewDays = days;
      });
    }
    else {
      DatabaseLocalHelper.instance.deleteLearningWord(widget.word.id);
      DatabaseLocalHelper.instance.insertKnewWord(widget.word.id);

      setState(() {
        daysReviewLater = days;
        _reminderReviewDays = days;
      });
    }
  }

  void userWantToLearnThisWord() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: LearnAWord(
              word: widget.word,
            )));
    if (_isLearningWord) return;
    _moveThisWordToLearning();
  }

  void userAnswerWrong() {
    userWantToLearnThisWord();
  }

  void userAnswerCorrect() {
    userKnewThisWord();
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
      buttonAreaPadding:
          EdgeInsets.only(bottom: 5 * SizeConfig.widthMultiplier),
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
        content: TestQuestionScreen(
          word: widget.word,
          controller: this,
        ),
        buttons: []).show();
  }

  void _removeThisWord() {
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
          onPressed: () => {
            Navigator.pop(context),
            _deleteThisWord(),
          },
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

  void _deleteThisWord() {}

  void _moveThisWordToLearning() async {
    _isLearningWord = true;
    String now = getDateNow();
    await DatabaseLocalHelper.instance.deleteToLearnWord(widget.word.id);
    await DatabaseLocalHelper.instance
        .insertLearningWord(widget.word.id, now, 0);
  }

  void _moveThisWordToKnew() {}

  String getDateNow() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    return formatted;
  }
}
