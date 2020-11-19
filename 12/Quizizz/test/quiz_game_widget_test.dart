import 'package:flutter_test/flutter_test.dart';
import 'package:quiztest/views/play_screen/quiz_game.dart';

void main(List<String> args) {
  testWidgets("Test question script", (WidgetTester tester) async {
    await tester.pumpWidget(Question(question: "Hello"));
    expect(find.text("Hello"), findsOneWidget);
  });
}
