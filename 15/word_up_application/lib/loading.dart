import 'package:flutter/material.dart';
import 'package:word_up_application/main.dart';
import 'package:word_up_application/size_config.dart';

import 'app_manager.dart';
import 'home/home_screen.dart';
import 'introduction_screen/introduction_screen.dart';

class Loading extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{
  bool loadFinished;

  @override void initState() {
    loadFinished = false;
    _load().then((value) => {
      setState(() {
        loadFinished = true;
      })
    });
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  Future<void> _load() async{
    await AppManager.instance.init();
  }
  @override
  Widget build(BuildContext context) {
    return (!loadFinished) ? Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text('EVocab', style: TextStyle(fontSize: 4 * SizeConfig.heightMultiplier, color: Colors.white),),
      ),
    ) : ((AppManager.firstTimeUse) ? IntroductionScreen() : Home());
  }
}