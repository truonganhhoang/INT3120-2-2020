import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/favorite_screen/box_word.dart';
import 'package:word_up_application/favorite_screen/list_knew_words.dart';
import 'package:word_up_application/favorite_screen/list_to_learn_words.dart';
import 'package:word_up_application/favorite_screen/size_helper.dart';
import 'package:word_up_application/local_database/database_helper.dart';
import 'dart:async';
import '../size_config.dart';
import '../word.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FavoriteWordsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteWordsScreenState();
}

class _FavoriteWordsScreenState extends State<FavoriteWordsScreen> {
  bool viewListWords = false;

  void _onChanged(int index) {
    setState(() {
      if (index == 0)
        viewListWords = false;
      else viewListWords = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: displayHeight(context) - MediaQuery.of(context).padding.top - kToolbarHeight - kBottomNavigationBarHeight,
        decoration: CommonComponents.background,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Center(
                  child: ToggleSwitch(
                    minWidth: displayWidth(context)*0.8,
                    cornerRadius: 20,
                    activeBgColor: Colors.white,
                    activeFgColor: Colors.green,
                    inactiveBgColor: Colors.grey[300],
                    inactiveFgColor: Colors.grey[600],
                    labels: ['To learn', 'Knew'],
                    icons: [FontAwesomeIcons.question, FontAwesomeIcons.check],
                    onToggle: (index) {
                      print('switched to: $index');
                      _onChanged(index);
                    },
                  ),
                ),
              ),
              viewListWords ? ListKnewWords() : ListToLearnWords(),
            ],
          ),
        )
      ),
    );
  }
}