import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/favorite_screen/favorite_words_screen.dart';
import 'package:word_up_application/favorite_screen/my_words_screen.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/services/authentication_screen.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/user.dart';
//import 'package:word_up_application/user_profile_screen/about_me_screen.dart';
import 'package:word_up_application/user_profile_screen/my_learning_screen.dart';
import 'package:word_up_application/user_profile_screen/select_accent_screen.dart';
import 'package:word_up_application/user_profile_screen/select_age_screen.dart';
import 'package:word_up_application/user_profile_screen/select_language_screen.dart';
import 'package:word_up_application/user_profile_screen/select_name_screen.dart';
import 'package:word_up_application/user_profile_screen/select_practice_goal_screen.dart';
import 'package:word_up_application/user_profile_screen/select_reminder_screen.dart';

class UserProfileScreen extends StatefulWidget {
  //AppUser user;

  @override
  State<StatefulWidget> createState() => _UserProfileScreen();
}

DatabaseLocalHelper dbHelper = DatabaseLocalHelper.instance;
int numberOfKnewWords;
int numberOfToLearnWords;
int numberOfLearningWords;
bool isSelectImage = false;
String imagePath;
AppUser user = new AppUser(
  idUser: '822817271',
  userPrivateInformation: UserPrivateInformation(
      age: 15,
      avatarUrl: 'https://images.unsplash.com/photo-1486578077620-8a022ddd481f',
      email: 'truong@gmail.com',
      nativeLanguage: 'Vietnamese',
      userName: 'Truong'),
  learningProgress: LearningProgress(wordFavorite: [
    1,
    2,
    9,
    10
  ], wordToLearn: [
    1,
    4,
    5,
    7,
    8,
    9
  ], wordKnew: [
    10,
    12,
    15
  ], wordLearning: [
    WordLearning(
      wordId: 2,
      reviewDate: 3,
      reviewTimes: 0,
    ),
    WordLearning(
      wordId: 3,
      reviewDate: 3,
      reviewTimes: 1,
    ),
    WordLearning(
      wordId: 6,
      reviewDate: 3,
      reviewTimes: 0,
    ),
  ]),
  learnSetting: LearnSetting(
    accent: 'British',
    practiceGoal: 20, // 20 words per day.
    reminder: Time(hour: 6, minute: 0),
  ),
);

class _UserProfileScreen extends State<UserProfileScreen> {
  bool isLogin;

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
    dbHelper.getCountLearningWord().then((res) {
      setState(() {
        numberOfLearningWords = res;
      });
    });
    if (user == null) {
      setState(() {
        isLogin = false;
        print(user);
      });
    } else {
      setState(() {
        isLogin = true;
        print(user);
      });
    }
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
                      //left: 5 * SizeConfig.widthMultiplier,
                      bottom: 0),
                  height: 20 * SizeConfig.heightMultiplier,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () async {
                          if (isLogin == true) {
                            final pickerFile = await ImagePicker()
                                .getImage(source: ImageSource.gallery);
                            if (pickerFile != null) {
                              imagePath = pickerFile.path;
                              setState(() {
                                isSelectImage = true;
                              });
                            }
                          }
                        },
                        child: isSelectImage
                            ? CircleAvatar(
                                radius: 6 * SizeConfig.heightMultiplier,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(imagePath),
                              )
                            : (isLogin
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        user.userPrivateInformation.avatarUrl),
                                    radius: 6 * SizeConfig.heightMultiplier,
                                    backgroundColor: Colors.white,
                                  )
                                : MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AuthenticationScreen(
                                                  noGuest: true,
                                                )),
                                      );
                                    },
                                    child: CircleAvatar(
                                      child: Icon(
                                        Icons.camera_enhance,
                                        size: 6 * SizeConfig.heightMultiplier,
                                      ),
                                      backgroundColor: Colors.white,
                                      radius: 6 * SizeConfig.heightMultiplier,
                                    ),
                                  )),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                right: 5 * SizeConfig.widthMultiplier),
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
                                    right: 2 * SizeConfig.widthMultiplier),
                                child: Text('5933',
                                    style: TextStyle(
                                        color: Color(0xFF0032E3),
                                        fontSize:
                                            3 * SizeConfig.heightMultiplier)),
                              ),
                              Text(
                                ' words',
                                style: TextStyle(
                                    color: Color(0xFF28576B),
                                    fontSize:
                                        2.5 * SizeConfig.heightMultiplier),
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
                                child: ListWordsScreen(
                                  viewIndex: 0,
                                )));
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: ListWordsScreen(
                                  viewIndex: 1,
                                )));
                      },
                      child: Container(
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
                              '$numberOfLearningWords',
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
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: ListWordsScreen(
                                  viewIndex: 2,
                                )));
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
              isLogin
                  ? Container(
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
                  : new Container(
                      padding: EdgeInsets.only(right: 5, left: 5),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 55 * SizeConfig.heightMultiplier,
                        child: MaterialButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {},
                            child: Container(
                              alignment: Alignment.center,
                              height: 10 * SizeConfig.heightMultiplier,
                              margin: EdgeInsets.all(
                                  15 * SizeConfig.widthMultiplier),
                              //padding: EdgeInsets.all(5.0*SizeConfig.widthMultiplier),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AuthenticationScreen(
                                                noGuest: true,
                                              )));
                                },
                                child: Center(
                                    child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      fontSize: 6 * SizeConfig.textMultiplier),
                                )),
                              ),
                            )),
                      ),
                    )
            ],
          ),
        ));
  }
}

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  var nameChange = user.userPrivateInformation.userName;

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
                  onTap: () async {
                    var res = await Navigator.push(
                        context,
                        PageTransition(
                            child: SelectName(),
                            type: PageTransitionType.fade));
                    setState(() {
                      if (res != null)
                        user.userPrivateInformation.userName = res;
                    });
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 10 * SizeConfig.widthMultiplier),
                    child: Text(
                      user.userPrivateInformation.userName + ' >',
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
                  onTap: () async {
                    var res = await Navigator.push(
                        context,
                        PageTransition(
                            child: SelectAge(), type: PageTransitionType.fade));
                    setState(() {
                      if (res != null) user.userPrivateInformation.age = res;
                    });
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20 * SizeConfig.widthMultiplier),
                    child: Text(
                      user.userPrivateInformation.age.toString(),
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
                  onTap: () async {
                    //var res = await
                    Navigator.push(
                        context,
                        PageTransition(
                            child: SelectLanguage(),
                            type: PageTransitionType.fade));
                    // setState(() {
                    //   user.userPrivateInformation.nativeLanguage = res;
                    // });
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 6 * SizeConfig.widthMultiplier),
                    child: Text(
                      user.userPrivateInformation.nativeLanguage + ' >',
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

class MyLearning extends StatefulWidget {
  @override
  _MyLearningState createState() => _MyLearningState();
}

class _MyLearningState extends State<MyLearning> {
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
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: Text(
              'My learning',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 3 * SizeConfig.heightMultiplier),
            ),
          ),
          InkWell(
            onTap: () async {
              var res = await Navigator.push(
                  context,
                  PageTransition(
                      child: SelectAccent(), type: PageTransitionType.fade));
              setState(() {
                if (res != null) user.learnSetting.accent = res;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Accent',
                      style: TextStyle(
                          fontSize: 2.5 * SizeConfig.heightMultiplier)),
                  Text(
                    user.learnSetting.accent,
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
                      type: PageTransitionType.fade));
            },
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Practice goal',
                      style: TextStyle(
                          fontSize: 2.5 * SizeConfig.heightMultiplier)),
                  Text(
                    user.learnSetting.practiceGoal.toString() + ' min/day',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 2.5 * SizeConfig.heightMultiplier),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Translation',
                      style: TextStyle(
                          fontSize: 2.5 * SizeConfig.heightMultiplier)),
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
            onTap: () async {
              var res = await Navigator.push(
                  context,
                  PageTransition(
                      child: SelectReminder(), type: PageTransitionType.fade));
              setState(() {
                if (res != null) {
                  user.learnSetting.reminder = res;
                }
              });
            },
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Reminder',
                      style: TextStyle(
                          fontSize: 2.5 * SizeConfig.heightMultiplier)),
                  Text(
                    '0' +
                        user.learnSetting.reminder.hour.toString() +
                        ":" +
                        '0' +
                        user.learnSetting.reminder.minute.toString(),
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
