import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:word_up_application/app_manager.dart';
import 'package:word_up_application/services/database_server_handler.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'database_server_handler.dart';

import '../user.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookLogin facebookLogin = FacebookLogin();

  static final AuthService instance = AuthService._internal();

  factory AuthService() {
    return instance;
  }

  AuthService._internal();

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount == null) return null;
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      loginSuccessful();
      return '$user';
    }
    return null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    AppManager.instance.appUser = null;
    print("User Signed Out");
  }

  Future<String> signInWithFacebook() async {
    final result = await facebookLogin.logIn(['email']);
    print('xxx');
    if (result.status != FacebookLoginStatus.loggedIn) return null;
    print('xxx');
    final AuthCredential credential = FacebookAuthProvider.credential(
      result.accessToken.token,
    );

    final UserCredential authResult =
        await auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithFacebook succeeded: $user');
      loginSuccessful();
      return '$user';
    }
    return null;
  }

  void loginSuccessful(){
    syncDataUser();
  }
  void syncDataUser() {
    String rawJson;
    var user = auth.currentUser;
    final ref =
        FirebaseDatabase.instance.reference().child("Users").child(user.uid);
    ref.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      if (values != null) {
        print("Exist");
        rawJson = jsonEncode(values);
        Map map = jsonDecode(rawJson);
        AppUser currentAppUser;
        currentAppUser = AppUser.fromJson(map);
        AppManager.instance.setAppUser(currentAppUser, rawJson);
        // Now we have currentUser
      } else {
        print("Not Exist");
        AppUser newUser = new AppUser(
          idUser: user.uid,
          userPrivateInformation: UserPrivateInformation(
              age: 0,
              avatarUrl: user.photoURL,
              email: user.email,
              nativeLanguage: 'Vietnamese',
              userName: user.displayName),
          learningProgress: LearningProgress(
            wordFavorite: [0],
            wordToLearn: [0],
            wordKnew: [0],
            wordLearning: [
              WordLearning(
                wordId: 0,
                reviewDate: 0,
                reviewTimes: 0,
              ),
            ],
          ),
          learnSetting: LearnSetting(
            accent: 'British',
            practiceGoal: 0, // 20 words per day.
            reminder: Time(hour: 0, minute: 0),
          ),
        );
        DatabaseServerHandler.instance.postUser(newUser);
        // Now we add newUser
      }
    });
  }
}
