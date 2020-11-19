import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quiztest/main.dart';
import 'package:quiztest/services/api_manager.dart';
void main(List<String> args) {
  test("Test fetch topic ", () {
    var result = API_Manager().fetchTopic();
    expect(result, null);
  });
   test("Test fetch done quiz ", () {
    var result = API_Manager().fetchDoneQuiz("");
    expect(result, null);
  });
}