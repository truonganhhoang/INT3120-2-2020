import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/selection_screen/selection_screen.dart';
import 'package:word_up_application/services/database_server_handler.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/user.dart';
import 'home/home_screen.dart';
import 'learn_a_word_screen/learn_a_word_screen.dart';
import 'user_profile_screen/user_profile_screen.dart';
import 'word.dart';
import 'favorite_screen/favorite_words_screen.dart';
import 'package:device_preview/device_preview.dart';

bool isTestResponsiveMode = true;

void main() {
  AppUser user = new AppUser(
    idUser: '1122817271',
    userPrivateInformation: UserPrivateInformation(
        age: 25,
        avatarUrl: 'https://ibb.co/T0BPtr9',
        email: 'trinh@gmail.com',
        nativeLanguage: 'Vietnamese',
        userName: 'Trinh'
    ),

    learningProgress: LearningProgress(
        wordFavorite: [1,2,9,10],
        wordToLearn: [1,4,5,7,8,9,10,15],
        wordKnew: [
          WordKnew(
            wordId: 2,
            reviewDays: 3,
            reviewTimes: 0,
          ),
          WordKnew(
            wordId: 3,
            reviewDays: 3,
            reviewTimes: 1,
          ),
          WordKnew(
            wordId: 6,
            reviewDays: 3,
            reviewTimes: 0,
          ),
        ]
    ),
    learnSetting: LearnSetting(
      accent: 'British',
      practiceGoal: 20, // 20 words per day.
      reminder: Time(hour: 6, minute: 0),
    ),
  );

  DatabaseServerHandler.instance.postUser(user);
  runApp(
    (isTestResponsiveMode)
        ? DevicePreview(
            enabled: !kReleaseMode,
            builder: (context) => MyApp(),
          )
        : MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DatabaseHelper.instance.databaseInit();
    //DatabaseHelper.instance.getNWords(3);
    DatabaseHelper.instance.getListFarvoriteWords();

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          if (isTestResponsiveMode) {
            // this is device package
            return MaterialApp(
              locale: (isTestResponsiveMode)
                  ? DevicePreview.of(context).locale
                  : Locale(null),
              builder: (isTestResponsiveMode)
                  ? DevicePreview.appBuilder
                  : build(context),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: Home(key),
            );
          } else {
            // default app
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: Home(key),
            );
          }
        });
      },
    );
  }
}
