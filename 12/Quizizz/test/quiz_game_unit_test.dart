import 'package:quiztest/services/api_manager.dart';
import 'package:test/test.dart';

void main() {
  test("API quiz id wrong return null", () {
    var result = API_Manager().fetchQuestionByQuiz("quizID");
    expect(result, null);
  });
}
