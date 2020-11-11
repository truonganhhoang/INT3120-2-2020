
import 'package:shared_preferences/shared_preferences.dart';
import 'package:word_up_application/user.dart';

class AppManager {
  static bool firstTimeUse = true;
  static final AppManager instance = AppManager._internal();

  AppUser appUser;
  factory AppManager() {
    return instance;
  }

  AppManager._internal();

  Future<void> init() async{
    _loadCounter();
  }

  _loadCounter() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    firstTimeUse = prefs.getBool('firstTimeUse');
    await prefs.setBool('firstTimeUse', false);
  }
}