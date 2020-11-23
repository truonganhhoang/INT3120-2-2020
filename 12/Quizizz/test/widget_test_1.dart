import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiztest/views/home/home_page.dart';

void main() {
  Widget makeTesableWidget({Widget child}) {
    return Material(
      child: child,
    );
  }

  testWidgets('Setting test', (WidgetTester tester) async {
    EnterCode enterCode = new EnterCode();
    await tester.pumpWidget(makeTesableWidget(child: enterCode));

    expect(find.text("Join a game"), findsOneWidget);

  });
}
