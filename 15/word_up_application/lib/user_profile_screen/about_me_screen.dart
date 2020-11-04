import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/user_profile_screen/select_age_screen.dart';
import 'package:word_up_application/user_profile_screen/select_language_screen.dart';
import 'package:word_up_application/user_profile_screen/select_name_screen.dart';

import '../user.dart';

class AboutMe extends StatefulWidget {
  AppUser user;

  AboutMe({this.user});

  @override
  State<StatefulWidget> createState() => _AboutMe();
}

bool isSelectName = false;
bool isSelectAge = false;
bool isSelectLanguage = false;

class _AboutMe extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 0),
            child: Text(
              'About me',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 3 * SizeConfig.heightMultiplier),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name',
                  style: TextStyle(fontSize: 2.5 * SizeConfig.heightMultiplier),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: SelectName(),
                            type: PageTransitionType.slideLeft));
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 10 * SizeConfig.widthMultiplier),
                    child: Text(
                      isSelectName ? null : widget.user.userPrivateInformation.userName + ' >',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 2.5 * SizeConfig.heightMultiplier),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your age',
                  style: TextStyle(fontSize: 2.5 * SizeConfig.heightMultiplier),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: SelectAge(),
                            type: PageTransitionType.slideLeft));
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20 * SizeConfig.widthMultiplier),
                    child: Text(
                      widget.user.userPrivateInformation.age.toString(),
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 2.5 * SizeConfig.heightMultiplier),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Native language',
                  style: TextStyle(fontSize: 2.5 * SizeConfig.heightMultiplier),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: SelectLanguage(),
                            type: PageTransitionType.slideLeft));
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 6 * SizeConfig.widthMultiplier),
                    child: Text(
                      widget.user.userPrivateInformation.nativeLanguage + ' >',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 2.5 * SizeConfig.heightMultiplier),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
