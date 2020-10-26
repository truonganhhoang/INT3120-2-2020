import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiztest/models/models.dart';
import 'package:quiztest/constants/constants.dart';

class API_Manager {
  Future<List<Topic>> fetchTopic() async {
    var urlGetTopic = url + "/v1/topic/GetAll";
    final response = await http.get(urlGetTopic);
    List<Topic> topics = List<Topic>();
    if (response.statusCode == 200) {
      Map list = json.decode(response.body);
      list.forEach((key, value) {
        topics.add(Topic.fromJson(value, key));
      });
      return topics;
    }
  }

  Future<List<Quiz>> fetchQuizByTopic(String topicID) async {
    var urlGetQuiz = url + "/v1/quiz/GetAllQuizInTopic/" + topicID;
    final response = await http.get(urlGetQuiz);
    List<Quiz> quizzes = List<Quiz>();
    if (response.statusCode == 200) {
      Map list = json.decode(response.body);
      list.forEach((key, value) {
        quizzes.add(Quiz.fromJson(value, key));
      });
      return quizzes;
    }
  }

  Future<List<Questional>> fetchQuestionByQuiz(String quizID) async {
    var urlGetQs = url + "/v1/quiz/GetAllQuest/" + quizID;
    final response = await http.get(urlGetQs);
    List<Questional> questions = List<Questional>();
    if (response.statusCode == 200) {
      Map list = json.decode(response.body);
      list.forEach((key, value) {
        questions.add(Questional.fromJson(value, key));
      });
      return questions;
    }
  }

  Future<List<Quiz>> searchQuiz(String name) async {
    var urlGetQuiz = url + "/v1/quiz/SearchQuiz/" + name;
    final response = await http.get(urlGetQuiz);
    List<Quiz> quizzes = List<Quiz>();
    if (response.statusCode == 200) {
      Map list = json.decode(response.body);
      list.forEach((key, value) {
        quizzes.add(Quiz.fromJson(value, key));
      });
      return quizzes;
    }
  }
}
