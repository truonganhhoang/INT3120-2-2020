import 'package:flutter/material.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/size_config.dart';
import 'game_box.dart';
import 'game.dart';

class PlayGameScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlayGameScreenState();
}

class _PlayGameScreenState extends State<PlayGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: CommonComponents.background,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
                height: 80 * SizeConfig.heightMultiplier,
                //height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: games.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GameList(context, index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
