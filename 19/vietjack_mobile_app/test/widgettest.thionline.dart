import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietjack_mobile_app/UI/MyCustomCard.dart';
import 'package:vietjack_mobile_app/ThiOnline.dart';

void main() async {
  // testWidgets('ThiOnline test', (WidgetTester tester) async {
  //   await tester.pumpWidget(ThiOnline());
  //   var screen = ThiOnline();
  //   var testState = screen.createState();
  //   BuildContext context;
  //   testState.build(context);
  //   testState.getData();
  //   expect(ThiOnline.detailArray.length, isNot(equals(0)));
  // });
  testWidgets('Change Subject test', (WidgetTester tester) async {
    var screen = MyCustomCard();
    screen.updateCurrentSubject("Toán");
    expect(screen.currentSubject, equals("Toán"));
  });

  testWidgets('Check First Run test', (WidgetTester tester) async {
    var screen = ThiOnline();
    screen.notFirstRun();
    expect(screen.firstRun, isNot(equals(0)));
  });
}
