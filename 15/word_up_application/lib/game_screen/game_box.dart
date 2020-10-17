import 'package:flutter/material.dart';
import 'package:word_up_application/size_config.dart';
import 'game.dart';

Widget GameList(BuildContext context, int index) {
  final primary = Colors.indigo;
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.5 * SizeConfig.heightMultiplier),
      color: Colors.white,
    ),
    width: double.infinity,
    height: 13 * SizeConfig.heightMultiplier,
    margin: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier,
        horizontal: 2 * SizeConfig.heightMultiplier),
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
  );
}
