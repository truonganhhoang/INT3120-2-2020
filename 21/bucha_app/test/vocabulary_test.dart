import 'file:///E:/INT3120-2-2020/21/bucha_app/lib/widgets/Vocabulary/SceneChoice.dart';
import 'file:///E:/INT3120-2-2020/21/bucha_app/lib/widgets/Vocabulary/ScenePlay.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('navigate next sentence test', (WidgetTester tester) async {
    await Firebase.initializeApp();
    await tester.pumpWidget(ScenePlay(level: '1', scene: 'class1',));
    expect(find.text('Hello'), findsOneWidget);
    expect(find.text('people'), findsNothing);

    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pump();
    expect(find.text('Chơi game'), findsOneWidget);

  });

  testWidgets('expanded item test', (WidgetTester tester) async {
    await Firebase.initializeApp();
    await tester.pumpWidget(ScenePlay(scene: 'class2',));
    expect(find.text('Lớp 1'), findsOneWidget);
    expect(find.text('Lớp 2'), findsNothing);

    await tester.tap(find.byKey(Key('initialItem')));
    await tester.pump();
    expect(find.byKey(Key('expandedItem')), findsOneWidget);
  });
}