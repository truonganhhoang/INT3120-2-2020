import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/favorite_screen/box_word.dart';
import 'package:word_up_application/favorite_screen/list_knew_words.dart';
import 'package:word_up_application/favorite_screen/list_to_learn_words.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'dart:async';
import '../size_config.dart';
import '../word.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FavoriteWordsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteWordsScreenState();
}

class _FavoriteWordsScreenState extends State<FavoriteWordsScreen> {
  int viewIndex = 0;
  int colorIndex = 0;

  void _onChanged(int index) {
    setState(() {
      if (index == 0) {
        viewIndex = 0;
        colorIndex = 0;
      } else {
        viewIndex = 1;
        colorIndex = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: CommonComponents.background,
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
                    child: ToggleSwitch(
                      initialLabelIndex: viewIndex,
                      minWidth: 80 * SizeConfig.widthMultiplier,
                      minHeight: 6 * SizeConfig.heightMultiplier,
                      cornerRadius: 20,
                      activeBgColor: Colors.white,
                      activeFgColor:
                          (colorIndex == 0) ? Colors.red[300] : Colors.green,
                      inactiveBgColor: Colors.grey[300],
                      inactiveFgColor: Colors.grey[600],
                      labels: ['To learn', 'Knew'],
                      icons: [
                        FontAwesomeIcons.question,
                        FontAwesomeIcons.check
                      ],
                      onToggle: (index) {
                        print('switched to: $index');
                        _onChanged(index);
                      },
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child:
                      (viewIndex == 0) ? ListToLearnWords() : ListKnewWords(),
                )
              ],
            ),
          )),
    );
  }
}
