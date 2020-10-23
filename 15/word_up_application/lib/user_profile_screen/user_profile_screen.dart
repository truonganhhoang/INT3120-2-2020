import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/favorite_screen/favorite_words_screen.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/user_profile_screen/about_me_screen.dart';
import 'package:word_up_application/user_profile_screen/my_learning_screen.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserProfileScreen();
}

DatabaseLocalHelper dbHelper = DatabaseLocalHelper.instance;
int numberOfKnewWords;
int numberOfToLearnWords;

class _UserProfileScreen extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    dbHelper.getCountKnewWords().then((res) {
      setState(() {
        numberOfKnewWords = res;
      });
    });
    dbHelper.getCountToLearnWord().then((res) {
      setState(() {
        numberOfToLearnWords = res;
      });
    });
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.close,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('My Account'),
          centerTitle: true,
        ),
        body: Container(
          decoration: CommonComponents.background,
          child: Stack(
            children: <Widget>[
              Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                      top: 6 * SizeConfig.heightMultiplier,
                      left: 5 * SizeConfig.widthMultiplier,
                      bottom: 0),
                  height: 20 * SizeConfig.heightMultiplier,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(Icons.account_circle,
                            size: 9 * SizeConfig.heightMultiplier),
                        radius: 6 * SizeConfig.heightMultiplier,
                        backgroundColor: Colors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 2 * SizeConfig.widthMultiplier),
                            child: Text(
                              'Estimated total knowledge',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 2.5 * SizeConfig.heightMultiplier,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 2 * SizeConfig.widthMultiplier),
                                child: Text('5933',
                                    style: TextStyle(
                                        color: Color(0xFF0032E3),
                                        fontSize:
                                            2.5 * SizeConfig.heightMultiplier)),
                              ),
                              Text(
                                ' words',
                                style: TextStyle(
                                    color: Color(0xFF28576B),
                                    fontSize: 3 * SizeConfig.heightMultiplier),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: 22 * SizeConfig.heightMultiplier,
                    bottom: 20,
                    left: 20,
                    right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: FavoriteWordsScreen(viewIndex: 1,)));
                      },
                      child: Container(
                        height: 10 * SizeConfig.heightMultiplier,
                        width: 26 * SizeConfig.widthMultiplier,
                        decoration: new BoxDecoration(
                          color: Color(0xFF0FA830),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$numberOfKnewWords',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 3 * SizeConfig.heightMultiplier),
                            ),
                            Text(
                              'I knew',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 3 * SizeConfig.heightMultiplier),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 10 * SizeConfig.heightMultiplier,
                      width: 26 * SizeConfig.widthMultiplier,
                      decoration: new BoxDecoration(
                        color: Color(0xFFEEAB00),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '27',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 3 * SizeConfig.heightMultiplier),
                          ),
                          Text(
                            'Learning',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 3 * SizeConfig.heightMultiplier),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: FavoriteWordsScreen(viewIndex: 0,)));
                      },
                      child: Container(
                        height: 10 * SizeConfig.heightMultiplier,
                        width: 26 * SizeConfig.widthMultiplier,
                        decoration: new BoxDecoration(
                          color: Color(0xFFFF180A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$numberOfToLearnWords',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 3 * SizeConfig.heightMultiplier),
                            ),
                            Text(
                              'To learn',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 3 * SizeConfig.heightMultiplier),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(right: 5, left: 5),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 53 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      color: Color(0xFF15B7FF),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[AboutMe(), MyLearning()],
                    ),
                  ))
            ],
          ),
        ));
  }
}
