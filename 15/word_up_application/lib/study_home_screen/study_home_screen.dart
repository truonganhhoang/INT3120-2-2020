import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/home/home_screen.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/selection_screen/selection_screen.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/study_home_screen/show_examples.dart';
import '../word.dart';
import 'word_box.dart';

// ignore: must_be_immutable
class StudyHomeScreen extends StatefulWidget {
  int numberReviewedWordsRemainToday = -1;
  int _numberToLearnWordsRemain = -1;
  int _currentIndex;
  AppBar appBar;
  static final StudyHomeScreen instance = StudyHomeScreen._internal();

  factory StudyHomeScreen() {
    return instance;
  }

  StudyHomeScreen._internal({this.appBar});

  List<WordBox> listBoxWords = new List<WordBox>();

  @override
  State<StatefulWidget> createState() => _StudyHomeScreenState();

  void updateBoxWord(int reviewDays) {
    listBoxWords[_currentIndex].reminderReviewDays = reviewDays;
  }

  void updateReviewNumber(){
    if(numberReviewedWordsRemainToday > 0) {
      numberReviewedWordsRemainToday --;
    }
  }
}

class _StudyHomeScreenState extends State<StudyHomeScreen> {
  bool isLoading;
  bool studyFinished = false;
  List<Word> listWordsAreReviewed;
  List<Word> listWordsNeedToLearn;
  List<Word> listWords;
  int _current = 0;

  @override
  void initState() {
    listWords = new List<Word>();
    isLoading = true;
    _readData().then((value) async => {
          await Future.delayed(const Duration(milliseconds: 1000)),
          setState(() {
            isLoading = false;
          })
        });
    super.initState();
  }

  @override
  void setState(fn) {
    if(widget.numberReviewedWordsRemainToday != 0) Home.titleHome.changeHomeTitle('Review ' + widget.numberReviewedWordsRemainToday.toString());
    else Home.titleHome.changeHomeTitle('Learning');
    super.setState(fn);
  }

  @override dispose(){
    super.dispose();
  }

  Future<void> _readData() async {
    listWordsNeedToLearn =
        await DatabaseLocalHelper.instance.getListToLearnWords();
    widget._numberToLearnWordsRemain = listWordsNeedToLearn.length;
    listWordsAreReviewed =
        await DatabaseLocalHelper.instance.getListReviewWords();
    // widget.numberReviewedWordsRemainToday = listWordsAreReviewed.length;
    widget.listBoxWords.clear();
    for (int i = 0; i < listWordsAreReviewed.length; i++) {
      if(listWordsAreReviewed[i].reviewTimes > 0) {
        widget.listBoxWords.add(
          WordBox(
            word: listWordsAreReviewed[i],
            isLearningWord: true,
          ),
        );
        listWords.add(listWordsAreReviewed[i]);
      }
    }
    for (int i = 0; i < listWordsAreReviewed.length; i++) {
      if(listWordsAreReviewed[i].reviewTimes == 0) {
        widget.listBoxWords.add(
          WordBox(
            word: listWordsAreReviewed[i],
            isLearningWord: true,
          ),
        );
        listWords.add(listWordsAreReviewed[i]);
      }
    }

    for (int i = 0; i < listWordsNeedToLearn.length; i++) {
      widget.listBoxWords.add(
        WordBox(word: listWordsNeedToLearn[i], isLearningWord: false),
      );
      listWords.add(listWordsNeedToLearn[i]);
    }

    widget.numberReviewedWordsRemainToday = 0;
    for(int i = 0; i < widget.listBoxWords.length; i ++){
      if(widget.listBoxWords[i].word.reviewTimes != null){
        if(widget.listBoxWords[i].word.reviewTimes > 0){
          widget.numberReviewedWordsRemainToday++;
        }
      }
    }
    widget._numberToLearnWordsRemain = widget.listBoxWords.length - widget.numberReviewedWordsRemainToday;
  }

  @override
  Widget build(BuildContext context) {
    if(!isLoading) {
      if (widget.numberReviewedWordsRemainToday +
          widget._numberToLearnWordsRemain == 0 && studyFinished == false) {
        studyFinished = true;
        print('xx');
        widget.listBoxWords.add(_showSelectWordsOption());
      }
    }
    widget._currentIndex = _current;
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      body: Container(
        decoration: CommonComponents.background,
        child: (isLoading)
            ? _loading()
            : Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: 5 * SizeConfig.heightMultiplier),
                          child: CarouselSlider(
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            height: 45 * SizeConfig.heightMultiplier,
                            initialPage: 0,
                            onPageChanged: (index) {
                              setState(() {
                                _current = index;
                              });
                            },
                            items: widget.listBoxWords,
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(
                              top: 3 * SizeConfig.heightMultiplier),
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: (widget.numberReviewedWordsRemainToday +
                              widget._numberToLearnWordsRemain != 0)
                              ? new ShowExamples(
                                  listExamples: listWords[_current].examples)
                              : Container(),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget _loading() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 15 * SizeConfig.heightMultiplier),
        child: LoadingBouncingGrid.square(
          size: 6 * SizeConfig.heightMultiplier,
          backgroundColor: Colors.blue,
          inverted: true,
        ),
      ),
    );
  }

  Widget _showSelectWordsOption() {
    return WordBox(isWord: false,);
  }
}


