import 'package:bucha_app/widgets/sentence/sentenceDetail.dart';
import 'package:bucha_app/widgets/sentence/sentenceList.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('navigate next sentence test', (WidgetTester tester) async {
    await Firebase.initializeApp();
    await tester.pumpWidget(sentenceDetail(topic: 'Câu nói thông dụng',));
    expect(find.text('CÂU NÓI THÔNG DỤNG'), findsOneWidget);
    expect(find.text('HỌC BÀI'), findsNothing);

    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pump();
    expect(find.text('NGHĨA'), findsOneWidget);

  });

  testWidgets('expanded item test', (WidgetTester tester) async {
    await Firebase.initializeApp();
    await tester.pumpWidget(sentenceList(topic: 'Câu nói thông dụng',));
    expect(find.text('CÂU NÓI THÔNG DỤNG'), findsOneWidget);
    expect(find.text('HỌC BÀI'), findsNothing);

    await tester.tap(find.byKey(Key('initialItem')));
    await tester.pump();
    expect(find.byKey(Key('expandedItem')), findsOneWidget);
  });
}
