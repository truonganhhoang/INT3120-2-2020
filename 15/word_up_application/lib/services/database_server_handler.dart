import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:word_up_application/local_database/database_local_helper.dart';
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

  void updateWordToLearn(idUser) async{
    print("update WordToLearn");
    List<dynamic> wordToLearn = await DatabaseLocalHelper.instance.getToLearnWords();
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
  void updateWordKnew(idUser) async{
    print("update WordKnew");
    List<dynamic> wordKnew = await DatabaseLocalHelper.instance.getKnewWords();
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
  void updateWordFavorite(idUser) async{
    print("update WordFavorite");
    List<dynamic> wordFavorite = await DatabaseLocalHelper.instance.getFavoriteWords();
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
  void updateWordLearning(idUser) async{
    print("update WordLearning");
    List<dynamic> wordLearning = await DatabaseLocalHelper.instance.getLearningWords();
    Map<String, dynamic> toJson() => {
      'wordLearning': wordLearning,
    };
    String linkTo = firebaseLink + idUser + '/learningProgress.json';
    http.patch(
      linkTo,
      body: jsonEncode(toJson()),
    );
  }

  void updateLearnSetting(idUser) async{
    print("update LearningSetting");
    //LearnSetting learnSetting;
    Time reminder = Time(hour: 6, minute: 10);
    LearnSetting learnSetting1 = LearnSetting(accent: "Vietnamese",
      practiceGoal: 15,
      reminder: reminder,
      translation: "Vietnamese",
      );
    List<dynamic> learnSetting2 = await DatabaseLocalHelper.instance.getLearningSetting();
    Map<String, dynamic> toJson() =>
        {
          'learnSetting': learnSetting1,
        };
    String linkTo = firebaseLink + idUser + ".json" ;
    http.patch(
      linkTo,
      body: jsonEncode(toJson()),
    );
  }

  void updateUserPrivateInformation(idUser) async{
    print("update UserPrivateInformation");
    // UserPrivateInformation userPrivateInformation = UserPrivateInformation(age: 21,
    //   avatarUrl: "https://ibb.co/T0BPtr9",
    //   email: "kisibongdem@gmail.com",
    //   nativeLanguage: "Vietnamese",
    //   userName: "Kị Sĩ Bóng Đêm",
    // );
    List<dynamic> userPrivateInformation = await DatabaseLocalHelper.instance.getUserPrivateInformation();
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
