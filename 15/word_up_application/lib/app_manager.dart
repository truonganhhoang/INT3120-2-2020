import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:word_up_application/services/auth_service.dart';
import 'package:word_up_application/user.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';

class AppManager {
  static bool firstTimeUse = true;
  static final AppManager instance = AppManager._internal();

  AppUser appUser;
  factory AppManager() {
    return instance;
  }

  void setAppUser(AppUser appUser, String json) {
    print('PPP' + appUser.learningProgress.wordLearning[0].wordId.toString());
    this.appUser = appUser;
    print(json);
    String appUserJson = this.appUser.toJson().toString();
    saveAppUser(json);
    print(appUserJson);
    syncDataToLocal();
  }

  void saveAppUser(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('appUser', data);
  }

  AppManager._internal();

  Future<void> init() async {
    _loadData();
  }

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    firstTimeUse = prefs.getBool('firstTimeUse');
    await prefs.setBool('firstTimeUse', false);
    if (AuthService.instance.auth.currentUser != null) {
      String appUserStr = prefs.getString('appUser');
      Map<String, dynamic> appUserJson = json.decode(appUserStr.trim());
      appUser = AppUser.fromJson(appUserJson);
    }
  }

  void syncDataToLocal() {
      DatabaseLocalHelper dbHelper = DatabaseLocalHelper.instance;
      dbHelper.resetDatabase();
      List<int> firebaseWordFavorite = appUser.learningProgress.wordFavorite;
      List<int> firebaseWordKnew = appUser.learningProgress.wordKnew;
      List<WordLearning> firebaseWordLearning = appUser.learningProgress
          .wordLearning;
      List<int> firebaseWordToLearn = appUser.learningProgress.wordToLearn;

      print('AAA' + firebaseWordLearning.toString());
      for (int i = 0; i < firebaseWordFavorite.length; i++) {
        dbHelper.updateInsertFavoriteWord(firebaseWordFavorite[i]);
      }

      for (int i = 0; i < firebaseWordToLearn.length; i++) {
        dbHelper.insertToLearnWord(firebaseWordToLearn[i]);
      }

      for (int i = 0; i < firebaseWordLearning.length; i++){
        print(firebaseWordLearning[i].wordId);
        dbHelper.insertLearningWord(firebaseWordLearning[i].wordId, firebaseWordLearning[i].reviewDate
            , firebaseWordLearning[i].reviewTimes);
      }

      for (int i = 0; i < firebaseWordKnew.length; i++) {
        dbHelper.insertKnewWord(firebaseWordKnew[i]);
      }
  }
}
