import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/user_profile_screen/select_accent_screen.dart';
import 'package:word_up_application/user_profile_screen/select_practice_goal_screen.dart';
import 'package:word_up_application/user_profile_screen/select_reminder_screen.dart';

import '../user.dart';

class MyLearning extends StatefulWidget {
  AppUser user;
  MyLearning({this.user});

  @override
  State<StatefulWidget> createState() => _MyLearning();
}

class _MyLearning extends State<MyLearning> {
  @override
  Widget build(BuildContext context) {
    if (widget.user == null) print(widget.user.idUser);
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: Text(
              'My learning',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 3 * SizeConfig.heightMultiplier),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: SelectAccent(),
                      type: PageTransitionType.slideLeft));
            },
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Accent',
                      style:
                          TextStyle(fontSize: 2.5 * SizeConfig.heightMultiplier)),
                  Text(
                    widget.user.learnSetting.accent,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 2.5 * SizeConfig.heightMultiplier),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: SelectPracticeGoal(),
                      type: PageTransitionType.slideLeft));
            },
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Practice goal',
                      style:
                          TextStyle(fontSize: 2.5 * SizeConfig.heightMultiplier)),
                  Text(
                    widget.user.learnSetting.practiceGoal.toString() +
                        ' min/day',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 2.5 * SizeConfig.heightMultiplier),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              
            },
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Translation',
                      style:
                          TextStyle(fontSize: 2.5 * SizeConfig.heightMultiplier)),
                  Text(
                    'Per english definition >',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 2.5 * SizeConfig.heightMultiplier),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: SelectReminder(),
                      type: PageTransitionType.slideLeft));
            },
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Reminder',
                      style:
                          TextStyle(fontSize: 2.5 * SizeConfig.heightMultiplier)),
                  Text(
                    '0' +
                        widget.user.learnSetting.reminder.hour.toString() +
                        ":" +
                        '0' +
                        widget.user.learnSetting.reminder.minute.toString(),
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 2.5 * SizeConfig.heightMultiplier),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
