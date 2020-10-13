import 'package:flutter/material.dart';
import 'package:word_up_application/learn_a_word_screen/share_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'learn_box.dart';
import 'package:word_up_application/word.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:word_up_application/size_config.dart';
import 'share_screen.dart';

class LearnAWord extends StatelessWidget {
  final Word word = Word(
    id: 1,
    word: 'Modern',
    type: 'adj',
    definition: 'Designed and made using the most recent ideas and methods',
    meanCard: 'Hiện đại',
    examples: [
      '- modern technology/education/art/transport.',
      '- We\'re in the very modern-looking building opposite the station.'
    ],
    pathSoundUK: 'assets/audios/modern_UK.mp3',
    pathSoundUS: 'pathSoundUS',
    pronounceUS: '/ˈmɒd.ən/',
    pronounceUK: '/ˈmɒd.ən/',
    imagePaths: ['assets/images/modern.jpg'],
    quotes: ['This house is more modern than that house'],
  );

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: new Text('Learning'),
          actions: <Widget>[
            MaterialButton(
              child: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: ShareScreen()));
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
                height: 66 * SizeConfig.heightMultiplier,
                initialPage: 0,
                onPageChanged: (index) {},
                items: <Widget>[
                  LearnBox(
                    word: word,
                  ),
                  LearnBox(
                    word: word,
                  ),
                  LearnBox(
                    word: word,
                  ),
                ],
              ),
            ),
            new Container(
                margin: EdgeInsets.only(top: 71 * SizeConfig.heightMultiplier),
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
                          width: 32 * SizeConfig.heightMultiplier,
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text('"' + word.quotes[0] + '"',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500,
                                fontSize: 2 * SizeConfig.textMultiplier,
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
