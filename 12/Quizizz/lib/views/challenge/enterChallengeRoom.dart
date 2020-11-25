import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/views/play_screen/pauseWhilePlaying.dart';
import 'package:quiztest/main.dart';

class EnterChallengeRoom extends StatefulWidget {
  const EnterChallengeRoom({Key key, this.hostCode, this.quiz})
      : super(key: key);
  final String hostCode;
  final Quiz quiz;

  @override
  _EnterChallengeRoomState createState() => _EnterChallengeRoomState();
}

class _EnterChallengeRoomState extends State<EnterChallengeRoom> {
  List<dynamic> listParticipants = [];
  @override
  void initState() {
    API_Manager().getMapParticipants(widget.hostCode).then((value) {
      listParticipants = value;
      print(value.length);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.black,
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PauseWhilePlaying(
                                      totalQuestions:
                                          widget.quiz.numberOfQuestion,
                                      questionsRemaining: 0,
                                    )));
                      },
                      child: Image(
                        image: AssetImage('assets/icons/pause.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 160),
                      width: 107,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(196, 196, 196, 0.24)),
                      child: Text(
                        widget.hostCode,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await API_Manager()
                            .deleteHost(widget.hostCode)
                            .then((_) => {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => Home()),
                                      (Route<dynamic> route) => false)
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
                margin: EdgeInsets.only(top: 80),
                child: Text("Enter the code",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    )),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 150,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  widget.hostCode,
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 162,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(177, 72, 180, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Start game",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                width: 290,
                height: 86,
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(196, 196, 196, 0.4),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: StoreConnector<String, String>(
                        converter: (store) => store.state,
                        builder: (context, store) => Text(
                          store,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      child: Image(
                        image: AssetImage('assets/icons/officer.png'),
                        width: 45,
                        height: 45,
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: listParticipants.length,
                itemBuilder: (context, index) => Container(
                  width: 290,
                  height: 86,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(196, 196, 196, 0.4),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: StoreConnector<String, String>(
                          converter: (store) => store.state,
                          builder: (context, store) => Text(
                            store,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        child: Image(
                          image: AssetImage('assets/icons/officer.png'),
                          width: 45,
                          height: 45,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 48,
                    ),
                    onPressed: () {
                      setState(() {
                        API_Manager()
                            .getMapParticipants(widget.hostCode)
                            .then((value) => listParticipants = value);
                      });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
