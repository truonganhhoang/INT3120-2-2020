
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:word_up_application/services/auth_service.dart';
import 'package:word_up_application/user.dart';

class AppManager {
  static bool firstTimeUse = true;
  static final AppManager instance = AppManager._internal();

  AppUser appUser;
  factory AppManager() {
    return instance;
  }

  void setAppUser(AppUser appUser, String json){
    print('xxx');
    this.appUser = appUser;
    print(json);
    String appUserJson = this.appUser.toJson().toString();
    saveAppUser(json);
    print(appUserJson);
  }

  void saveAppUser(String data) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('appUser', data);
  }

  AppManager._internal();

  Future<void> init() async{
    _loadData();
  }

  _loadData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    firstTimeUse = prefs.getBool('firstTimeUse');
    await prefs.setBool('firstTimeUse', false);

    if(AuthService.instance.auth.currentUser != null){
      String appUserStr = prefs.getString('appUser');
      Map<String,dynamic> appUserJson  = json.decode(appUserStr.trim());
      appUser = AppUser.fromJson(appUserJson);
    }
  }
}