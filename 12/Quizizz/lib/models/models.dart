import 'dart:convert';

class Topic {
  final String name;
  final String key;
  Topic({this.name, this.key});

  factory Topic.fromJson(Map<String, dynamic> json, String key) {
    return Topic(name: json['Name'], key: key);
  }
}

class Quiz {
  final String name;
  final int numberOfQuestion;
  final String key;
  Quiz({this.name, this.key, this.numberOfQuestion});

  factory Quiz.fromJson(Map<String, dynamic> json, String key) {
    return Quiz(
        name: json['Name'],
        numberOfQuestion: json['NumberOfQuestion'],
        key: key);
  }
}

class Questional {
  final String key;
  final int answer;
  final String question;
  final String choice1;
  final String choice2;
  final String choice3;
  final String choice4;

  Questional(
      {this.answer,
      this.choice1,
      this.choice2,
      this.choice3,
      this.choice4,
      this.question,
      this.key});
  factory Questional.fromJson(Map<String, dynamic> json, String key) {
    return Questional(
        answer: json["Answer"],
        choice1: json["Choice1"],
        choice2: json["Choice2"],
        choice3: json["Choice3"],
        choice4: json["Choice4"],
        key: key,
        question: json["Question"]);
  }
}

class User {
  final String id;
  User({this.id});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json["Id"]);
  }
}

class SaveGame {
  final String quizID;
  final List<dynamic> listAns;
  final String userID;
  final String key;

  SaveGame({this.quizID, this.listAns, this.userID, this.key});
  factory SaveGame.fromJson(Map<String, dynamic> json, String key) {
    return SaveGame(
        quizID: json["QuizID"],
        listAns: json["ListAnsweredQuest"],
        userID: json["UserID"],
        key: key);
  }
}

class AnswerData {
  final int chooseAns;
  final int correctAns;
  AnswerData({this.chooseAns, this.correctAns});
}

class DoneQuiz {
  final String quizID;
  final int wrongAns;
  final int correctAns;
  final String userID;
  final String key;
  DoneQuiz(
      {this.quizID, this.wrongAns, this.correctAns, this.userID, this.key});

  factory DoneQuiz.fromJson(Map<String, dynamic> json, String key) {
    return DoneQuiz(
        quizID: json["QuizID"],
        wrongAns: json["WrongAns"],
        correctAns: json["RightAns"],
        userID: json["UserID"],
        key: key);
  }
}
