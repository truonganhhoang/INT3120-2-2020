
import 'package:shared_preferences/shared_preferences.dart';

class AppManager {
  static bool firstTimeUse = false;
  static final AppManager instance = AppManager._internal();

  factory AppManager() {
    return instance;
  }

  AppManager._internal();

  void init(){
    print(122);
    _loadCounter();
  }

  _loadCounter() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    firstTimeUse = prefs.getBool('firstTimeUse') ?? false;
  }
}