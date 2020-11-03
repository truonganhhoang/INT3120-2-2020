import 'package:shared_preferences/shared_preferences.dart';
import "api_manager.dart";
import 'package:quiztest/models/models.dart';

class UserSave {
  Future<void> saveId(String userName) async {
    final prefs = await SharedPreferences.getInstance();
    User user = await API_Manager().postUser(userName);
    if (prefs.getString("userId") == null) {
      prefs.setString("userId", user.id);
      print(user.id);
    } else {
      print("Exist ID");
    }
  }

  Future<String> userName() async {
    final prefs = await SharedPreferences.getInstance();
    String userID = await prefs.getString("userId");
    var userName = await API_Manager().getUserName(userID);
    return userName;
  }
}
