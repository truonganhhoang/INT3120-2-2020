import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:word_up_application/user.dart';
class DatabaseServerHandler{
  final String firebaseLink = "https://worduptest-af6ce.firebaseio.com/Users/";

  // Singleton Design
  static final DatabaseServerHandler instance = DatabaseServerHandler._internal();

  factory DatabaseServerHandler() {
    return instance;
  }

  DatabaseServerHandler._internal();

  void postUser(AppUser user) {
    String linkToUser = firebaseLink + user.idUser + '.json';
    http.put(
      linkToUser,
      body: jsonEncode(user.toJson()),
    );
  }
}