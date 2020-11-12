import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:word_up_application/user.dart';

class DatabaseServerHandler {
  final String firebaseLink = "https://worduptest-af6ce.firebaseio.com/Users/";
  // Singleton Design
  static final DatabaseServerHandler instance =
      DatabaseServerHandler._internal();
  final dbRef =
      FirebaseDatabase.instance.reference().child("Users").child('822817271');

  factory DatabaseServerHandler() {
    return instance;
  }

  DatabaseServerHandler._internal();

  Future<void> getAllUsers() async {
    dbRef.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      print(values);
    });
  }

  void postUser(AppUser user) {
    String linkToUser = firebaseLink + user.idUser + '.json';
    http.put(
      linkToUser,
      body: jsonEncode(user.toJson()),
    );
  }

  void updateWordToLearn(idUser){
    print("update WordToLearn");
    List<int> wordToLearn = [1,2,3,4,5];
    Map<String, dynamic> toJson() => {
    'wordToLearn': wordToLearn,
    };
    print(toJson());
    String linkPatch = firebaseLink + idUser + '/learningProgress.json';
    http.patch(
      linkPatch,
      body: jsonEncode(toJson()),
    );
  }
  void updateWordKnew(idUser){
    print("update WordKnew");
    List<int> wordKnew = [6,7,8,9,10,15];
    Map<String, dynamic> toJson() => {
      'wordKnew': wordKnew,
    };
    print(toJson());
    String linkPatch = firebaseLink + idUser + '/learningProgress.json';
    http.patch(
      linkPatch,
      body: jsonEncode(toJson()),
    );
  }
  void updateWordFavorite(idUser){
    print("update WordFavorite");
    List<int> wordFavorite = [1,4,6,7,8,9,10,15];
    Map<String, dynamic> toJson() => {
      'wordFavorite': wordFavorite,
    };
    print(toJson());
    String linkPatch = firebaseLink + idUser + '/learningProgress.json';
    http.patch(
      linkPatch,
      body: jsonEncode(toJson()),
    );
  }
  void updateWordLearning(idUser){
    print("update WordLearning");
    WordLearning wordLearning = WordLearning(wordId: 1,
      reviewDate: 15,
      reviewTimes: 7,);
    List<WordLearning>  currentLearningProgress = [
      wordLearning];
    Map<String, dynamic> toJson() => {
      'wordLearning': currentLearningProgress,
    };
    String linkTo = firebaseLink + idUser + '/learningProgress.json';
    http.patch(
      linkTo,
      body: jsonEncode(toJson()),
    );
  }

  void updateLearnSetting(idUser){
    print("update LearningSetting");
    Time reminder = Time(hour: 6, minute: 10);
    LearnSetting learnSetting = LearnSetting(accent: "Vietnamese",
      practiceGoal: 15,
      reminder: reminder,
      translation: "Vietnamese",
      );
    Map<String, dynamic> toJson() => {
      'learnSetting': learnSetting,
    };
    String linkTo = firebaseLink + idUser + ".json" ;
    http.patch(
      linkTo,
      body: jsonEncode(toJson()),
    );
  }

  void updateUserPrivateInformation(idUser){
    print("update UserPrivateInformation");
    UserPrivateInformation userPrivateInformation = UserPrivateInformation(age: 21,
      avatarUrl: "https://ibb.co/T0BPtr9",
      email: "kisibongdem@gmail.com",
      nativeLanguage: "Vietnamese",
      userName: "Kị Sĩ Bóng Đêm",
    );
    Map<String, dynamic> toJson() => {
      'userPrivateInformation': userPrivateInformation,
    };
    String linkTo = firebaseLink + idUser + ".json" ;
    http.patch(
      linkTo,
      body: jsonEncode(toJson()),
    );
  }
}
