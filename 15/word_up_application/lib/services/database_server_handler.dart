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

  void updateLearnProgress(idUser) {
    LearningProgress currentLearningProgress = LearningProgress(wordFavorite: [
      1,
      2,
      9,
      10
    ], wordToLearn: [
      1,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      15
    ], wordKnew: [
      10,
      12,
      15
    ], wordLearning: [
      WordLearning(
        wordId: 2,
        reviewDate: 3,
        reviewTimes: 0,
      ),
      WordLearning(
        wordId: 3,
        reviewDate: 3,
        reviewTimes: 1,
      ),
      WordLearning(
        wordId: 6,
        reviewDate: 3,
        reviewTimes: 2,
      ),
    ]);
    // Doc duoc cai currentLearningProgress.
    // => Put current len firebase.
    // child...child(currentLearningProgress.idFirebase);
    String linkTo = firebaseLink + idUser + '/learningProgress.json';
    http.put(
      linkTo,
      body: jsonEncode(currentLearningProgress.toJson()),
    );
  }
}