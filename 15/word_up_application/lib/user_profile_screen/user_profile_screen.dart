import 'package:flutter/material.dart';
import 'package:word_up_application/user_profile_screen/about_me_screen.dart';
import 'package:word_up_application/user_profile_screen/my_learning_screen.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserProfileScreen();
}

class _UserProfileScreen extends State<UserProfileScreen> {
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('My Account'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 0.9999999999999998),
                stops: [0.0, 0.5104166865348816, 1.0],
                colors: [
                  Color.fromARGB(255, 52, 206, 255),
                  Color.fromARGB(255, 138, 206, 255),
                  Color.fromARGB(255, 243, 254, 255)
                ],
              ),
            ),
          ),
          new Container(
            padding: EdgeInsets.only(left: 0, top: 45, right: 0, bottom: 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(Icons.account_circle, size: 70),
                        radius: 50,
                        backgroundColor: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Text('Estimated total knowledge', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                Text('5933', style: TextStyle(color: Colors.blue[900], fontSize: 20),),
                                Text('words', style: TextStyle(color: Colors.grey[700], fontSize: 20),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          decoration: new BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('540', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20
                                ),
                              ),
                              Text('I knew', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: new BoxDecoration(
                            color: Colors.yellow[700],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('27', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                              ),
                              Text('Learning', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: new BoxDecoration(
                            color: Colors.red[700],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('30', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                              ),
                              Text('To learn', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 427,
                  margin: EdgeInsets.only(right: 3, left: 3),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                    ),
                  ),
                  child: Column(
                    children: [
                      AboutMe(),
                      MyLearning(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
