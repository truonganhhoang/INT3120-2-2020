import 'package:flutter/material.dart';
import 'package:word_up_application/learn_a_word_screen/share_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'learn_box.dart';
import 'package:word_up_application/word.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:word_up_application/size_config.dart';
import 'share_screen.dart';
//import 'fake_data.dart';

class LearnAWord extends StatefulWidget {
  final Word word;
  LearnAWord({
    this.word,
  }) : assert(word != null);

  @override
  State<StatefulWidget> createState() => _LearnAWordState();
}

class _LearnAWordState extends State<LearnAWord> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: new Text('Learning'),
          actions: <Widget>[
            MaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: ShareScreen(wordShare: widget.word)));
              },
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: CommonComponents.background,
            ),
            new Container(
              margin: EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
              child: CarouselSlider(
                enableInfiniteScroll: false,
                height: 65 * SizeConfig.heightMultiplier,
                initialPage: 0,
                onPageChanged: (index) {},
                items: <Widget>[
                  LearnBox(
                    word: widget.word,
                    index: 0,
                  ),
                  /*LearnBox(
                    word: widget.word,
                    index: 1,
                  ),
                  LearnBox(
                    word: widget.word,
                    index: 2,
                  ),*/
                ],
              ),
            ),
            new Container(
                margin: EdgeInsets.only(top: 69 * SizeConfig.heightMultiplier),
                padding: EdgeInsets.only(
                    left: 2.8 * SizeConfig.heightMultiplier,
                    right: 2.8 * SizeConfig.heightMultiplier),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Example',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500,
                            fontSize: 2.8 * SizeConfig.textMultiplier,
                          ),
                        ),
                        Text(
                          'More',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            fontSize: 2 * SizeConfig.textMultiplier,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 67 * SizeConfig.widthMultiplier,
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text('"' + widget.word.quotes[0] + '"',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500,
                                fontSize: 2.1 * SizeConfig.textMultiplier,
                              )),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.volume_up,
                      color: Colors.blue[600],
                      size: 3 * SizeConfig.heightMultiplier,
                    ),
                  ],
                )),
          ],
        ));
  }
}
