
import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_up_application/games/fish_tank_game/death_screen.dart';
import 'package:word_up_application/home/home_screen.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/selection_screen/selection_screen.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/study_home_screen/show_examples.dart';
import 'package:word_up_application/study_home_screen/study_home_screen.dart';
import 'package:word_up_application/word.dart';



void main(){
  test('Test change title of Home Screen', (){
    var title = new TitleHome(title: 'This is Test');
    expect(title.title, 'This is Test');
  });

  test('Test score of GameFishTank', (){
    var score = 10;
    var deathGame = DeathScreen(score: score,);
    expect(deathGame.score, 10);
  });

  testWidgets('Test gameOver screen for game fish tank', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: DeathScreen(score: 20,)));
    final titleFinder = find.text('GAME OVER');
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Test if the title is displayed on the screen or not', (WidgetTester tester) async{
    Home.titleHome = TitleHome(title: 'Hello');
    await tester.pumpWidget(MaterialApp(home: TitleHome(title: 'Hello')));
    final titleFinder = find.text('Hello');
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Test word''s examples are displayed in word box', (WidgetTester tester) async{
    SizeConfig.screenWidth = 800;
    var examples = ['This is a funny test', 'Hello Test'];
    await tester.pumpWidget(MaterialApp(home: ShowExamples(listExamples: examples,)));
    final exampleOneFinder = find.text('This is a funny test');
    expect(exampleOneFinder, findsOneWidget);
  });
}

