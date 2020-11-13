import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/home/home_screen.dart';
import 'package:word_up_application/size_config.dart';

import 'fish_tank_game.dart';

class DeathScreen extends StatelessWidget {
  final int score;

  DeathScreen({
    this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CommonComponents.bgFishTankGame,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('GAME OVER',
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 5 * SizeConfig.heightMultiplier,
              ),),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text('Your score: ' + score.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 2.6 * SizeConfig.heightMultiplier,
                  ),),
                ),
              ),
             SizedBox(
               height: 100,
             ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Colors.green.withOpacity(1),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FishTankGame(),
                            ));
                      },
                      child: Container(
                        width: 15 * SizeConfig.heightMultiplier,
                        padding: EdgeInsets.symmetric(vertical: 25),
                        child: Center(
                          child: Text(
                            'Restart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 2.5 * SizeConfig.heightMultiplier,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Colors.green.withOpacity(1),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: Home(),
                            ));
                      },
                      child: Container(
                        width: 15 * SizeConfig.heightMultiplier,
                        padding: EdgeInsets.symmetric(vertical: 25),
                        child: Center(
                          child: Text(
                            'Home',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 2.5 * SizeConfig.heightMultiplier,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
