import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/selection_screen/selection_screen.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/study_home_screen/show_examples.dart';
import '../word.dart';
import 'word_box.dart';

// ignore: must_be_immutable
class StudyHomeScreen extends StatefulWidget {
  int _numberReviewedWordsRemainToday;
  int _numberToLearnWordsRemain;
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

  void updateBoxWord() {
    listBoxWords[_currentIndex].reminderReview = true;
  }
}

class _StudyHomeScreenState extends State<StudyHomeScreen> {
  bool isLoading;
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
    super.setState(fn);
  }

  Future<void> _readData() async {
    listWordsNeedToLearn =
        await DatabaseLocalHelper.instance.getListToLearnWords();
    widget._numberToLearnWordsRemain = listWordsNeedToLearn.length;
    listWordsAreReviewed =
        await DatabaseLocalHelper.instance.getListReviewWords();
    widget._numberReviewedWordsRemainToday = listWordsAreReviewed.length;
    widget.listBoxWords.clear();
    for (int i = 0; i < listWordsAreReviewed.length; i++) {
      widget.listBoxWords.add(
        WordBox(
          word: listWordsAreReviewed[i],
          isLearningWord: true,
        ),
      );
      listWords.add(listWordsAreReviewed[i]);
    }
    for (int i = 0; i < listWordsNeedToLearn.length; i++) {
      widget.listBoxWords.add(
        WordBox(word: listWordsNeedToLearn[i], isLearningWord: false),
      );
      listWords.add(listWordsNeedToLearn[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    widget._currentIndex = _current;
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      body: Container(
        decoration: CommonComponents.background,
        child: (isLoading)
            ? _loading()
            : (widget._numberReviewedWordsRemainToday +
                        widget._numberToLearnWordsRemain !=
                    0)
                ? Container(
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
                          child: (widget.listBoxWords.length > 0)
                              ? new ShowExamples(
                                  listExamples: listWords[_current].examples)
                              : Container(),
                        )
                      ],
                    ),
                  )
                : _showSelectWordsOption(),
      ),
    );
  }

  Widget _loading() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 15 * SizeConfig.heightMultiplier),
        child: LoadingBouncingGrid.square(
          size: 8 * SizeConfig.heightMultiplier,
          backgroundColor: Colors.blue,
          inverted: true,
        ),
      ),
    );
  }

  Widget _showSelectWordsOption() {
    return Center(
      child: Card(
        margin: EdgeInsets.only(bottom: 100),
        child: Container(
          height: 40 * SizeConfig.heightMultiplier,
          width: 30 * SizeConfig.heightMultiplier,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Words',
                  style: TextStyle(fontSize: 2.3 * SizeConfig.heightMultiplier),
                ),
                SizedBox(height: 20,),
                MaterialButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        PageTransition(type: PageTransitionType.fade, child: SelectionScreen()));
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 2 * SizeConfig.heightMultiplier,
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
}
