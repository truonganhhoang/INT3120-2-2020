import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import "api_manager.dart";
import 'package:quiztest/models/models.dart';

class UserSave {
  Future<void> saveId() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("userId") == null) {
      final user = await API_Manager().postUser("User Name");
      prefs.setString("userId", user.id);
    }
  }
}
