import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiztest/main.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/services/user.dart';
import 'package:quiztest/views/setting/setting_music.dart';
import 'package:quiztest/services/api_manager.dart';

class PauseWhilePlaying extends StatefulWidget {
  PauseWhilePlaying(
      {Key key,
      this.questionsRemaining,
      this.totalQuestions,
      this.answered,
      this.quizID,
      this.userID})
      : super(key: key);
  final int questionsRemaining;
  final int totalQuestions;
  final List<int> answered;
  final String quizID;
  final String userID;
  @override
  _PauseWhilePlayingState createState() => _PauseWhilePlayingState();
}

class _PauseWhilePlayingState extends State<PauseWhilePlaying> {
  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        color: Colors.black,
        child: Container(
          width: size.width * 0.85,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image(
                        image: AssetImage('assets/icons/play.png'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AlertWhilePlaying(
                                answered: widget.answered,
                                quizID: widget.quizID,
                                userID: widget.userID,
                              );
                            });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 62,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(196, 196, 196, 0.4),
                        ),
                        child: Text(
                          'Exit',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: size.width * 0.85,
                height: size.height * 0.15,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(196, 196, 196, 0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: LinearPercentIndicator(
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2500,
                        percent:
                            widget.questionsRemaining / widget.totalQuestions,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.redAccent,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Text(
                      "${widget.totalQuestions - widget.questionsRemaining} question remaining",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: size.width * 0.075),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: size.width * 0.85,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(196, 196, 196, 0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SettingWhilePlaying(
                      icon: Icons.music_note,
                      title: "Music",
                    ),
                    SettingWhilePlaying(
                      icon: Icons.volume_down_sharp,
                      title: "Sound",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingWhilePlaying extends StatefulWidget {
  const SettingWhilePlaying({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;

  @override
  _SettingWhilePlayingState createState() => _SettingWhilePlayingState();
}

class _SettingWhilePlayingState extends State<SettingWhilePlaying> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            widget.icon,
            color: Colors.white,
            size: 30,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "${widget.title}",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Switch(
            value: isSwitched,
            onChanged: (bool value) => {
              setState(() => {isSwitched = value})
            },
            activeColor: Colors.lightBlueAccent,
            activeTrackColor: Colors.grey,
          )
        ],
      ),
    );
  }
}

class AlertWhilePlaying extends StatelessWidget {
  const AlertWhilePlaying({Key key, this.answered, this.userID, this.quizID})
      : super(key: key);
  final List<int> answered;
  final String quizID;
  final String userID;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Exit this game"),
      content:
          Text("You can rejoin this game again and won't lose any progress."),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel")),
        TextButton(
          onPressed: () {
            API_Manager().postGame(quizID, answered, false, userID);
            print("API_Manager().postGame(quizID, answered, false, userID)");
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Home()),
                (Route<dynamic> route) => false);
          },
          child: Text("Exit"),
        )
      ],
    );
  }
}
