import 'package:bucha_app/widgets/Grammar/GrammarData/Example.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/GrammarUnit.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/Information.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/InformationTitle.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/Subtitle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bucha_app/main.dart';

void main() {
  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  Example example = new Example(name: 'Example', meaning: 'vi du');
  Information information = new Information(name: 'information', example: [example], note: ['note']);
  Subtitle subtitle = new Subtitle(name: 'subtitle', information: [information]);
  InformationTitle title = new InformationTitle(name: 'title', subtitle: [subtitle]);

  testWidgets('Example Widget', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: example));

    expect(find.text('Example'), findsOneWidget);
    expect(find.text('vi du'), findsOneWidget);
  });

  testWidgets('Information Widget', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: information));

    expect(find.text('information'), findsOneWidget);
    expect(find.byType(Example), findsOneWidget);
    expect(find.text('note'), findsOneWidget);
  });

  testWidgets('Subtitle Widget', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: subtitle));

    expect(find.text('subtitle'), findsOneWidget);
    expect(find.byType(Information), findsOneWidget);
  });

  testWidgets('Title Widget', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: title));

    expect(find.text('title'), findsOneWidget);
    expect(find.byType(Subtitle), findsOneWidget);
  });

  testWidgets('Grammar page test', (WidgetTester tester) async {
    await Firebase.initializeApp();
    await tester.pumpWidget(GrammarUnit());
  });
}