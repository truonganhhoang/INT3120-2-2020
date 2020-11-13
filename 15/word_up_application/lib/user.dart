import 'dart:convert';
import 'package:flutter/cupertino.dart';

class AppUser {
  String idUser;
  UserPrivateInformation userPrivateInformation;
  LearnSetting learnSetting;
  LearningProgress learningProgress;

  AppUser({
    this.idUser,
    this.userPrivateInformation,
    this.learningProgress,
    this.learnSetting,
  });

  Map<String, dynamic> toJson() => {
        'idUser': this.idUser,
        'userPrivateInformation': this.userPrivateInformation,
        'learnSetting': this.learnSetting,
        'learningProgress': this.learningProgress,
      };

  AppUser.fromJson(Map<String, dynamic> json)
      : idUser = json['idUser'],
        userPrivateInformation = UserPrivateInformation.fromJson(
            json[UserPrivateInformation.idFirebase]),
        learningProgress =
            LearningProgress.fromJson(json[LearningProgress.idFirebase]),
        learnSetting = LearnSetting.fromJson(json[LearnSetting.idFirebase]);
}

class UserPrivateInformation {
  static String idFirebase = "userPrivateInformation";
  int age;
  String avatarUrl = "";
  String email;
  String nativeLanguage;
  String userName;

  Map<String, dynamic> toJson() => {
        'age': this.age,
        'avatarUrl': avatarUrl,
        'email': email,
        'nativeLanguage': nativeLanguage,
        'userName': userName,
      };

  UserPrivateInformation.fromJson(Map<String, dynamic> json)
      : age = json['age'],
        avatarUrl = json['avatarUrl'],
        email = json['email'],
        nativeLanguage = json['nativeLanguage'],
        userName = json['userName'];

  UserPrivateInformation(
      {this.avatarUrl,
      this.age,
      this.email,
      this.nativeLanguage,
      this.userName});
}

class LearnSetting {
  static String idFirebase = "learnSetting";
  String accent; // British accent or American accent.
  int practiceGoal; // Muc tieu nguoi dung huong den., so phut 1 ngay.
  Time reminder; // Thoi gian nhac nho viec hoc => Gui thong bao
  String translation;

  LearnSetting(
      {this.accent, this.practiceGoal, this.reminder, this.translation});

  Map<String, dynamic> toJson() => {
        'accent': this.accent,
        'practiceGoal': this.practiceGoal,
        'reminder': this.reminder,
        'translation': this.translation,
      };

  LearnSetting.fromJson(Map<String, dynamic> json)
      : accent = json['accent'],
        practiceGoal = json['practiceGoal'],
        translation = json['translation'],
        reminder = Time.fromJson(json['reminder']);
}

class LearningProgress {
  // Qua trinh hoc, so tu, thong ke...
  static String idFirebase = "learningProgress";
  int estimateWords;
  List<int> wordFavorite = new List<int>();
  List<int> wordToLearn = new List<int>();
  List<int> wordKnew = new List<int>();
  List<WordLearning> wordLearning = new List<WordLearning>();

  LearningProgress(
      {@required this.wordFavorite,
      @required this.wordToLearn,
      @required this.wordKnew,
      @required this.wordLearning});

  Map<String, dynamic> toJson() => {
        'wordFavorite': this.wordFavorite,
        'wordToLearn': this.wordToLearn,
        'wordKnew': this.wordKnew,
        'wordLearning': this.wordLearning,
      };

  LearningProgress.fromJson(Map<String, dynamic> json)
      : wordFavorite = json['wordFavorite'].cast<int>(),
        wordToLearn = json['wordToLearn'].cast<int>(),
        wordKnew = json['wordKnew'].cast<int>(),
        wordLearning = json['wordLearning'].cast<WordLearning>();
}

class WordLearning {
  int reviewDate; // So ngay can review
  int reviewTimes; // So lan da review
  int wordId;

  WordLearning({
    this.reviewDate,
    this.reviewTimes,
    @required this.wordId,
  });

  Map<String, dynamic> toJson() => {
        'reviewDays': this.reviewDate,
        'reviewTimes': this.reviewTimes,
        'wordId': this.wordId,
      };

  WordLearning.fromJson(Map<String, dynamic> json)
      : reviewTimes = json['reviewTimes'],
        reviewDate = json['reviewDate'],
        wordId = json['wordId'];
}

class Time {
  int hour; // 0 <= hour <= 23
  int minute; // 0 <= minute <= 60;
  Time({
    @required this.hour,
    @required this.minute,
  });

  Map<String, dynamic> toJson() => {
        'hour': this.hour,
        'minute': this.minute,
      };

  Time.fromJson(Map<String, dynamic> json)
      : hour = json['hour'],
        minute = json['minute'];
}

// This is an example
void main(List<String> args) {
  /* This is a test */
  // Define a User
  AppUser user = new AppUser(
    idUser: '822817271',
    userPrivateInformation: UserPrivateInformation(
        age: 15,
        avatarUrl: 'https://ibb.co/T0BPtr9',
        email: 'truong@gmail.com',
        nativeLanguage: 'Vietnamese',
        userName: 'Truong'),
    learningProgress: LearningProgress(wordFavorite: [
      1,
      2,
      9,
      10
    ], wordToLearn: [
      1,
      4,
      5,
      7,
      8,
      9
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
        reviewTimes: 0,
      ),
    ]),
    learnSetting: LearnSetting(
      accent: 'British',
      practiceGoal: 20, // 20 words per day.
      reminder: Time(hour: 6, minute: 0),
    ),
  );

  // Convert to json:
  var json = jsonEncode(user.toJson());
  print(json.toString());

  // From json to object:
  String jsonString =
      '{"idUser":"12","userPrivateInformation":{"age":15,"avatarUrl":"https://ibb.co/T0BPtr9","email":"truong@gmail.com","nativeLanguage":"Vietnamese","userName":"Truong"},"learnSetting":{"accent":"British","practiceGoal":20,"reminder":{"hour":6,"minute":0},"translation":null},"learningProgress":{"wordFavorite":[1,2,9,10],"wordToLearn":[1,4,5,7,8,9],"wordKnew":[{"reviewDays":3,"reviewTimes":0,"wordId":2},{"reviewDays":3,"reviewTimes":1,"wordId":3},{"reviewDays":3,"reviewTimes":0,"wordId":6}]}}';
  Map jsonMap = jsonDecode(jsonString);
  AppUser user1;
  user1 = AppUser.fromJson(jsonMap);
  // Now we have a user1
}
