import 'package:flutter/material.dart';
import 'package:quiztest/main.dart';

class Challenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.black,
      child: SafeArea(
          child: Column(
        children: [
          PauseExit(),
          EnterGameCode(),
          Settings(size: size),
          Button(size: size),
        ],
      )),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: size.width * 0.075),
      alignment: Alignment.centerLeft,
      child: Text(
        "Settings",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class EnterGameCode extends StatelessWidget {
  const EnterGameCode({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Your Quizizz name is",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 55,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(44, 210, 110, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Enter",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PauseExit extends StatelessWidget {
  const PauseExit({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 62,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route) => false);
                },
                child: Text(
                  "Exit",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Text(
                "123456",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
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
