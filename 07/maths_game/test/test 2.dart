// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:maths_game/main.dart';
import 'package:maths_game/SettingsScreen.dart';
import 'package:maths_game/TrueOrFalseScreen.dart';
import 'package:maths_game/TimeScreen.dart';
import 'package:maths_game/GameModeScreen.dart';
import 'package:maths_game/QuizScreen.dart';
import 'package:maths_game/KienThucScreen.dart';
import 'package:maths_game/ResultScreen.dart';

void main() {
  testWidgets('Main test', (WidgetTester tester) async {
    await tester.pumpWidget(MathsApp());
    var screen = MainScreen();
    BuildContext context;
    screen.build(context);
    screen.playMusic();
  });

  testWidgets('TrueOrFalse test', (WidgetTester tester) async {
    BuildContext context;
    var screen = TrueOrFalseScreen('plus');
    expect(screen.calculation,'plus');
    var screen2 = screen.createState();
    screen2.build(context);
    screen2.getData(2,1, 'plus');
  });

  testWidgets('Quiz test', (WidgetTester tester) async {
    BuildContext context;
    var screen = QuizScreen('plus');
    expect(screen.calculation,'plus');
    var screen2 = screen.createState();
    screen2.build(context);
  });

  testWidgets('Time test', (WidgetTester tester) async {
    await tester.runAsync(() async {
      BuildContext context;
      var screen = TimeScreen('plus');
      expect(screen.calculation,'plus');
      var screen2 = screen.createState();
      screen2.nextQuestion();
      screen2.build(context);
    });
  });
}