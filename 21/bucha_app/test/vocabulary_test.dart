import 'package:bucha_app/ChonMan.dart';
import 'package:bucha_app/Man.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('navigate next sentence test', (WidgetTester tester) async {
    await Firebase.initializeApp();
    await tester.pumpWidget(ManChoi(level: '1', scene: 'class1',));
    expect(find.text('Hello'), findsOneWidget);
    expect(find.text('people'), findsNothing);

    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pump();
    expect(find.text('Chơi game'), findsOneWidget);

  });

  testWidgets('expanded item test', (WidgetTester tester) async {
    await Firebase.initializeApp();
    await tester.pumpWidget(ChonMan(scene: 'class2',));
    expect(find.text('Lớp 1'), findsOneWidget);
    expect(find.text('Lớp 2'), findsNothing);

    await tester.tap(find.byKey(Key('initialItem')));
    await tester.pump();
    expect(find.byKey(Key('expandedItem')), findsOneWidget);
  });
}