import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiztest/models/models.dart';
import 'package:quiztest/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API_Manager {
  Future<List<Topic>> fetchTopic() async {
    var urlGetTopic = url + "/v1/topic/GetAll";
    print(urlGetTopic);
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
    var urlGetQuiz = url + "/v1/quiz/SearchQuiz?key=" + name;
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

  Future<User> postUser(String userName) async {
    var urlPostUser = url + "/v1/user/PostUser";
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {"UserName": userName};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    final response = await http.post(urlPostUser,
        headers: headers, body: jsonBody, encoding: encoding);
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    }
  }

  Future<String> getUserName(String userID) async {
    var urlGetUser = url + "/v1/user/GetUser/" + userID;
    final response = await http.get(urlGetUser);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseJson = json.decode(response.body);
      return responseJson["UserName"];
    }
  }

  Future<String> getHostCode(String quizId) async {
    var urlPost = url + "/v1/host/PostHost";
    final headers = {'Content-Type': 'application/json'};
    final pref = await SharedPreferences.getInstance();
    final userId = pref.getString("userId");
    final encoding = Encoding.getByName('utf-8');
    Map<String, String> postBody = {"Owner": userId, "QuizID": quizId};
    String body = json.encode(postBody);
    final response = await http.post(urlPost,
        headers: headers, body: body, encoding: encoding);
    if (response.statusCode == 200) {
      Map<String, dynamic> hostCode = json.decode(response.body);
      return hostCode['Id'];
    }
  }

  Future<SaveGame> postGame(
      String quizID, List<int> listAns, bool isDone, String userID) async {
    var urlPostGame = url + "/v1/save-game/PostSaveGame";
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      "ListAnsweredQuest": listAns,
      "QuizDone": isDone,
      "QuizID": quizID,
      "UserID": userID
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    final response = await http.post(urlPostGame,
        headers: headers, body: jsonBody, encoding: encoding);
    print("post game");
    if (response.statusCode == 200) {
      print("post save game ok");
    }
  }
}
