import 'package:flutter/material.dart';
import 'package:word_up_application/size_config.dart';

class SelectPracticeGoal extends StatefulWidget {
  @override
  _SelectPracticeGoalState createState() => _SelectPracticeGoalState();
}

class _SelectPracticeGoalState extends State<SelectPracticeGoal> {
  List<int> practiceGoal = new List();

  @override
  void initState() {
    super.initState();
    setState(() {
      practiceGoal.add(5);
      practiceGoal.add(10);
      practiceGoal.add(15);
      practiceGoal.add(20);
      practiceGoal.add(30);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Practice Goal'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8 * SizeConfig.heightMultiplier),
                child: Text(
                  'Your learning goal?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4 * SizeConfig.heightMultiplier),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context, 5);
                  },
                  minWidth: 80 * SizeConfig.widthMultiplier,
                  height: 10 * SizeConfig.heightMultiplier,
                  color: Colors.blue[200],
                  highlightColor: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.grey)),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Casual >> ' +
                            practiceGoal[0].toString() +
                            ' min / day',
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.0*SizeConfig.heightMultiplier),
                        child: Text(
                          'Learn 600 words / year',
                          style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4 * SizeConfig.heightMultiplier),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context, 10);
                  },
                  minWidth: 80 * SizeConfig.widthMultiplier,
                  height: 10 * SizeConfig.heightMultiplier,
                  color: Colors.blue[200],
                  highlightColor: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.grey)),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Regular >> ' +
                            practiceGoal[1].toString() +
                            ' min / day',
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.0*SizeConfig.heightMultiplier),
                        child: Text(
                          'Learn 1100 words / year',
                          style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4 * SizeConfig.heightMultiplier),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context, 15);
                  },
                  minWidth: 80 * SizeConfig.widthMultiplier,
                  height: 10 * SizeConfig.heightMultiplier,
                  color: Colors.blue[200],
                  highlightColor: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.grey)),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Serious >> ' +
                            practiceGoal[2].toString() +
                            ' min / day',
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.0*SizeConfig.heightMultiplier),
                        child: Text(
                          'Learn 1500 words / year',
                          style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4 * SizeConfig.heightMultiplier),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context, 20);
                  },
                  minWidth: 80 * SizeConfig.widthMultiplier,
                  height: 10 * SizeConfig.heightMultiplier,
                  color: Colors.blue[200],
                  highlightColor: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.grey)),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Champion >> ' +
                            practiceGoal[3].toString() +
                            ' min / day',
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.0*SizeConfig.heightMultiplier),
                        child: Text(
                          'Learn 1800 words / year',
                          style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4 * SizeConfig.heightMultiplier),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context, 30);
                  },
                  minWidth: 80 * SizeConfig.widthMultiplier,
                  height: 10 * SizeConfig.heightMultiplier,
                  color: Colors.blue[200],
                  highlightColor: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.grey)),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Shakespeare >> ' +
                            practiceGoal[4].toString() +
                            ' min / day',
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.0*SizeConfig.heightMultiplier),
                        child: Text(
                          'Learn 2500 words / year',
                          style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
