import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiztest/models/models.dart';
import 'package:quiztest/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    } else {
      return null;
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
    } else
      return null;
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

  Future<void> postGame(
      String quizID, List<int> listAns, bool isDone, String userID) async {
    var urlPostGame = url + "/v1/save-game/PostSaveGame";
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      "ListAnsweredQuest": listAns,
      "QuizID": quizID,
      "UserID": userID
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    final response = await http.post(urlPostGame,
        headers: headers, body: jsonBody, encoding: encoding);
    if (response.statusCode == 200) {
      print("post save game ok");
    }
  }

  Future<List<SaveGame>> fetchSaveGame(String userID) async {
    var urlGetSaveGame = url + "/v1/save-game/GetAllSaveGameOfUser/" + userID;
    final response = await http.get(urlGetSaveGame);
    List<SaveGame> games = List<SaveGame>();
    if (response.statusCode == 200) {
      Map list = json.decode(response.body);
      list.forEach((key, value) {
        games.add(SaveGame.fromJson(value, key));
        print(key);
      });
      return games;
    }
  }

  Future<Quiz> fetchQuizByID(String quizID) async {
    var urlGetQuiz = url + "/v1/quiz/GetAQuiz/" + quizID;
    final response = await http.get(urlGetQuiz);
    if (response.statusCode == 200) {
      return Quiz.fromJson(json.decode(response.body), quizID);
    }
  }

  Future<void> postCompletedQuiz(
      String quizID, String userID, int correctAns, int wrongAns) async {
    var urlPostQuiz = url + "/v1/quiz/PostDoneQuiz";
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      "WrongAns": wrongAns,
      "RightAns": correctAns,
      "QuizID": quizID,
      "UserID": userID
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    final response = await http.post(urlPostQuiz,
        headers: headers, body: jsonBody, encoding: encoding);
    if (response.statusCode == 200) {
      print("post quiz done ok");
    }
  }

  Future<List<DoneQuiz>> fetchDoneQuiz(String userID) async {
    var urlGetDoneQuiz = url + "/v1/quiz/GetAllDoneQuizOfUser/" + userID;
    final response = await http.get(urlGetDoneQuiz);
    List<DoneQuiz> quiz = List<DoneQuiz>();
    if (response.statusCode == 200) {
      Map list = json.decode(response.body);
      list.forEach((key, value) {
        quiz.add(DoneQuiz.fromJson(value, key));
      });
      return quiz;
    }
  }

  Future<void> updateRunQuiz(List<int> ans, String key) async {
    var urlPutRunQuiz = url + "/v1/save-game/UpdateSaveGame/" + key;
    final headers = {'Content-Type': 'application/json'};
    final encoding = Encoding.getByName('utf-8');
    final body = json.encode(ans);
    final response = await http.put(urlPutRunQuiz,
        headers: headers, body: body, encoding: encoding);
    if (response.statusCode == 200) {
      print("update success" + response.body);
    }
  }

  Future<void> deleteSaveGame(String saveGameID) async {
    var urlDeleteSaveGame = url + "/v1/save-game/DeleteSaveGame/" + saveGameID;
    final response = await http.delete(urlDeleteSaveGame);
    if (response.statusCode == 200) {
      print("delete success");
    }
  }

  Future<void> updateUserName(String userName) async {
    final pref = await SharedPreferences.getInstance();
    final userId = pref.getString("userId");
    var urlPostUser = url + "/v1/user/UpdateUser" + userId;
    Map<String, String> body = {"Username": userName};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    final headers = {'Content-Type': 'application/json'};
    final response = await http.put(urlPostUser,
        headers: headers, body: jsonBody, encoding: encoding);
    if (response.statusCode == 200) {
      print("Update user name");
    }
  }

  Future<List<dynamic>> getMapParticipants(String code) async {
    var urlGetMapParticipant = url + "/v1/host/GetAHost/" + code;
    final response = await http.get(urlGetMapParticipant);
    if (response.statusCode == 200) {
      Map<String, dynamic> res = json.decode(response.body);
      print(res);
      Map<String, dynamic> mapParticipants = res['MapParticipant'];
      print(mapParticipants);
      print(mapParticipants.values.toList());
      return mapParticipants.values.toList();
    }
  }
}
