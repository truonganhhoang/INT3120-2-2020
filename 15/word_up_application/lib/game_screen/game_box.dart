import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:word_up_application/games/fish_tank_game/fish_tank_game.dart';
import 'package:word_up_application/size_config.dart';
import 'game.dart';

Widget GameList(BuildContext context, int index) {
  final primary = Colors.indigo;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.5 * SizeConfig.heightMultiplier),
      ),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      onPressed: (){
        if(index == 0) Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: FishTankGame(),
            ));
      },
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: 13 * SizeConfig.heightMultiplier,

        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier,
            horizontal: 2 * SizeConfig.heightMultiplier),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                  width: 7 * SizeConfig.heightMultiplier,
                  height: 7 * SizeConfig.heightMultiplier,
                  margin: EdgeInsets.only(right: 1.5 * SizeConfig.heightMultiplier),
                  child: Image(
                      image: AssetImage('assets/images/' + games[index]['image']))),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    games[index]['title'],
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 2.4 * SizeConfig.textMultiplier),
                  ),
                  Text(games[index]['description'],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 2 * SizeConfig.textMultiplier,
                          letterSpacing: .3)),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
