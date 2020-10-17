import 'package:flutter/material.dart';
import 'package:quiztest/views/activity/completed.dart';
import 'package:quiztest/views/activity/running.dart';
import 'package:quiztest/views/components/appbar.dart';

class Activity extends StatefulWidget {
  final Widget child;
  Activity({Key key, this.child}) : super(key: key);
  _Activity createState() => _Activity();
}

class _Activity extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppBar(
              height: size.height * 2,
              namePage: "Activity",
              tabs: TabBar(
                isScrollable: false,
                indicatorColor: Colors.orange,
                indicatorWeight: 6,
                onTap: (index) {
                  setState(() {});
                },
                tabs: [
                  Tab(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            child: Stack(children: [
                    Positioned(
                        left: 25,
                        top: 10,
                        child: Image(
                          image: AssetImage("assets/icons/hour_glass_1.png"),
                        ),
                    ),
                    Positioned(
                        top: 10,
                        right: 25,
                        child: Text(
                          "Running",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                    )
                  ])),
                      )),
                  Tab(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                        child: Stack(children: [
                      Positioned(
                        left: 25,
                        top: 10,
                        child: Image(
                          image: AssetImage("assets/icons/clock 2.png"),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Text(
                          "Completed",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      )
                    ])),
                  )),
                ],
              )),
          body: TabBarView(
            children: [Running(), Completed()],
          ),
        ));
  }
}
